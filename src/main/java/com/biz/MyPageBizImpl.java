package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Criteria;
import com.dao.MyPageDao;
import com.dto.BankAccountDto;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;
import com.dto.WithDrawDto;

@Service
public class MyPageBizImpl implements MyPageBiz {

	@Autowired
	private MyPageDao dao;

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

	@Override
	public List<FinishDealDto> sellerAllList(FinishDealDto dto) {
		return dao.sellerAllList(dto);
	}

	@Override
	public List<FinishDealDto> sellerOneList(FinishDealDto dto) {
		return dao.sellerOneList(dto);
	}

	@Override
	public List<WithDrawDto> pointList(Criteria cri) {
		return dao.pointList(cri);
	}

	@Override
	public int pointListCount(Criteria cri) {
		return dao.pointListCount(cri);
	}

	@Override
	public List<WithDrawDto> totalPriceList(int usNo) {
		return dao.totalPriceList(usNo);
	}

	@Override
	public List<BankAccountDto> accountList(int usNo) {
		return dao.accountList(usNo);
	}

	@Override
	public int insertAccount(BankAccountDto dto) {
		return dao.insertAccount(dto);
	}

	@Override
	public int deleteAccount(int baNo) {
		return dao.deleteAccount(baNo);
	}

	@Override
	public int closeUser(int usNo) {
		return dao.closeUser(usNo);
	}

	@Override
	public BankAccountDto getAccount(int baNo) {
		return dao.getAccount(baNo);
	}

	@Override
	public int updateCash(UserDto user) {
		return dao.updateCash(user);
	}
	
	
	
	
}
