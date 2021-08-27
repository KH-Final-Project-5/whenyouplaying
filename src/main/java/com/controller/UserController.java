package com.controller;


import com.biz.UserBiz;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    UserBiz biz;

    @RequestMapping("/main.do")
    public String  main() {
        return "user/index";
    }

    @RequestMapping("/loginform.do")
    public String loginForm() {

        return "user/login";
    }

    @RequestMapping("/login.do")
    public String login(HttpSession session, UserDto dto) {

        UserDto userDto = null;

        userDto = biz.login(dto);

        if (userDto != null) {
            return "redirect:main.do";
        } else {
            return "redirect:loginform.do";
        }

    }
}
