package com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.MyPageBiz;

@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageBiz biz;
	
	@RequestMapping("/mypage.do")
	public String myPage(Model model, int usNo) {
		
		logger.info("mypage.do : 마이페이지 메인으로 이동");
		
		model.addAttribute("userDto", biz.selectUser(usNo));
		
		return "mypage/myPage";
		
	}
	
}
