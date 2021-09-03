package com.biz;

import java.util.List;

import com.commons.Criteria;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;

public interface MyPageBiz {

	public UserDto selectUser(int usNo);
	public List<ChargeHistoryDto> chargeList(Criteria cri);
	public int chargeListCount(Criteria cri) ;
	public List<FinishDealDto> selectAllList(FinishDealDto dto);

}
