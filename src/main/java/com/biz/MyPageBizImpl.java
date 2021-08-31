package com.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDao;
import com.dto.UserDto;

@Service
public class MyPageBizImpl implements MyPageBiz {

	@Autowired
	MyPageDao dao;

	@Override
	public UserDto selectUser(int usNo) {
		return dao.selectUser(usNo);
	}
	
	
	
	
	
}
