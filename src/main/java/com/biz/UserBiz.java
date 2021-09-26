package com.biz;

import javax.servlet.http.HttpServletResponse;

import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

public interface UserBiz {

    public UserDto login(UserDto dto);
    public int regi(UserDto dto);
    public String findId(UserDto dto);
    public int userEdit(UserDto dto);
    public int idChk(UserDto dto) throws Exception;

    public void Charge(UserDto dto, ChargeHistoryDto chargeHistoryDto);
	public void updatePw(UserDto dto)throws Exception;
	

	/* public UserDto readMember(String usId); */
	public UserDto idChk2(String usId);
	public int find_pw(UserDto dto);
 
    
}
