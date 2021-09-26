package com.dao;

import com.biz.UserBiz;
import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public UserDto login(UserDto dto) {

        UserDto userDto = null;

        try {
            userDto = sqlSessionTemplate.selectOne(NAMESPACE+"loginUser", dto);
        } catch (Exception e) {
            System.out.println("로그인 에러");
            e.printStackTrace();
        }

        return userDto;
    }

	@Override
	public int regi(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"regi",dto);
		}catch(Exception e) {
			System.out.println("회원가입 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int idChk(UserDto dto) throws Exception{
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"idChk",dto);
		} catch (Exception e) {
		System.out.println("id중복확인 에러");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public void Charge(UserDto dto) {
		sqlSessionTemplate.update(NAMESPACE + "charge", dto);
	}

	@Override
	public int ChargeHistory(ChargeHistoryDto dto) {
		return sqlSessionTemplate.insert(NAMESPACE + "chargehistory", dto);
	}


	public String findId(UserDto dto) {
		
		String res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"findId", dto);
		} catch (Exception e) {
			System.out.println("[error] : id찾기 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int updatePw(UserDto dto) {
		
		int res = 0;
		try {
			res =  sqlSessionTemplate.update(NAMESPACE+"updatePw", dto);
		} catch (Exception e) {
			System.out.println("[error] : pw 수정 오류");
		}
		return res;

	}

//	@Override
//	public String findPw(UserDto dto)throws Exception {
//		
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		
//		String res = null;
//		
//		System.out.println("로그인 확인");
//		
//		try {
//			res = sqlSessionTemplate.selectOne(NAMESPACE+"findPw", dto);
//			
//			if(dto != null) {
//				String tempPw = UUID.randomUUID().toString().replace("-", "");
//				tempPw = tempPw.substring(0,10);
//				
//				System.out.println("임시 비밀번호 확인: " + tempPw);
//				
//				//임시 비밀번호 담기
//				dto.setUsPw(tempPw);
//				
//				//메일전송
//				MailMain mail = new MailMain();
//				mail.sendMail(dto);
//				
//				//회원 비밀번호 암호화
//				String securePw = encoder.encode(dto.getUsPw());
//				dto.setUsPw(securePw);
//				
//
//			}
//			
//		} catch (Exception e) {
//			System.out.println("[error] : pw찾기 에러");
//			e.printStackTrace();
//		}
//
//		return res;
//	}
	
	

	@Override
	public int userEdit(UserDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"userEdit", dto);
		} catch (Exception e) {
			System.out.println("[error] : 회원정보등록 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	
	@Override
	public void sendEmail(UserDto dto, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "testaccount14";
		String hostSMTPpwd = "Test1234!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "testaccount14@naver.com";
		String fromName = "놀면뭐하니?";
		String subject = "";
		String msg = "";

		if(div.equals("findpw.do")) {
			subject = "놀면뭐하니? 임시 비밀번호 입니다.";
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
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	
	// 비밀번호 찾기
	@Override
	public int find_pw(UserDto dto) {
		
		UserDto ck = readMember(dto);
		System.out.println("멤버 불로옴: " + dto.getUsId()+ " " + dto.getUsEmail());
		
		
//		PrintWriter out = response.getWriter();
		
		
		/*// 가입된 아이디가 없으면
		if(biz.idChk2(dto.getUsId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!dto.getUsEmail().equals(ck.getUsEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else { */

			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			
			System.out.println("pw : " + pw);
			
			ck.setUsPw(pw);
			
			// 비밀번호 변경
			int res = updatePw(ck);
			
			if(res>0) {
				// 비밀번호 변경 메일 발송
				sendEmail(ck, "findpw.do");
				return res;
			}else {
				return res;
			}
			
		//}
	}

	public UserDto readMember(UserDto dto) {
			UserDto ck = null;
			System.out.println("id: " + dto.getUsId());

        try {
            ck = sqlSessionTemplate.selectOne(NAMESPACE+"readMember", dto);
        } catch (Exception e) {
            System.out.println("멤버읽어오기 에러");
            e.printStackTrace();
        }

        return ck;
	}

	@Override
	public UserDto idChk2(String usId) {
		UserDto userDto = null;

        try {
            userDto = sqlSessionTemplate.selectOne(NAMESPACE+"idChk2", usId);
        } catch (Exception e) {
            System.out.println("아이디읽어오 에러");
            e.printStackTrace();
        }

        return userDto;
	}
}


