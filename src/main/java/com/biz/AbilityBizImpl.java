package com.biz;

import com.dao.AbilityDao;
import com.dto.AbilityDto;
import com.commons.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AbilityBizImpl implements AbilityBiz {

    @Autowired
    private AbilityDao dao;


    @Transactional
    @Override
    public int AbilityInsert(AbilityDto dto) {
        return dao.AbilityInsert(dto);
    }

    @Override
    public List<AbilityDto> AbilityListAll() {

        return dao.AbilityListAll();
    }

    @Override
    public int AbilityListCount() {

        return dao.AbilityListCount();
    }

    @Override
    public List<AbilityDto> AbilityListPaging(Criteria criteria) {
        return dao.AbilityListPaging(criteria);
    }
}
