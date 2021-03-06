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
    
    //????????? ??????
    @RequestMapping("/adminpointout.do")
    public String adminPointOut(Model model) {
    	
    	List<DonateListDto> list = biz.selectDonateList();
    	
    	model.addAttribute("donateList", list);
    	
    	return "admin/adminpointout";
    }
    
    
    //????????? ??????
    @RequestMapping("/insertdonate.do")
    public void insertDonate(String doName, HttpServletResponse response) throws IOException {
    	
    	int res = biz.insertDonate(doName);
    	
    	if(res>0) {
    		ScriptUtils.alertAndMovePage(response, "???????????? ?????????????????????", "adminpointout.do");
    	}else {
    		ScriptUtils.alertAndMovePage(response, "????????? ?????? ??????", "adminpointout.do");
    	}
    	
    }
    
    
    //????????? ?????? ????????? ??????
    @RequestMapping("/donatelist.do")
    public String donateList(Model model) {
    	
    	List<DonateListDto> res = biz.selectDonateList(); 
    	
    	model.addAttribute("donatelist", res);
    	
    	return "admin/donateListPage";
    }

    
    //????????? ????????? ??????
    @RequestMapping("/deletedonate.do")
    public void deleteDonate(int doNo, HttpServletResponse response) throws IOException {
    	
    	int res = biz.deleteDonate(doNo);
    	
    	if(res>0) {
    		ScriptUtils.alertAndMovePage(response, "???????????? ?????????????????????.", "donatelist.do");
    	}else {
    		ScriptUtils.alertAndMovePage(response, "????????? ?????? ??????", "donatelist.do");
    	}
    	
    }

    
    //????????? ???????????? ????????????
    @RequestMapping("/donateupdate.do")
    public void donateUpdate(DonateListDto dto, HttpServletResponse response, UserDto user) throws IOException {
    	
    	
    	int res = biz.updateDonate(dto);
    	
    	int calCash = user.getUsCash() - dto.getDoCash();
    	
    	user.setUsCash(calCash);
    	
    	if(res>0) {
    		
    		int userCash = biz.updateUsCash(user);
    		
    		if(userCash>0) {
    			ScriptUtils.alertAndMovePage(response, "?????????????????????.", "donatelist.do");
    		}else {
    			ScriptUtils.alertAndMovePage(response, "????????? ?????? ?????? ??????, ????????????", "adminpointout.do");
    		}
    	}else {
    		ScriptUtils.alertAndMovePage(response, "????????????", "adminpointout.do");
    	}
    	
    }
 

    
    
    
}
