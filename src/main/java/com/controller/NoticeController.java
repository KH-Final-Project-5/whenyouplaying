package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

    //공지사항(유저)
    @RequestMapping("/noticemain.do")
    public String noticeMain() {
    	
    	
    	
    	
    	
    	
    	return "user/noticeListUser";
    }
    
    //공지사항(관리자)
    @RequestMapping("/noticemainadmin.do")
    public String noticeMainAdmin() {
    	
    	
    	
    	return "admin/noticeListAdmin";
    }
    

    //공지사항 등록
    @RequestMapping("/noticeform.do")
    public String noticeForm() {
    	
    	return "admin/noticeWrite";
    }
    
    
    
    
    
}
