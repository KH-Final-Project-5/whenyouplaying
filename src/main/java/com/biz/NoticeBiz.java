package com.biz;

import java.util.List;

import com.dto.NotificationDto;

public interface NoticeBiz {

	public int insertNotice(NotificationDto dto);
	public List<NotificationDto> noticeList(int usNo);
	public NotificationDto noticeOne(int notiNo);
	public int updateNotice(NotificationDto dto);
	public int deleteNotice(int notiNo);
	public List<NotificationDto> allList();
	public int countViews(NotificationDto dto);
	
	
}
