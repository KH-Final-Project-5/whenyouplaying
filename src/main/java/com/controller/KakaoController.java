package com.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dto.UserDto;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class KakaoController {
    @Autowired
    private KakaoService kakaoService;

    @RequestMapping("/kakaologin.do")
    public String home(@RequestParam(value = "code", required = false) String code, Model model) {
        System.out.println("########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        System.out.println("######access_Token##### : " + access_Token);
        Map<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        UserDto dto = new UserDto();
        dto.setUsEmail((String) userInfo.get("email"));
        dto.setUsName((String) userInfo.get("nickname"));
        dto.setUsPw((String) userInfo.get("id"));
        dto.setUsId((String) userInfo.get("email"));

        /*
         * 정보를 가져와서 로그인을 시켜본 후에
         * 로그인이 정상적으로 완료되면 session에 저장하면서
         * 메인페이지로 이동(로그인 시키기)
         *
         * 아닐 경우엔 회원가입 폼으로 이동 model.addA~return까지 하면 됨
         */


        model.addAttribute("userInfo", dto);
        return "user/regiKakao";
    }
}