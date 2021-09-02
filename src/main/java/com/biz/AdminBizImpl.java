package com.biz;

import com.commons.Criteria;
import com.dao.AdminDao;
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
}
