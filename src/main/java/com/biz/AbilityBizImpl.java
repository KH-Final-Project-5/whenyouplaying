package com.biz;

import com.dao.AbilityDao;
import com.dto.AbilityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AbilityBizImpl implements AbilityBiz{

    @Autowired
    private AbilityDao dao;


    @Transactional
    @Override
    public int AbilityInsert(AbilityDto dto, int usNo) {
        return dao.AbilityInsert(dto, usNo);
    }
}
