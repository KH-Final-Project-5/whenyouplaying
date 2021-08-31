package com.dao;

import com.dto.AbilityDto;
import com.commons.Criteria;
import com.dto.UserDto;

import java.util.List;

public interface AbilityDao {

    String NAMESPACE = "ability.";

    public int AbilityInsert(AbilityDto dto);

    public List<AbilityDto> AbilityListAll();

    public int AbilityListCount();

    public List<AbilityDto> AbilityListPaging(Criteria criteria);

    public AbilityDto AbilityDetail(int abNo);

    public int AbilityApprove(AbilityDto dto);

    public int AbilityApproveUser(AbilityDto dto);

}
