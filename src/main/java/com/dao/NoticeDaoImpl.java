package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.NotificationDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertNotice(NotificationDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insertNotice", dto);
		} catch (Exception e) {
			System.out.println("[error] : insertNotice에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
