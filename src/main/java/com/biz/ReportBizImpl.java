package com.biz;

import com.commons.Criteria;
import com.dao.ReportDao;
import com.dto.ReportDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
