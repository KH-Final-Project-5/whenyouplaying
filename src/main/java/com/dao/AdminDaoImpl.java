package com.dao;


import com.commons.Criteria;
import com.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public List<UserDto> SelectUserAll(Criteria criteria) {
        List<UserDto> list = new ArrayList<>();
        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "SelectUserAll", criteria);
        } catch (Exception e) {
            System.out.println("유저 목록 불러오기");
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public int SelectUserCount() {
        return sqlSessionTemplate.selectOne(NAMESPACE + "SelectUserCount");
    }

    @Override
    public int UserStop(int usNo) {


        return sqlSessionTemplate.update(NAMESPACE+"UserStop", usNo);
    }

    @Override
    public int UserStopCancel(int usNo) {
        return sqlSessionTemplate.update(NAMESPACE+"UserStopCancel", usNo);
    }

    @Override
    public List<UserDto> SelectUser(UserDto dto) {

        List<UserDto> list = new ArrayList<>();

        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "SelectUser", dto);
        } catch (Exception e) {
            System.out.println("유저 검색 실패");
            e.printStackTrace();
        }

        return list;
    }
}
