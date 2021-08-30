package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

    @RequestMapping("/noticeListAdmin.do")
    public String NoticeListAdmin(Model model) {

        return "admin/noticeListAdmin";
    }

}
