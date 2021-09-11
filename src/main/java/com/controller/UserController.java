package com.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.ProjectBiz;
import com.biz.UserBiz;
import com.commons.ScriptUtils;
import com.dto.ReportDto;
import com.dto.ReviewDto;
import com.dto.UserDto;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserBiz biz;
    @Autowired
    ProjectBiz biz2;
    
    //mainpage
    @RequestMapping("/main.do")
    public String main(Model model) {
    	biz2.newest();
    	List<ReviewDto> list = biz2.newest(); 
    	model.addAttribute("list", list);
    	
    	biz2.popularity();
    	List<ReviewDto> list2 = biz2.popularity();
    	model.addAttribute("list2", list2);
    	
    	
        return "user/main";
    }

    //로그인 페이지
    @RequestMapping("/loginform.do")
    public String loginForm() {


        return "user/login";
    }

    //회원가입 페이지
    @RequestMapping("/regiform.do")
    public String regiFrom() {


        return "user/regi";
    }

    @RequestMapping("/regi.do")
    public void regi(HttpServletResponse response, UserDto dto, @RequestParam("usPhone2") String usPhone2, @RequestParam("usPhone3") String usPhone3) throws IOException {


        String phone = dto.getUsPhone() + usPhone2 + usPhone3;

        dto.setUsPhone(phone);


        int res = biz.regi(dto);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "회원가입 완료!", "loginform.do");
        }


    }

    @ResponseBody
    @RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
    public int idChk(UserDto dto) throws Exception {
        int res = biz.idChk(dto);
        return res;
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
    
    //구글 로그인
    @RequestMapping(value="/googlelogin.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
    public @ResponseBody String googleLogin(HttpSession session, UserDto dto) {
    	
    	UserDto userDto = null;
    	
    	userDto = biz.login(dto);
    	
    	if(userDto != null) {
    		session.setAttribute("user", userDto);
    		return "회원";
    	}else {
    		return "비회원";
    	}
    	
    }
    
    //구글 회원가입
    @RequestMapping("regigoogle.do")
    public String regiGoogle(Model model, UserDto dto) {
    	
    	model.addAttribute("googleInfo", dto);
    	
    	return "user/regiGoogle";
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
            if (usId == null) {
                ScriptUtils.alertAndMovePage(response, "일치하는 id가 없습니다. 다시 입력해주세요.", "finduser.do");
            } else {
                ScriptUtils.alertAndMovePage(response, "id는 " + usId + "입니다.", "loginform.do");
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
            if (resPw == null) {
                ScriptUtils.alertAndMovePage(response, "일치하는 pw가 없습니다. 다시 입력해주세요.", "finduser.do");
            } else {
                ScriptUtils.alertAndMovePage(response, "pw는 " + resPw + "입니다.", "loginform.do");
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

        String usPhone = usPhone1 + usPhone2 + usPhone3;

        dto.setUsPhone(usPhone);

        int res = 0;

        res = biz.userEdit(dto);

        try {
            if (res > 0) {
                ScriptUtils.alertAndMovePage(response, "회원정보가 수정되었습니다, 다시 로그인해주세요.", "logout.do");
            } else {
                ScriptUtils.alert(response, "회원정보 수정실패");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/reportpopup.do")
    public String ReportPopup(Model model, ReportDto dto) {

        model.addAttribute("dto", dto);


        return "user/reportPageForm";
    }
    
    

    
    
    
    
    
}
