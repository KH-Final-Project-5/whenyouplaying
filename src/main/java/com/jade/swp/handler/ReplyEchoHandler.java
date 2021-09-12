package com.jade.swp.handler;

import com.dto.UserDto;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.*;

@Component
public class ReplyEchoHandler extends TextWebSocketHandler {


    Map<String, WebSocketSession> userSessions = new HashMap<>();

    //connection이 연결 됐을 때
    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String senderId = getMemberId(session);
        if (senderId != null) {
            log(senderId + " 연결 됨");
            userSessions.put(senderId, session);
        }
        System.out.println("afterConnectionEstablished : " + session);
    }

    private String getMemberId(WebSocketSession session) {
        Map<String, Object> httpSession = session.getAttributes();
        UserDto dto = (UserDto) httpSession.get("user");
        if (dto == null) {
            return session.getId();
        } else {
            return dto.getUsId();
        }

    }

    //메세지를 보냈을 때
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
        String senderId = getMemberId(session);

        String msg = message.getPayload();
        if (msg != null) {
            String[] strs = msg.split(",");
            log(strs.toString());
            if (strs != null && strs.length == 5) {
                String cmd = strs[0];
                String ChatWriter = strs[1];
                String ChatReception = strs[2];
                String dealNo = strs[3];
                String dealChat = strs[4];

                WebSocketSession targetSession = userSessions.get(ChatReception);

                if (targetSession != null) {
                    TextMessage tmpMsg = new TextMessage(dealChat);
                    targetSession.sendMessage(tmpMsg);
                }
            }
        }
    }

    //connection이 close 됐을 때
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        String senderId = getMemberId(session);
        log(senderId + " 연결 종료됨");
        if (senderId != null) {    // 로그인 값이 있는 경우만
            userSessions.remove(senderId);
        }
    }
    private void log(String logmsg) {
        System.out.println(new Date() + " : " + logmsg);
    }


}
