package com.biz;

import com.commons.Criteria;
import com.dao.ReportDao;
import com.dto.ReportDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReportBizImpl implements ReportBiz{

    @Autowired
    ReportDao dao;


    @Override
    public int ReportSend(ReportDto dto) {
        return dao.ReportSend(dto);
    }

    @Override
    public List<ReportDto> ReportListPaing(Criteria criteria) {
        return dao.ReportListPaing(criteria);
    }

    @Override
    public int ReportListCount(Criteria criteria) {
        return dao.ReportListCount(criteria);
    }

    @Override
    public List<ReportDto> ReportListUser(Criteria criteria) {
        return dao.ReportListUser(criteria);
    }

    @Override
    public ReportDto ReportCheck(ReportDto reportDto) {
        return dao.ReportCheck(reportDto);
    }

    @Override
    public ReportDto ReportCheckUser(ReportDto reportDto) {
        return dao.ReportCheckUser(reportDto);
    }

    @Override
    @Transactional
    public int ReportComplete(int prNo, int decNo) {
        dao.ReportComplete(prNo);
        return dao.ReportCompleteRE(decNo);
    }

    @Override
    public int ReportNega(int decNo) {
        return dao.ReportNega(decNo);
    }
}
