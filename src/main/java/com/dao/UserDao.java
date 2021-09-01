package com.dao;

import com.dto.UserDto;

public interface UserDao {

    String NAMESPACE = "user.";

    public UserDto login(UserDto dto);
    public String findId(UserDto dto);
    public String findPw(UserDto dto);
    public int regi(UserDto dto);
    public int userEdit(UserDto dto);
    public int idChk(UserDto dto) throws Exception;
    
}
