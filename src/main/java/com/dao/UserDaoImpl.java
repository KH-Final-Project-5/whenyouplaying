package com.dao;

import com.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public UserDto login(UserDto dto) {

        UserDto userDto = null;

        try {
            userDto = sqlSessionTemplate.selectOne(NAMESPACE+"loginUser", dto);
        } catch (Exception e) {
            System.out.println("로그인 에러");
            e.printStackTrace();
        }

        return userDto;
    }
}
