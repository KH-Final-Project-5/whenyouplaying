package com.dao;

import java.util.List;

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

	@Override
	public List<NotificationDto> noticeList(int usNo) {
		
		List<NotificationDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"noticeList", usNo);
		} catch (Exception e) {
			System.out.println("[error] : noticeList에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public NotificationDto noticeOne(int notiNo) {

		NotificationDto res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"noticeOne", notiNo);
		} catch (Exception e) {
			System.out.println("[error] : noticeOne에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateNotice(NotificationDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"updateNotice", dto);
		} catch (Exception e) {
			System.out.println("[error] : updateNotice 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteNotice(int notiNo) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"deleteNotice", notiNo);
		} catch (Exception e) {
			System.out.println("[error] : deleteNotice 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<NotificationDto> allList() {
		
		List<NotificationDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"allList");
		} catch (Exception e) {
			System.out.println("[error] : allList 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int countViews(NotificationDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"countViews", dto);
		} catch (Exception e) {
			System.out.println("[error] : countViews에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
