package com.dao;

import com.commons.Criteria;
import com.dto.ReportDto;

import java.util.List;

public interface ReportDao {

    String NAMESPACE = "report.";

    public int ReportSend(ReportDto dto);

    public List<ReportDto> ReportListPaing(Criteria criteria);

    public int ReportListCount(Criteria criteria);

    public List<ReportDto> ReportListUser(Criteria criteria);

    public ReportDto ReportCheck(ReportDto reportDto);

    public ReportDto ReportCheckUser(ReportDto reportDto);

    public void ReportComplete(int prNo);

    public int ReportCompleteRE(int decNo);

    public int ReportNega(int decNo);

}
