package com.controller;


import com.biz.MessageBiz;
import com.dto.MessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MessageController {

    @Autowired
    MessageBiz biz;

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

}
