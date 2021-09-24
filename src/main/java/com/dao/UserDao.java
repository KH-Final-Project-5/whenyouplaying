package com.dao;

import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

public interface UserDao {

    String NAMESPACE = "user.";

    public UserDto login(UserDto dto);
    public String findId(UserDto dto);
    public String findPw(UserDto dto) throws Exception;
    public int regi(UserDto dto);
    public int userEdit(UserDto dto);
    public int idChk(UserDto dto) throws Exception;

    public void Charge(UserDto dto);

    public int ChargeHistory(ChargeHistoryDto dto);
}
