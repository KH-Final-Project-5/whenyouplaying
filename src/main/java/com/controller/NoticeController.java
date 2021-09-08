package com.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.NoticeBiz;
import com.dto.NotificationDto;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeBiz biz;
	
    //공지사항목록(유저)
    @RequestMapping("/noticemain.do")
    public String noticeMain() {
    	
    	
    	
    	
    	
    	
    	return "user/noticeListUser";
    }
    
    //공지사항목록(관리자)
    @RequestMapping("/noticemainadmin.do")
    public String noticeMainAdmin(Model model, int usNo) {
    	
    	model.addAttribute("noticeList", biz.noticeList(usNo));
    	
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
    
    //공지사항 디테일(관리자)
    @RequestMapping("/noticeDetailAdmin.do")
    public String noticeDetailAdmin(Model model, int notiNo) {
    	
    	logger.info("noticeDetailAdmin.do : 공지사항 디테일 조회(관리자)");
    	
    	model.addAttribute("noticeDetail", biz.noticeOne(notiNo));
    	
    	return "admin/noticeDetailAdmin";
    }
    
    
    //공지사항 수정(관리자)
    @RequestMapping("/noticeupdate.do")
    public String noticeUpdate(Model model, int notiNo) {
    	
    	logger.info("noticeupdate.do : 공지사항 수정페이지 이동(관리자)");
    	
    	model.addAttribute("noticeDetail", biz.noticeOne(notiNo));
    	
    	return "admin/noticeUpdate";
    }
    
    //수정결과
    @RequestMapping("/noticeupdateres.do")
    public String noticeUpdateRes(NotificationDto dto) {
    	
    	logger.info("noticeupdateres.do : 공지사항 수정 결과 적용");
    	
    	int res = biz.updateNotice(dto);
    		
    	if(res>0) {
    		return "redirect:noticeDetailAdmin.do?notiNo="+dto.getNotiNo();
    	}else {
    		return "redirect:noticeupdate.do?notiNo="+dto.getNotiNo();
    	}
    	
    }
    
    
    
    
    
}
