package com.controller;


import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.commons.FtpClient;
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
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.ProjectBiz;
import com.biz.UserBiz;
import com.commons.NaverLoginBO;
import com.commons.ScriptUtils;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.dto.ChargeHistoryDto;
import com.dto.ReportDto;
import com.dto.ReviewDto;
import com.dto.UserDto;
import com.github.scribejava.core.model.OAuth2AccessToken;

import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;





    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");


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
            case "point":
                pay_method = "카카오 페이";
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


    //로그인 페이지
    @RequestMapping("/loginform.do")
    public String loginForm(Model model, HttpSession session) {

        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        //System.out.println("네이버:" + naverAuthUrl);

        //네이버
        model.addAttribute("url", naverAuthUrl);

        return "user/login";
    }


    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naverLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);

        //1. 로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터

        /** apiResult json 구조
         {"resultcode":"00",
         "message":"success",
         "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
         **/

        //2. String형식인 apiResult를 json형태로 바꿈
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;

        //3. 데이터 파싱
        //Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject) jsonObj.get("response");
        //response의 nickname값 파싱

        String id = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");
        String pw = (String) response_obj.get("id");

        UserDto dto = new UserDto();
        dto.setUsId(id);
        dto.setUsName(name);
        dto.setUsPw(pw);

        model.addAttribute("naverDto", dto);

        System.out.println(apiResult);


        dto = biz.login(dto);


        if (dto == null) {
            return "user/regiNaver";
        } else {
            session.setAttribute("user", dto);

            return "redirect:main.do";

        }


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
    public String login(HttpSession session, UserDto dto, HttpServletResponse response) throws IOException {

        UserDto userDto = null;

        userDto = biz.login(dto);

        if (userDto != null) {
            if (userDto.getUsStatus().equals("Y")) {
                session.setAttribute("user", userDto);
                return "redirect:main.do";
            } else {
                ScriptUtils.alertAndMovePage(response, "회원님의 계정은 정지되었습니다.", "main.do");
            }

        } else {
            ScriptUtils.alertAndMovePage(response, "아이디 혹은 비밀번호가 틀렸습니다..", "loginform.do");
        }
        return null;
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
        
    @RequestMapping("regikakao.do")
    public String regiKakao(Model model, UserDto dto) {
    	model.addAttribute("userinfo", dto);
    	return "user/regiKakao";
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

 

    //회원정보 수정
    @RequestMapping("/useredit.do")
    public String userEdit() {

        logger.info("useredit.do : 회원정보수정 이동");
        return "user/userInfo";
    }

    //회원정보 수정결과
    @RequestMapping("/usereditres.do")
    public void userEditRes(HttpServletResponse response, UserDto dto, String usPhone1, String usPhone2, String usPhone3) throws Exception {

        if (dto.getUsImgFile().getSize() > 0) {
            String filename = dto.getUsImgFile().getOriginalFilename();
            String refilename = ftpClient.fileName(filename, dto.getUsId());

            dto.setUsImg("http://wjwan0.dothome.co.kr/stoarge/" + dto.getUsId() + "/" + refilename);
            File file = ftpClient.convert(dto.getUsImgFile());
            ftpClient.upload(file, filename, dto.getUsId());
        } else {
            dto.setUsImg("http://wjwan0.dothome.co.kr/stoarge/personimg.png");
        }


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
    
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	@ResponseBody
	public void find_pw(UserDto dto, HttpServletResponse response) throws Exception{
		
		System.out.println(dto.getUsId() + " : " + dto.getUsEmail());
		
		int res = biz.find_pw(dto);
		
//		ScriptUtils.alert(response, "이메일이 전송되었습니다.");
	}
    
}