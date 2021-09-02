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
	
	//마이페이지 메인
	@RequestMapping("/mypage.do")
	public String myPage(Model model, int usNo) {
		
		logger.info("mypage.do : 마이페이지 메인으로 이동");
		
		model.addAttribute("userDto", biz.selectUser(usNo));
		
		return "mypage/myPage";
		
	}
	
	//충전내역 조회 페이지
	@RequestMapping("/cashrecord.do")
	public String cashRecord(Model model, Criteria cri, int usNo, String startDate, String endDate) {
		
		logger.info("cashrecord.do : 충전내역확인 페이지 이동");
		
		//넘어오는 날짜데이터 합치기
		String[] startArr = startDate.split("-");
		String startDateAdd = "";
		
		for(int i=0; i<startArr.length; i++) {
			startDateAdd += startArr[i];
		}
		
		String[] endArr = endDate.split("-");
		
		String endDateAdd = "";
		
		for(int i=0; i<endArr.length; i++) {
			endDateAdd += endArr[i];
		}
		
		cri.setUsNo(usNo);
		cri.setStartDate(startDateAdd);
		cri.setEndDate(endDateAdd);
		
		model.addAttribute("chargeList", biz.chargeList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.chargeListCount(cri));
		
		model.addAttribute("chargePageMaker", pageMaker);
		model.addAttribute("criDate", cri);
		
		return "mypage/rechargeHistory";
	}

	
	//재능구매내역
	@RequestMapping("/buylist.do")
	public String buyList(Model model, String usNo) {
		
		
		
		
		
		
		return "mypage/talentPurchase";
	}
	
	
	
	
	
	
	
	
	
	
	
}
