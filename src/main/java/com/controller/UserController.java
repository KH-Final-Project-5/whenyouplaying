package com.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ChargeHistoryDto;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.ProjectBiz;
import com.biz.UserBiz;
import com.commons.ScriptUtils;
import com.dto.ReportDto;
import com.dto.ReviewDto;
import com.dto.UserDto;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserBiz biz;
    @Autowired
    ProjectBiz biz2;

    @ResponseBody
    @RequestMapping("charge.do")
    public void Charge(UserDto dto, HttpSession session, String pay_method) {
        switch (pay_method) {
            case "card":
                pay_method = "신용카드";
                break;
            case "samsung":
                pay_method = "삼성페이";
                break;
            case "trans":
                pay_method = "실시간 계좌이체";
                break;
            case "vbank":
                pay_method = "가상계좌";
                break;
            case "phone":
                pay_method = "휴대폰 소액결제";
                break;
        }

        ChargeHistoryDto chargeHistoryDto = new ChargeHistoryDto();
        chargeHistoryDto.setChBank(pay_method);
        chargeHistoryDto.setChCash(dto.getUsCash());
        UserDto userDto = (UserDto) session.getAttribute("user");
        chargeHistoryDto.setUsNo(userDto.getUsNo());
        dto.setUsCash(userDto.getUsCash() + dto.getUsCash());
        biz.Charge(dto, chargeHistoryDto);

        userDto = biz.login(userDto);

        session.setAttribute("user", userDto);
    }

    //mainpage
    @RequestMapping("/main.do")
    public String main(Model model) {
        biz2.newest();
        List<ReviewDto> list = biz2.newest();
        model.addAttribute("list", list);

        biz2.popularity();
        List<ReviewDto> list2 = biz2.popularity();
        model.addAttribute("list2", list2);


        return "user/main";
    }

    @ResponseBody
    @RequestMapping("/smssend.do")
    public int sendSms(String receiver) {

        int rand = (int) (Math.random() * 899999) + 100000;

        String hostname = "api.bluehouselab.com";
        String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

        CredentialsProvider credsProvider = new BasicCredentialsProvider();
        credsProvider.setCredentials(
                new AuthScope(hostname, 443, AuthScope.ANY_REALM),
                new UsernamePasswordCredentials("whenyouplay", "a2a643d4148311ecacae0cc47a1fcfae")
        );

        // Create AuthCache instance
        AuthCache authCache = new BasicAuthCache();
        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

        // Add AuthCache to the execution context
        HttpClientContext context = HttpClientContext.create();
        context.setCredentialsProvider(credsProvider);
        context.setAuthCache(authCache);

        DefaultHttpClient client = new DefaultHttpClient();

        try {
            HttpPost httpPost = new HttpPost(url);
            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
            String json = "{\"sender\":\"" + "01055763376" + "\",\"receivers\":[\"" + "01055763376" + "\"],\"content\":\"" +
                    "인증번호는 [" + rand + "] 입니다." + "\"}";

            StringEntity se = new StringEntity(json, "UTF-8");
            httpPost.setEntity(se);

            HttpResponse httpResponse = client.execute(httpPost, context);
            System.out.println(httpResponse.getStatusLine().getStatusCode());

            InputStream inputStream = httpResponse.getEntity().getContent();
            if (inputStream != null) {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                String line = "";
                while ((line = bufferedReader.readLine()) != null)
                    System.out.println(line);
                inputStream.close();
            }
        } catch (Exception e) {
            System.err.println("Error: " + e.getLocalizedMessage());
        } finally {
            client.getConnectionManager().shutdown();
        }
        return rand;
    }


    //로그인 페이지
    @RequestMapping("/loginform.do")
    public String loginForm() {


        return "user/login";
    }

    @RequestMapping("/regiphone.do")
    public String regiphone() {
        return "user/regiphone";
    }

    //회원가입 페이지
    @RequestMapping("/regiform.do")
    public String regiFrom(String phone, Model model) {
        System.out.println("phone : " + phone);
        model.addAttribute("phone", phone);

        return "user/regi";
    }

    @RequestMapping("/regi.do")
    public void regi(HttpServletResponse response, UserDto dto, @RequestParam("usPhone2") String usPhone2, @RequestParam("usPhone3") String usPhone3) throws IOException {


        String phone = dto.getUsPhone() + usPhone2 + usPhone3;

        dto.setUsPhone(phone);


        int res = biz.regi(dto);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "회원가입 완료!", "loginform.do");
        }


    }

    @ResponseBody
    @RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
    public int idChk(UserDto dto) throws Exception {
        int res = biz.idChk(dto);
        return res;
    }

    @RequestMapping("/login.do")
    public String login(HttpSession session, UserDto dto) {

        UserDto userDto = null;

        userDto = biz.login(dto);

        if (userDto != null) {
            session.setAttribute("user", userDto);
            return "redirect:main.do";
        } else {
            return "redirect:loginform.do";
        }

    }

    //구글 로그인
    @RequestMapping(value = "/googlelogin.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public @ResponseBody
    String googleLogin(HttpSession session, UserDto dto) {

        UserDto userDto = null;

        userDto = biz.login(dto);

        if (userDto != null) {
            session.setAttribute("user", userDto);
            return "회원";
        } else {
            return "비회원";
        }

    }

    //구글 회원가입
    @RequestMapping("regigoogle.do")
    public String regiGoogle(Model model, UserDto dto) {

        model.addAttribute("googleInfo", dto);

        return "user/regiGoogle";
    }


    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:main.do";
    }

    @RequestMapping("/talentform.do")
    public String talentForm() {
        return "user/abilityRegister";
    }


    //id/pw 찾기 form
    @RequestMapping("/finduser.do")
    public String findUser() {
        logger.info("finduser.do : id/pw 찾는 페이지 이동");
        return "user/loginSearch";
    }

    //id찾기
    @RequestMapping("/findId.do")
    public void findId(HttpServletResponse response, UserDto dto) {

        logger.info("findId.do : id찾기");

        String usId = null;

        usId = biz.findId(dto);

        try {
            if (usId == null) {
                ScriptUtils.alertAndMovePage(response, "일치하는 id가 없습니다. 다시 입력해주세요.", "finduser.do");
            } else {
                ScriptUtils.alertAndMovePage(response, "id는 " + usId + "입니다.", "loginform.do");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //pw찾기
    @RequestMapping("/findpw.do")
    public void findPw(HttpServletResponse response, UserDto dto) {

        logger.info("findpw.do : pw찾기");

        String resPw = null;

        resPw = biz.findPw(dto);

        try {
            if (resPw == null) {
                ScriptUtils.alertAndMovePage(response, "일치하는 pw가 없습니다. 다시 입력해주세요.", "finduser.do");
            } else {
                ScriptUtils.alertAndMovePage(response, "pw는 " + resPw + "입니다.", "loginform.do");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //회원정보 수정
    @RequestMapping("/useredit.do")
    public String userEdit() {

        logger.info("useredit.do : 회원정보수정 이동");
        return "user/userInfo";
    }

    //회원정보 수정결과
    @RequestMapping("/usereditres.do")
    public void userEditRes(HttpServletResponse response, UserDto dto, String usPhone1, String usPhone2, String usPhone3) {

        logger.info("usereditres.do : 회원정보수정 결과값 db 적용");

        String usPhone = usPhone1 + usPhone2 + usPhone3;

        dto.setUsPhone(usPhone);

        int res = 0;

        res = biz.userEdit(dto);

        try {
            if (res > 0) {
                ScriptUtils.alertAndMovePage(response, "회원정보가 수정되었습니다, 다시 로그인해주세요.", "logout.do");
            } else {
                ScriptUtils.alert(response, "회원정보 수정실패");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/reportpopup.do")
    public String ReportPopup(Model model, ReportDto dto) {

        model.addAttribute("dto", dto);


        return "user/reportPageForm";
    }


}
