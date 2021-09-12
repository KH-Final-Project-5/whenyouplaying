package com.controller;

import com.dto.ChatSeller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;



    @MessageMapping("/TTT")
    @SendTo("/topic/message/{dealNo}")
    public void ttt(ChatSeller seller) throws Exception {


        simpMessagingTemplate.convertAndSend("/topic/message/"+seller.getDealNo()+"/"+seller.getBuyer(), seller);

    }
}
