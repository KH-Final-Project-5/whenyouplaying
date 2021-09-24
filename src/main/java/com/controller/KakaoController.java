package com.controller;


import java.util.Map;
import javax.servlet.http.HttpSession;

import com.biz.UserBiz;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {
	 @Autowired
	 UserBiz biz;
	 
    @Autowired
    private KakaoService kakaoService;

    @RequestMapping("/kakaologin.do")
    public String home(@RequestParam(value = "code", required = false) String code, Model model,HttpSession session) {
        System.out.println("########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        System.out.println("######access_Token##### : " + access_Token);
        Map<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        UserDto dto = new UserDto();
        dto.setUsEmail((String) userInfo.get("email"));
        dto.setUsName((String) userInfo.get("nickname"));
        dto.setUsPw((String) userInfo.get("id"));
        dto.setUsId((String) userInfo.get("email"));
        model.addAttribute("userInfo", dto);
        dto = biz.login(dto);


        if (dto == null) {
            return "user/regiKakao";
        } else {
            session.setAttribute("user", dto);

            return "redirect:main.do";

        }



    }
}