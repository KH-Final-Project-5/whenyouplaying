package com.dao;

import java.util.List;

import com.commons.Criteria;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;
import com.dto.WithDrawDto;

public interface MyPageDao {

	 String NAMESPACE = "mypage.";
	
	 public UserDto selectUser(int usNo);
	 public List<ChargeHistoryDto> chargeList(Criteria cri);
	 public int chargeListCount(Criteria cri);
	 public List<FinishDealDto> selectAllList(FinishDealDto dto);
	 public List<FinishDealDto> selectOneList(FinishDealDto dto);
	 public List<FinishDealDto> sellerAllList(FinishDealDto dto);
	 public List<FinishDealDto> sellerOneList(FinishDealDto dto);
	 public List<WithDrawDto> pointList(Criteria cri);
	 public int pointListCount(Criteria cri);
	 public List<WithDrawDto> totalPriceList(int usNo);
	 
}
