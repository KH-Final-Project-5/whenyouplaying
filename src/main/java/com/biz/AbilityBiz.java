package com.biz;

import com.dto.AbilityDto;
import com.commons.Criteria;

import java.util.List;

public interface AbilityBiz {

    public int AbilityInsert(AbilityDto dto);

    public List<AbilityDto> AbilityListAll();

    public int AbilityListCount();

    public List<AbilityDto> AbilityListPaging(Criteria criteria);


}
