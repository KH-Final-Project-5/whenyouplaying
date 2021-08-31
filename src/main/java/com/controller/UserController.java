package com.controller;


import com.biz.UserBiz;
import com.commons.ScriptUtils;
import com.dto.AbilityDto;
import com.dto.UserDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
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
    
    @RequestMapping("/regiform.do")
  public String regiFrom() {
    	

        return "user/regi";
    }
    
    @RequestMapping("/regi.do")
    public String regi(UserDto dto) {
    	
    	int res = biz.regi(dto);
    	
    	if (res > 0) {
    		return "redirect:main.do";
    	}else {
        	return "redirect:regi.do";
    	}
    	

    	
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
    
    
    //id/pw 찾기 form
    @RequestMapping("/finduser.do")
    public String findUser() {
    	logger.info("finduser.do : id/pw 찾는 페이지 이동");
    	return "user/loginSearch";
    }
    
    //id찾기
    @RequestMapping("/findId.do")
    public void findId(HttpServletResponse response, UserDto dto) {
    	
    	logger.info("findId.do : id찾기");
    	
    	String usId = null;
    	
    	usId = biz.findId(dto);
    	
    	try {
			if(usId == null) {
				ScriptUtils.alertAndMovePage(response, "일치하는 id가 없습니다. 다시 입력해주세요.", "finduser.do");
			}else {
				ScriptUtils.alertAndMovePage(response, "id는 "+usId+"입니다.", "loginform.do");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    
    //pw찾기
    @RequestMapping("/findpw.do")
    public void findPw(HttpServletResponse response, UserDto dto) {
    	
    	logger.info("findpw.do : pw찾기");
    	
    	String resPw = null;
    	
    	resPw = biz.findPw(dto);
    	
    	try {
			if(resPw == null) {
				ScriptUtils.alertAndMovePage(response, "일치하는 pw가 없습니다. 다시 입력해주세요.", "finduser.do");
			}else {
				ScriptUtils.alertAndMovePage(response, "pw는 "+resPw+"입니다.", "loginform.do");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    //회원정보 수정
    @RequestMapping("/useredit.do")
    public String userEdit() {
    	
    	logger.info("useredit.do : 회원정보수정 이동");
    	return "user/userInfo";
    }
    
    //회원정보 수정결과
    @RequestMapping("/usereditres.do")
    public void userEditRes(HttpServletResponse response, UserDto dto, String usPhone1, String usPhone2, String usPhone3) {
    	
    	logger.info("usereditres.do : 회원정보수정 결과값 db 적용");

    	String usPhone = usPhone1+usPhone2+usPhone3;
    	
    	dto.setUsPhone(usPhone);
    	
    	int res = 0;
    	
    	res = biz.userEdit(dto);
    	
    	try {
			if(res>0) {
				ScriptUtils.alertAndMovePage(response, "회원정보가 수정되었습니다, 다시 로그인해주세요.", "logout.do");
			}else {
				ScriptUtils.alert(response, "회원정보 수정실패");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    

    
    
    
    
    

}
