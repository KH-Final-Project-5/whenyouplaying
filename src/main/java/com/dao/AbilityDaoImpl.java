package com.dao;

import com.dto.AbilityDto;
import com.commons.Criteria;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<AbilityDto> AbilityListAll() {
        List<AbilityDto> list = new ArrayList<>();

        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "abilitySelectAll");
        } catch (Exception e) {
            System.out.println("재능기부 리스트 불러오기 실패");
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public int AbilityListCount() {

        int res = 0;
        try {
            res = sqlSessionTemplate.selectOne(NAMESPACE + "abilityCounting");
        } catch (Exception e) {
            System.out.println("카운팅 실패");
            e.printStackTrace();
        }


        return res;
    }

    @Override
    public List<AbilityDto> AbilityListPaging(Criteria criteria) {

        List<AbilityDto> list = new ArrayList<>();

        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "abilitySelectPaging", criteria);
        } catch (Exception e) {
            System.out.println("페이징 실패");
            e.printStackTrace();
        }


        return list;
    }
}
