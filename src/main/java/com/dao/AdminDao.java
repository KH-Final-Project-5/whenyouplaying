package com.dao;

import com.commons.Criteria;
import com.dto.UserDto;

import java.util.List;

public interface AdminDao {

    String NAMESPACE = "admin.";

    public List<UserDto> SelectUserAll(Criteria criteria);

    public int SelectUserCount();

    public int UserStop(int usNo);

    public int UserStopCancel(int usNo);

    public List<UserDto> SelectUser(UserDto dto);
}
