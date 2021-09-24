package com.biz;

import com.dao.UserDao;
import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserBizImpl implements UserBiz{

    @Autowired
    UserDao dao;

    @Override
    public UserDto login(UserDto dto) {
        return dao.login(dto);
    }

	@Override
	public int regi(UserDto dto) {
		return dao.regi(dto);
	}
	
	public String findId(UserDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(UserDto dto) throws Exception {
		return dao.findPw(dto);
	}

	@Override
	public int userEdit(UserDto dto) {
		return dao.userEdit(dto);
	}
	
	@Override
	public int idChk(UserDto dto) throws Exception {
		return dao.idChk(dto);
	}

	@Transactional
	@Override
	public void Charge(UserDto dto, ChargeHistoryDto chargeHistoryDto) {
		dao.ChargeHistory(chargeHistoryDto);
		dao.Charge(dto);
	}


}
