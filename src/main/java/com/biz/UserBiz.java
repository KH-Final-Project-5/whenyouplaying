package com.biz;

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

}
