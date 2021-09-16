package com.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.MyPageBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.BankAccountDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;

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
		
		//System.out.println(dto.getBaBankName());
		
		String bankName = dto.getBaBankName();
		
		String[] bankArr = bankName.split("/");
		
		bankName = bankArr[0];
		String bankCode = bankArr[1];
		
		dto.setBaBankName(bankName);
		dto.setBaBankCode(bankCode);
		
		int res = biz.insertAccount(dto);
		
		if(res>0) {
			return "redirect:manageaccount.do?usNo="+dto.getUsNo();
		}else {
			return "redirect:failinsertaccount.do?usNo="+dto.getUsNo();
		}
		
	}
	
	//오픈뱅크 계좌등록
	@RequestMapping("/bankauth.do")
	public void bankAuth(HttpServletResponse response,String code, String scope, String state, HttpSession session) throws IOException {
		
		
		
		ScriptUtils.alert(response, "금융결제원 계좌등록완료, 팝업창을 닫아주세요.");
		
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
	
	
	//회원탈퇴
	@RequestMapping("/closeaccountform.do")
	public String closeAccountForm() {

		logger.info("closeaccountform.do : 회원탈퇴 페이지 이동");
		
		return "mypage/userLeave";
	}
	
	@RequestMapping("/closeaccount.do")
	public void closeAccount(int usNo, HttpServletResponse response, HttpSession session) throws IOException {
		
		int res = biz.closeUser(usNo);
		
		if(res>0) {
			session.invalidate();
			ScriptUtils.alertAndMovePage(response, "회원탈퇴가 정상적으로 이루어졌습니다.", "main.do");
		}else {
			ScriptUtils.alertAndMovePage(response, "회원탈퇴 실패 다시 시도해주세요.", "closeaccountform.do");
		}
		
	}
	
	
	//포인트출금
	@RequestMapping("/pointdeposituser.do")
	public String pointDepositUser(Model model,int usNo) {
		
		logger.info("pointdeposituser.do : 포인트 출금 페이지 이동");
		
		model.addAttribute("accountList", biz.accountList(usNo));
		
		return "mypage/cashWith";
	}
	
	//계좌정보가지고오기
	@RequestMapping("/getaccount.do")
	@ResponseBody
	public BankAccountDto getAccount(int baNo) {
		
		BankAccountDto result = biz.getAccount(baNo);
		
		return result;
	}
	
	
	//포인트 출금 후 적용
	@RequestMapping("/adjustpoint.do")
	@ResponseBody
	public int adjustPoint(UserDto user, HttpSession session) {
		
		int res = biz.updateCash(user);
		
		if(res>0) {
			UserDto tmp = biz.selectUser(user.getUsNo());
			session.setAttribute("user", tmp);
			return res;
		}else {
			System.out.println("업데이트실패");
			return res;
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
