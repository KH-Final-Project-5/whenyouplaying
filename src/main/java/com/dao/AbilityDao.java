package com.dao;

import com.dto.AbilityDto;

public interface AbilityDao {

    String NAMESPACE = "ability.";

    public int AbilityInsert(AbilityDto dto, int usNo);

}
