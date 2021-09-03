package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Criteria;
import com.dao.MyPageDao;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;

@Service
public class MyPageBizImpl implements MyPageBiz {

	@Autowired
	MyPageDao dao;

	@Override
	public UserDto selectUser(int usNo) {
		return dao.selectUser(usNo);
	}

	@Override
	public List<ChargeHistoryDto> chargeList(Criteria cri) {
		return dao.chargeList(cri);
	}

	@Override
	public int chargeListCount(Criteria cri) {
		return dao.chargeListCount(cri);
	}

	@Override
	public List<FinishDealDto> selectAllList(FinishDealDto dto) {
		return dao.selectAllList(dto);
	}

	@Override
	public List<FinishDealDto> selectOneList(FinishDealDto dto) {
		return dao.selectOneList(dto);
	}


	
	
	
	
}
