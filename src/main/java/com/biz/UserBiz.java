package com.biz;

import com.dto.UserDto;

public interface UserBiz {

    public UserDto login(UserDto dto);
    public int regi(UserDto dto);
    public String findId(UserDto dto);
    public String findPw(UserDto dto);
}
