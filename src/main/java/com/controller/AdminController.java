package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.AdminBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.DonateListDto;
import com.dto.UserDto;

@Controller
public class AdminController {

    @Autowired
    AdminBiz biz;

    @RequestMapping("/userManage.do")
    public String UserManagerForm(Model model, Criteria criteria) {

        List<UserDto> list = biz.SelectUserAll(criteria);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(biz.SelectUserCount());

        model.addAttribute("userList", list);
        model.addAttribute("pageMaker", pageMaker);


        return "admin/userManage";
    }

    @RequestMapping("/userstop.do")
    @ResponseBody
    public Map<String, Boolean> UserStop(int usNo) {

        int res = 0;

        res = biz.UserStop(usNo);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/userstopcancle.do")
    @ResponseBody
    public Map<String, Boolean> UserStopCancle(int usNo) {

        int res = 0;

        res = biz.UserStopCancel(usNo);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/searchId")
    public String SearchId(Model model, UserDto dto) {

        List<UserDto> list = biz.SelectUser(dto);

        model.addAttribute("userList", list);

        return "admin/userManage";
    }
    
    //기부금 출금
    @RequestMapping("/adminpointout.do")
    public String adminPointOut(Model model) {
    	
    	List<DonateListDto> list = biz.selectDonateList();
    	
    	model.addAttribute("donateList", list);
    	
    	return "admin/adminpointout";
    }
    
    
    //기부처 등록
    @RequestMapping("/insertdonate.do")
    public String insertDonate(String doName) {
    	
    	int res = biz.insertDonate(doName);
    	
    	if(res>0) {
    		return "redirect:adminpointout.do";
    	}else {
    		return "redirect:adminpointout.do";
    	}
    	
    }
    
    
    //기부처 관리 페이지 이동
    @RequestMapping("/donatelist.do")
    public String donateList(Model model) {
    	
    	List<DonateListDto> res = biz.selectDonateList(); 
    	
    	model.addAttribute("donatelist", res);
    	
    	return "admin/donateListPage";
    }

    
    //등록된 기부처 삭제
    @RequestMapping("/deletedonate.do")
    public String deleteDonate(int doNo) {
    	
    	int res = biz.deleteDonate(doNo);
    	
    	if(res>0) {
    		return "redirect:donatelist.do";
    	}else {
    		return "redirect:donatelist.do";
    	}
    	
    }

    
    //기부금 기부처에 적용하기
    @RequestMapping("/donateupdate.do")
    public void donateUpdate(DonateListDto dto, HttpServletResponse response, UserDto user) throws IOException {
    	
    	
    	int res = biz.updateDonate(dto);
    	
    	int calCash = user.getUsCash() - dto.getDoCash();
    	
    	user.setUsCash(calCash);
    	
    	if(res>0) {
    		
    		int userCash = biz.updateUsCash(user);
    		
    		if(userCash>0) {
    			ScriptUtils.alertAndMovePage(response, "기부되었습니다.", "donatelist.do");
    		}else {
    			ScriptUtils.alertAndMovePage(response, "관리자 캐쉬 적용 실패, 확인요망", "adminpointout.do");
    		}
    	}else {
    		ScriptUtils.alertAndMovePage(response, "기부실패", "adminpointout.do");
    	}
    	
    }
 

    
    
    
}
