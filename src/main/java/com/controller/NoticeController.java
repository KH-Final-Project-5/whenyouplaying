package com.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.NoticeBiz;
import com.dto.NotificationDto;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeBiz biz;
	
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
    
    @RequestMapping("/insertnotice.do")
    public String insertNotice(NotificationDto dto) {
    	
    	logger.info("updatenotice.do : 공지사항 추가(업데이트)");
    	
    	int res = biz.insertNotice(dto);
    	
    	if(res>0) {
    		return "redirect:noticemainadmin.do";
    	}else {
    		return "redirect:noticeform.do";
    	}
    	
    	
    }
    
    
    
    
    
}
