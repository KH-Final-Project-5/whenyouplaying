package com.dao;

import java.util.List;

import com.commons.Criteria;
import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

public interface MyPageDao {

	 String NAMESPACE = "mypage.";
	
	 public UserDto selectUser(int usNo);
	 public List<ChargeHistoryDto> chargeList(Criteria cri);
	 public int chargeListCount(int usNo);
}
