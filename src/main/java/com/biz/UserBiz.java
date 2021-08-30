package com.biz;

import com.dto.UserDto;

public interface UserBiz {

    public UserDto login(UserDto dto);

    public UserDto regi(UserDto dto);

}
