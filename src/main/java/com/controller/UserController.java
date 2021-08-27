package com.controller;


import com.commons.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/loginform.do")
    public String login() {
        return "user/login";
    }

}
