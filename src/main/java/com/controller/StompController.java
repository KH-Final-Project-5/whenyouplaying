package com.controller;

import com.commons.FtpClient;
import com.dto.ChatSeller;
import com.dto.SellBuyDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class StompController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");


    @MessageMapping("/TTT")
    public void ttt(ChatSeller seller) throws Exception {
        String deal = String.valueOf(seller.getDealNo());

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt(deal, dir);

        try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(deal + ".txt", true)))) {
            out.println("<li class=\"left\"><b>" + seller.getWriter() + "</b>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    seller.getCal() + "</li>");
            out.println("<li class=\"left\">" + seller.getContent() + "</li>");
        } catch (IOException e) {
            //exception handling left as an exercise for the reader
        }
        ftpClient.uploadTxt(file, deal + ".txt");
        System.out.println(seller.getCal());

        file.delete();


        simpMessagingTemplate.convertAndSend("/topic/message/" + seller.getDealNo() + "/" + seller.getBuyer(), seller);

    }

    @MessageMapping("/MES")
    public void mes(SellBuyDto dto) {
        String a = dto.getBuyer() + "님이 " + dto.getSeller() + "님의 프로젝트를 구매하였습니다.";
        dto.setContent(a);
        simpMessagingTemplate.convertAndSend("/topic/mes/" + dto.getSeller(), dto);
    }
}
