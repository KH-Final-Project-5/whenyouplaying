package com.jade.swp.handler;

import com.dto.UserDto;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.servlet.http.HttpSession;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;

public class ReplyEchoHandler extends TextWebSocketHandler {

    Map<String, WebSocketSession> user = new HashMap<>();

    //connection이 연결 됐을 때
    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String senderId = getMemberId(session);
        if (senderId != null) {
            log(senderId + " 연결 됨");
            user.put(senderId, session);
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
            if (strs != null && strs.length == 2) {
                String url = strs[0];
                String target = strs[1];
                WebSocketSession targetSession = user.get(target);

                if (targetSession != null) {
//                    TextMessage tmpMsg = new TextMessage();
//                    targetSession.sendMessage(tmpMsg);
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
            user.remove(senderId);
        }
    }
    private void log(String logmsg) {
        System.out.println(new Date() + " : " + logmsg);
    }


}
