package com.dao;

import com.dto.DealStatusDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DealDaoImpl implements DealDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public int InsertDealStatus(DealStatusDto dto) {

        return sqlSessionTemplate.insert(NAMESPACE+"InsertDealStatus", dto);
    }

    @Override
    public DealStatusDto SelectDeal(DealStatusDto dto) {

        return sqlSessionTemplate.selectOne(NAMESPACE + "DealSelect", dto);
    }
}
