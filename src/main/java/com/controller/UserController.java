package com.controller;


import com.biz.UserBiz;
import com.dto.AbilityDto;
import com.dto.UserDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
    @Autowired
    UserBiz biz;

    //mainpage
    @RequestMapping("/main.do")
    public String main() {
        return "user/main";
    }

    //로그인 페이지
    @RequestMapping("/loginform.do")
    public String loginForm() {

        return "user/login";
    }

    
    @RequestMapping("/login.do")
    public String login(HttpSession session, UserDto dto) {

        UserDto userDto = null;

        userDto = biz.login(dto);

        if (userDto != null) {
            session.setAttribute("user", userDto);
            return "redirect:main.do";
        } else {
            return "redirect:loginform.do";
        }

    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:main.do";
    }

    @RequestMapping("/talentform.do")
    public String talentForm() {
        return "user/abilityRegister";
    }
    
    
    //id/pw 찾기
    @RequestMapping("/finduser.do")
    public String findUser() {
    	logger.info("finduser.do : id/pw 찾는 페이지 이동");
    	return "user/loginSearch";
    }
    
    
    

}
