package com.biz;

import com.commons.Criteria;
import com.dto.ReportDto;

import java.util.List;

public interface ReportBiz {

    public int ReportSend(ReportDto dto);

    public List<ReportDto> ReportListPaing(Criteria criteria);

    public int ReportListCount(Criteria criteria);

    public List<ReportDto> ReportListUser(Criteria criteria);

    public ReportDto ReportCheck(ReportDto reportDto);

    public ReportDto ReportCheckUser(ReportDto reportDto);

    public int ReportComplete(int prNo, int decNo);

    public int ReportNega(int decNo);



}
