package com.dao;

import com.dto.UserDto;

public interface UserDao {

    String NAMESPACE = "user.";

    public UserDto login(UserDto dto);
    public String findId(UserDto dto);
    public String findPw(UserDto dto);

    
    
    //user회원가입
    
    String NAMESPACE1 = "regi.";
    public UserDto regi(UserDto dto);
}
