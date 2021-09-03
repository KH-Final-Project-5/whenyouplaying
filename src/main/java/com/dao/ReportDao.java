package com.dao;

import com.commons.Criteria;
import com.dto.ProjectDto;
import com.dto.ReportDto;

import java.util.List;

public interface ReportDao {

    String NAMESPACE = "report.";

    public int ReportSend(ReportDto dto);

    public List<ReportDto> ReportListPaing(Criteria criteria);

    public int ReportListCount(Criteria criteria);
}
