package com.dao;

import com.dto.AbilityDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AbilityDaoImpl implements AbilityDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    @Override
    public int AbilityInsert(AbilityDto dto) {
        int res = 0;

        try {
            res = sqlSessionTemplate.insert(NAMESPACE+ "abilityInsert", dto);
        } catch (Exception e) {
            System.out.println("재능기부 신청 실패");
            e.printStackTrace();
        }

        return res;
    }
}
