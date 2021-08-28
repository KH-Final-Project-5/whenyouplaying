package com.controller;

import com.biz.AbilityBiz;
import com.commons.ScriptUtils;
import com.dto.AbilityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AbilityController {

    @Autowired
    AbilityBiz biz;

    @RequestMapping("/abilityregi.do")
    public void abilityregi(HttpServletResponse response, AbilityDto dto, @RequestParam int usNo) throws IOException {
        System.out.println(dto.getAbContent());

        int res = biz.AbilityInsert(dto, usNo);

        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "입력 완료", "main.do");
        } else {
            ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
        }


    }

}
