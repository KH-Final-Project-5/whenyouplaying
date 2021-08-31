package com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.MyPageBiz;
import com.commons.Criteria;
import com.commons.PageMaker;

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
	
	
	@RequestMapping("/cashrecord.do")
	public String cashRecord(Model model, Criteria cri, int usNo) {
		
		logger.info("cashrecord.do : 충전내역확인 페이지 이동");
		
		cri.setUsNo(usNo);
		
		model.addAttribute("chargeList", biz.chargeList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.chargeListCount(usNo));
		
		
		model.addAttribute("chargePageMaker", pageMaker);
		
		return "mypage/rechargeHistory";
	}
	
}
