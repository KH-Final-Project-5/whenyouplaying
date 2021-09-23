package com.biz;

import com.commons.Criteria;
import com.dao.AdminDao;
import com.dto.DonateListDto;
import com.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminBizImpl implements AdminBiz{

    @Autowired
    AdminDao dao;

    @Override
    public List<UserDto> SelectUserAll(Criteria criteria) {
        return dao.SelectUserAll(criteria);
    }

    @Override
    public int SelectUserCount() {
        return dao.SelectUserCount();
    }

    @Override
    public int UserStop(int usNo) {
        return dao.UserStop(usNo);
    }

    @Override
    public int UserStopCancel(int usNo) {
        return dao.UserStopCancel(usNo);
    }

    @Override
    public List<UserDto> SelectUser(UserDto dto) {
        return dao.SelectUser(dto);
    }

	@Override
	public int insertDonate(String doName) {
		return dao.insertDonate(doName);
	}

	@Override
	public List<DonateListDto> selectDonateList() {
		return dao.selectDonateList();
	}

	@Override
	public int deleteDonate(int doNo) {
		return dao.deleteDonate(doNo);
	}

	@Override
	public int updateDonate(DonateListDto dto) {
		return dao.updateDonate(dto);
	}

	@Override
	public int updateUsCash(UserDto user) {
		return dao.updateUsCash(user);
	}
}
