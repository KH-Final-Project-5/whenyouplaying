package com.biz;

import java.util.List;

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

	@Override
	public List<NotificationDto> noticeList(int usNo) {
		return dao.noticeList(usNo);
	}

	@Override
	public NotificationDto noticeOne(int notiNo) {
		return dao.noticeOne(notiNo);
	}

	@Override
	public int updateNotice(NotificationDto dto) {
		return dao.updateNotice(dto);
	}

	
	
}
