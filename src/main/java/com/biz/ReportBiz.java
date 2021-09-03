package com.biz;

import com.commons.Criteria;
import com.dto.ReportDto;

import java.util.List;

public interface ReportBiz {

    public int ReportSend(ReportDto dto);

    public List<ReportDto> ReportListPaing(Criteria criteria);

    public int ReportListCount(Criteria criteria);
}
