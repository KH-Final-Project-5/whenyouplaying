package com.dao;

import com.dto.UserDto;

public interface MyPageDao {

	 String NAMESPACE = "mypage.";
	
	 public UserDto selectUser(int usNo);
	
}
