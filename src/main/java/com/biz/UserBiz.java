package com.biz;

import javax.servlet.http.HttpServletResponse;

import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

public interface UserBiz {

    public UserDto login(UserDto dto);
    public int regi(UserDto dto);
    public String findId(UserDto dto);
    public String findPw(UserDto dto);
    public int userEdit(UserDto dto);
    public int idChk(UserDto dto) throws Exception;

    public void Charge(UserDto dto, ChargeHistoryDto chargeHistoryDto);

  //이메일발송
    public void sendEmail(UserDto dto, String div) throws Exception;

    //비밀번호찾기
    public void findPw2(HttpServletResponse resp, UserDto dto) throws Exception;

}
