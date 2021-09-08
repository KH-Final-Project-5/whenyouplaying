package com.controller;


import com.biz.DealBiz;
import com.biz.MessageBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.MessageDto;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MessageController {

    @Autowired
    MessageBiz biz;

    @Autowired
    DealBiz dealBiz;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);


    @RequestMapping("/messageSend.do")
    @ResponseBody
    public Map<String, Boolean> messageChkForm(MessageDto dto) {

        int res = biz.SendMessage(dto);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);


        return map;
    }


    @RequestMapping("/mesCountChk.do")
    @ResponseBody
    public Map<String, Boolean> MesCountChk(int usNo, HttpSession session) {

        int res = biz.MesCountChk(usNo);

        UserDto dto = dealBiz.IdCheck(usNo);

        session.setAttribute("user", dto);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/messagechk.do")
    public String messagechk(Model model, Criteria criteria) throws ParseException {

        List<MessageDto> list = biz.MessageChk(criteria);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(biz.MessageCount(criteria));

        for (MessageDto dto : list) {
            String date = format.format(dto.getMesDate());
            dto.setMesDateSt(date);
        }

        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("mesList", list);

        return "user/messageChk";
    }

    @RequestMapping("/popupResend.do")
    public String popupResend(Model model, int mesNo) {

        model.addAttribute("mesDto", biz.ResendMessage(mesNo));

        return "trade/messagePopupResend";
    }

    @RequestMapping("/ReMessageSend.do")
    @ResponseBody
    public Map<String, Boolean> ReMessageSend(MessageDto dto) {


        int res = 0;

        res = biz.ReMessageSend(dto);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }


    @RequestMapping("/delMessage.do")
    @ResponseBody
    public Map<String, Boolean> DeleteMessage(int mesNo) {


        int res = 0;

        res = biz.DeleteMessage(mesNo);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/StatusUpdate.do")
    @ResponseBody
    public Map<String, Boolean> MessageStatus(int mesNo) {

        int res = 0;

        res = biz.MessageStatus(mesNo);

        boolean check = false;

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }
}
