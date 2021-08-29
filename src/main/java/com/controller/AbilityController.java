package com.controller;

import com.biz.AbilityBiz;
import com.commons.FtpClient;
import com.commons.ScriptUtils;
import com.dto.AbilityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class AbilityController {

    @Autowired
    AbilityBiz biz;

    @RequestMapping("/abilityregi.do")
    public void abilityregi(HttpServletResponse response, AbilityDto dto) throws Exception {

        FtpClient ftpClient =
                new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");

        MultipartFile mfile1 = dto.getFile1();
        MultipartFile mfile2 = dto.getFile2();

        String id = dto.getUsId().trim().substring(3, dto.getUsId().length()).trim();

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


        int res = biz.AbilityInsert(dto);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "입력 완료", "main.do");
        } else {
            ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
        }


    }

}
