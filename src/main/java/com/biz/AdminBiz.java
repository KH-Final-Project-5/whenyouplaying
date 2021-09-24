package com.biz;

import com.commons.Criteria;
import com.dto.DonateListDto;
import com.dto.UserDto;

import java.util.List;

public interface AdminBiz {

    public List<UserDto> SelectUserAll(Criteria criteria);

    public int SelectUserCount();

    public int UserStop(int usNo);

    public int UserStopCancel(int usNo);

    public List<UserDto> SelectUser(UserDto dto);

	public int insertDonate(String doName);

	public List<DonateListDto> selectDonateList();

	public int deleteDonate(int doNo);

	public int updateDonate(DonateListDto dto);

	public int updateUsCash(UserDto user);

}
