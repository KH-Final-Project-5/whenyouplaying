package com.dao;

import com.dto.DealStatusDto;

public interface DealDao {

    String NAMESPACE = "deal.";

    public void InsertDealStatus(DealStatusDto dto);

    public DealStatusDto SelectDeal(DealStatusDto dto);

    public void UpdateProject(DealStatusDto dto);

}
