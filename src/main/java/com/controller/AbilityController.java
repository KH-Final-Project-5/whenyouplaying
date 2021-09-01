package com.controller;

import com.biz.AbilityBiz;
import com.commons.FtpClient;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.AbilityDto;
import com.commons.Criteria;
import com.dto.MessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AbilityController {

    @Autowired
    AbilityBiz biz;

    @Autowired
    FtpClient ftpClient;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping("/abilityregi.do")
    public void abilityregi(HttpServletResponse response, AbilityDto dto) throws Exception {


        String id = dto.getUsId().trim().substring(3, dto.getUsId().length()).trim();


        System.out.println(dto.getFile1().getSize());
        System.out.println(dto.getFile2().getSize());


        if (dto.getFile1().getSize() > 0) {
            MultipartFile mfile1 = dto.getFile1();
            if (mfile1 != null) {
                String filename1 = mfile1.getOriginalFilename();
                String refilename = ftpClient.fileName(filename1, id);

                System.out.println(id);

                dto.setAbImg1("http://wjwan0.dothome.co.kr/stoarge/" + id + "/" + refilename);
                File file1 = ftpClient.convert(mfile1);
                ftpClient.upload(file1, filename1, id);
            }
        } else {
            dto.setAbImg1("a");
        }

        if (dto.getFile2().getSize() > 0) {
            MultipartFile mfile2 = dto.getFile2();

            if (mfile2 != null) {
                String filename2 = mfile2.getOriginalFilename();
                String refilename = ftpClient.fileName(filename2, id);

                dto.setAbImg2("http://wjwan0.dothome.co.kr/stoarge/" + id + "/" + refilename);
                File file2 = ftpClient.convert(mfile2);
                ftpClient.upload(file2, filename2, id);
            }
        } else {
            dto.setAbImg2("b");
        }


        int res = biz.AbilityInsert(dto);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "신청 완료했습니다.", "main.do");
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
            dto.setAbDate(format.parse(date));
        }

        model.addAttribute("abList", list);
        model.addAttribute("pageMaker", pageMaker);

        return "admin/abilityMain";
    }

    @RequestMapping("/abilitydetail.do")
    public String abilityDetail(Model model, int abNo) {


        model.addAttribute("dto", biz.AbilityDetail(abNo));


        return "admin/abilityCheck";
    }

    @RequestMapping(value = "/ajaxapprove.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> ajaxApprove(@RequestBody AbilityDto dto) {

        int res = 0;

        boolean check = false;

        res = biz.AbilityApprove(dto);

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/abilitynega.do")
    public void abilityNega(HttpServletResponse response, MessageDto messageDto, AbilityDto abilityDto) throws IOException {

        System.out.println(abilityDto.getUsNo());

        biz.AbilityNega(messageDto, abilityDto);

        ScriptUtils.alertAndMovePage(response, "승인 거부 완료", "abilitymain.do");


    }

    @RequestMapping("/ajaxabilitymain.do")
    public String ajaxabilitymain(Criteria criteria, Model model) {

        if (criteria.getChange().equals("a")) {
            criteria.setChange("승인 완료");
        } else if (criteria.getChange().equals("b")) {
            criteria.setChange("승인 거절");
        } else {
            criteria.setChange("승인 대기");
        }

        List<AbilityDto> list = biz.AjaxAbilityListPaging(criteria);


        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(biz.AjaxAbilityListCount(criteria));

        model.addAttribute("abList", list);
        model.addAttribute("pageMaker", pageMaker);

        return "admin/abilityMain";
    }
}
