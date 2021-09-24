package com.biz;

import com.dao.UserDao;
import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserBizImpl implements UserBiz{

    @Autowired
    UserDao dao;

    @Override
    public UserDto login(UserDto dto) {
        return dao.login(dto);
    }

	@Override
	public int regi(UserDto dto) {
		return dao.regi(dto);
	}
	
	public String findId(UserDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(UserDto dto) {
		return dao.findPw(dto);
	}

	@Override
	public int userEdit(UserDto dto) {
		return dao.userEdit(dto);
	}
	
	@Override
	public int idChk(UserDto dto) throws Exception {
		return dao.idChk(dto);
	}

	@Transactional
	@Override
	public void Charge(UserDto dto, ChargeHistoryDto chargeHistoryDto) {
		dao.ChargeHistory(chargeHistoryDto);
		dao.Charge(dto);
	}


	@Override
	public void sendEmail(UserDto dto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findpw2")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += dto.getUsId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getUsPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = dto.getUsEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw2(HttpServletResponse response, UserDto dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		UserDto ck = dao.readMember(dto.getUsId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(dao.idCheck(dto.getUsId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!dto.getUsEmail().equals(ck.getUsEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			dto.setUsPw(pw);
			// 비밀번호 변경
			dao.updatePw(dto);
			// 비밀번호 변경 메일 발송
			sendEmail(dto, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

}
