package com.controller;

import com.biz.AdminBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.dto.AbilityDto;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
