package com.controller;

import com.commons.FtpClient;
import com.dto.ChatSeller;
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

    @Autowired
    FtpClient ftpClient;

    @ResponseBody
    @RequestMapping(value = "/chatdown.do", produces = "application/text; charset=utf-8")
    public String ChatDown(int dealNo) throws Exception {
        String deal = String.valueOf(dealNo);

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt(deal, dir);

        Path path = Paths.get(dir + "/" + deal + ".txt");

        Stream<String> lines = Files.lines(path);

        String line = lines.collect(Collectors.joining(System.lineSeparator()));
        file.delete();
        return line;
    }

    @MessageMapping("/TTT")
    public void ttt(ChatSeller seller) throws Exception {
        String deal = String.valueOf(seller.getDealNo());

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt(deal, dir);

        try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(deal + ".txt", true)))) {
            out.println("<li class=\"left\"><b>" + seller.getWriter() + "</b></li>");
            out.println("<li class=\"left\">" + seller.getContent() + "</li>");
        } catch (IOException e) {
            //exception handling left as an exercise for the reader
        }
        ftpClient.uploadTxt(file, deal + ".txt");

        file.delete();


        simpMessagingTemplate.convertAndSend("/topic/message/" + seller.getDealNo() + "/" + seller.getBuyer(), seller);

    }
}
