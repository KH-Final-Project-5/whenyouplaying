package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Criteria;
import com.dao.MyPageDao;
import com.dto.ChargeHistoryDto;
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
	public int chargeListCount(int usNo) {
		return dao.chargeListCount(usNo);
	}
	
	
	
	
	
}
