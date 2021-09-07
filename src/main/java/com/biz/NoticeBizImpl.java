package com.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeDao;
import com.dto.NotificationDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public int insertNotice(NotificationDto dto) {
		return dao.insertNotice(dto);
	}

	
	
}
