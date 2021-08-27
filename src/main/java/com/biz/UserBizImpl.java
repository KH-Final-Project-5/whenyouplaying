package com.biz;

import com.dao.UserDao;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBizImpl implements UserBiz{

    @Autowired
    UserDao dao;

    @Override
    public UserDto login(UserDto dto) {
        return dao.login(dto);
    }
}