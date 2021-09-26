package com.biz;

import com.dao.UserDao;
import com.dto.ChargeHistoryDto;
import com.dto.UserDto;

import javax.servlet.http.HttpServletResponse;

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
	
	@Override
	public void updatePw(UserDto dto) throws Exception {
		dao.updatePw(dto);
	}

	/*
	 * @Override public UserDto readMember(String usId) {
	 * 
	 * return dao.readMember(usId); }
	 */

	@Override
	public UserDto idChk2(String usId) {

		return dao.idChk2(usId);
	}

	@Override
	public int find_pw(UserDto dto) {
		return dao.find_pw(dto);
	}


}
