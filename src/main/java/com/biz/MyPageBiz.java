package com.biz;

import java.util.List;

import com.commons.Criteria;
import com.dto.BankAccountDto;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;
import com.dto.WithDrawDto;

public interface MyPageBiz {

	public UserDto selectUser(int usNo);
	public List<ChargeHistoryDto> chargeList(Criteria cri);
	public int chargeListCount(Criteria cri) ;
	public List<FinishDealDto> selectAllList(FinishDealDto dto);
	public List<FinishDealDto> selectOneList(FinishDealDto dto);
	public List<FinishDealDto> sellerAllList(FinishDealDto dto);
	public List<FinishDealDto> sellerOneList(FinishDealDto dto);
	public List<WithDrawDto> pointList(Criteria cri);
	public int pointListCount(Criteria cri) ;
	public List<WithDrawDto> totalPriceList(int usNo);
	public List<BankAccountDto> accountList(int usNo);
	public int insertAccount(BankAccountDto dto);
	public int deleteAccount(int baNo);
	public int closeUser(int usNo);
	public BankAccountDto getAccount(int baNo);
	public int updateCash(UserDto user);
	public int insertWithDraw(WithDrawDto dto);
	public BankAccountDto selectedBank(String wiBank);
	
	
}
