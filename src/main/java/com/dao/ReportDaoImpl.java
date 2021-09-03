package com.dao;

import com.commons.Criteria;
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

    @Override
    public List<ReportDto> ReportListUser(Criteria criteria) {
        return sqlSessionTemplate.selectList(NAMESPACE+"ReportListUser", criteria);
    }

    @Override
    public ReportDto ReportCheck(ReportDto reportDto) {
        return sqlSessionTemplate.selectOne(NAMESPACE+"ReportCheck", reportDto);
    }

    @Override
    public ReportDto ReportCheckUser(ReportDto reportDto) {
        return sqlSessionTemplate.selectOne(NAMESPACE+"ReportCheckUser", reportDto);
    }

    @Override
    public void ReportComplete(int prNo) {
        sqlSessionTemplate.update(NAMESPACE + "ReportComplete", prNo);
    }

    @Override
    public int ReportCompleteRE(int decNo) {
        return sqlSessionTemplate.update(NAMESPACE+"ReportCompleteRe", decNo);
    }

    @Override
    public int ReportNega(int decNo) {
        return sqlSessionTemplate.update(NAMESPACE+"ReportNega", decNo);
    }

}
