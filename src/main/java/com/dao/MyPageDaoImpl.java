package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.UserDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public UserDto selectUser(int usNo) {
		
		UserDto userDto = null;
		
		try {
			userDto = sqlSessionTemplate.selectOne(NAMESPACE+"selectUser", usNo);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, selectUser 에러");
			e.printStackTrace();
		}
		
		return userDto;
	}
	
	
	
	
}
