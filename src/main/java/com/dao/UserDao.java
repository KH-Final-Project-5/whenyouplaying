package com.dao;

import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;

import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

public interface UserDao {

    String NAMESPACE = "user.";

    public UserDto login(UserDto dto);
    public String findId(UserDto dto);
    public int regi(UserDto dto);
    public int userEdit(UserDto dto);
    public int idChk(UserDto dto) throws Exception;

    public void Charge(UserDto dto);

    public int ChargeHistory(ChargeHistoryDto dto);
    


    // 비밀번호 변경
    public int updatePw(UserDto dto);


    public void sendEmail(UserDto dto, String div);
    public int find_pw(UserDto dto);

	/* public UserDto readMember(String usId); */
	public UserDto idChk2(String usId);
}	
