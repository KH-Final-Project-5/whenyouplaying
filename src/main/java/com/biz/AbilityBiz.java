package com.biz;

import com.dto.AbilityDto;
import com.commons.Criteria;
import com.dto.ApplyDto;
import com.dto.UserDto;

import java.util.List;

public interface AbilityBiz {

    public int AbilityInsert(AbilityDto dto);

    public List<AbilityDto> AbilityListAll();

    public int AbilityListCount();

    public List<AbilityDto> AbilityListPaging(Criteria criteria);

    public AbilityDto AbilityDetail(int abNo);

    public int AbilityApprove(AbilityDto dto);


    public void AbilityNega(ApplyDto applyDto, AbilityDto abilityDto);

    public int AjaxAbilityListCount(Criteria criteria);

    public List<AbilityDto> AjaxAbilityListPaging(Criteria criteria);

}
