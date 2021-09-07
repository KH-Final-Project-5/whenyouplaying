package com.dao;

import com.dto.DealStatusDto;
import com.dto.DealStatusImgDto;
import com.dto.UserDto;

import java.util.List;

public interface DealDao {

    String NAMESPACE = "deal.";

    public void InsertDealStatus(DealStatusDto dto);

    public DealStatusDto SelectDeal(DealStatusDto dto);

    public void UpdateProject(DealStatusDto dto);

    public DealStatusDto SelectDealOne(int dealNo);

    public int InsertImg(DealStatusImgDto dto);

    public List<DealStatusImgDto> SelectDealImg(int dealNo);

    public int DeleteOnlineImg(int dealImgNo);

    public DealStatusDto SelectDealOneBuyer(int dealNo);

    public void InsertFinDealStatus(DealStatusDto dto);

    public int TradeComplete(int dealNo);

    public int UpdateDealUser(UserDto dto);
}
