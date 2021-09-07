package com.dao;

import com.dto.NotificationDto;

public interface NoticeDao {

	 String NAMESPACE = "notice.";
	
	 public int insertNotice(NotificationDto dto);
	
}
