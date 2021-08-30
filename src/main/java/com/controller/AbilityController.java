package com.controller;

import com.biz.AbilityBiz;
import com.commons.FtpClient;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.AbilityDto;
import com.commons.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class AbilityController {

    @Autowired
    AbilityBiz biz;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping("/abilityregi.do")
    public void abilityregi(HttpServletResponse response, AbilityDto dto) throws Exception {

        FtpClient ftpClient =
                new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");

        if (dto.getFile1() == null && dto.getFile2() == null) {
            String id = dto.getUsId().trim().substring(3, dto.getUsId().length()).trim();


            MultipartFile mfile1 = dto.getFile1();
            MultipartFile mfile2 = dto.getFile2();

            if (mfile1 != null) {
                String filename1 = mfile1.getOriginalFilename();
                String refilename = ftpClient.fileName(filename1, id);

                dto.setAbImg1("wjwan0.dothome.co.kr/stoarge/" + id + "/" + refilename);
                File file1 = ftpClient.convert(mfile1);
                ftpClient.upload(file1, filename1, id);
            } else {
                dto.setAbImg1(null);
            }

            if (mfile2 != null) {
                String filename2 = mfile2.getOriginalFilename();
                String refilename = ftpClient.fileName(filename2, id);

                dto.setAbImg2("wjwan0.dothome.co.kr/stoarge/" + id + "/" + refilename);
                File file2 = ftpClient.convert(mfile2);
                ftpClient.upload(file2, filename2, id);
            } else {
                dto.setAbImg2(null);
            }
        } else {
            dto.setAbImg1("a");
            dto.setAbImg2("a");
        }




        int res = biz.AbilityInsert(dto);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "입력 완료", "main.do");
        } else {
            ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
        }
    }


    @RequestMapping("/abilitymain.do")
    public String abilitymain(Model model, Criteria criteria) throws ParseException {

        List<AbilityDto> list = biz.AbilityListPaging(criteria);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(biz.AbilityListCount());

        for (AbilityDto dto : list) {
            String date = format.format(dto.getAbDate());
//            System.out.println(date);
            dto.setAbDate(format.parse(date));
        }

        model.addAttribute("abList", list);
        model.addAttribute("pageMaker", pageMaker);

        return "admin/abilityMain";
    }
}
