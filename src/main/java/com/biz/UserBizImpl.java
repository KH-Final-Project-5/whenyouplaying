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

	@Override
	public int regi(UserDto dto) {
		return dao.regi(dto);
	}
	
	public String findId(UserDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(UserDto dto) {
		return dao.findPw(dto);
	}


}
