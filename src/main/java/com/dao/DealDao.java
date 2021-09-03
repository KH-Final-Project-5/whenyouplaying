package com.dao;

import com.dto.DealStatusDto;

public interface DealDao {

    String NAMESPACE = "deal.";

    public int InsertDealStatus(DealStatusDto dto);

    public DealStatusDto SelectDeal(DealStatusDto dto);


}
