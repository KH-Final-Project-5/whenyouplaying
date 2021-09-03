package com.dao;

import com.commons.Criteria;
import com.dto.ProjectDto;
import com.dto.ReportDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ReportDaoImpl implements ReportDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public int ReportSend(ReportDto dto) {


        return sqlSessionTemplate.insert(NAMESPACE + "ReportSend", dto);
    }

    @Override
    public List<ReportDto> ReportListPaing(Criteria criteria) {
        List<ReportDto> list = new ArrayList<>();

        list = sqlSessionTemplate.selectList(NAMESPACE + "ReportListPaging", criteria);

        return list;
    }

    @Override
    public int ReportListCount(Criteria criteria) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "ReportListCount", criteria);
    }
}
