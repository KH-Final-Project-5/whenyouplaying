package com.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.MyPageBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.BankAccountDto;
import com.dto.FinishDealDto;

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
	
	//포인트출금내역
	@RequestMapping("/withdrawhistory.do")
	public String withdrawHistory(Model model, Criteria cri, int usNo, String startDate, String endDate) {
		
		logger.info("witdrawhistory.do : 포인트 출금내역 페이지 이동");
	
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
		
		
		model.addAttribute("pointList", biz.pointList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.pointListCount(cri));
		
		model.addAttribute("pointPageMaker", pageMaker);
		model.addAttribute("criDate", cri);
		
		//전체 출금 포인트 조회
	    model.addAttribute("totalPriceList", biz.totalPriceList(usNo));
		
		return "mypage/withdrawHistory";
	}
	

	
	//재능구매내역
	@RequestMapping("/buylist.do")
	public String buyList(Model model, int usNo, String finStatus) {
		
		logger.info("buylist.do : 재능구매내역 페이지");
		
		FinishDealDto dto = new FinishDealDto();
		if (finStatus.equals("1")) {
			finStatus = "거래취소";
		}
		dto.setUsBuyNo(usNo);
		dto.setFinStatus(finStatus);
		
		model.addAttribute("finStatus", finStatus);
		
		if(finStatus.equals("거래취소")) {
			model.addAttribute("AllList", biz.selectAllList(dto));
		}else {
			model.addAttribute("AllList", biz.selectOneList(dto));
		}
		
		return "mypage/talentPurchase";
	}
	
	
	//재능판매내역
	@RequestMapping("/selllist.do")
	public String sellList(Model model, int usNo, String finStatus) {
		
		logger.info("selllist.do : 재능판매내역 페이지");
		
		FinishDealDto dto = new FinishDealDto();
		dto.setUsSellNo(usNo);
		dto.setFinStatus(finStatus);
		
		model.addAttribute("finStatus", finStatus);
		
		if(finStatus.equals("거래취소")) {
			model.addAttribute("AllList", biz.sellerAllList(dto));
		}else {
			model.addAttribute("AllList", biz.sellerOneList(dto));
		}
		
		return "mypage/talentSales";
	}
	
	//계좌관리
	@RequestMapping("/manageaccount.do")
	public String manageAccount(Model model, int usNo) {
		
		logger.info("manageaccount.do : 계좌관리 페이지 이동");
		
		model.addAttribute("accountList", biz.accountList(usNo));
		
		return "mypage/bankAccount";
	}

	
	//계좌등록
	@RequestMapping("/insertaccount.do")
	public String insertAccount(BankAccountDto dto) {
		
		logger.info("insertaccount.do : 계좌 등록");
		
		int res = biz.insertAccount(dto);
		
		if(res>0) {
			return "redirect:manageaccount.do?usNo="+dto.getUsNo();
		}else {
			return "redirect:failinsertaccount.do?usNo="+dto.getUsNo();
		}
		
	}
	
	//계좌등록실패 팝업
	@RequestMapping("/failinsertaccount.do")
	public void failInsert(HttpServletResponse response, int usNo) {
		
		try {
			ScriptUtils.alertAndMovePage(response, "실패! 다시 시도해주세요", "manageaccount.do?usNo="+usNo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//계좌 삭제
	@RequestMapping("/deleteaccount.do")
	public String deleteAccount(int baNo, int usNo) {
		
		logger.info("deleteaccount.do : 계좌 삭제");
		
		int res = biz.deleteAccount(baNo);
		
		if(res>0) {
			return "redirect:manageaccount.do?usNo="+usNo;
		}else {
			return "redirect:failinsertaccount.do?usNo="+usNo;
		}
		 
	}
	
	
	
	
	
	
}
