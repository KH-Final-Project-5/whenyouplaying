package com.biz;

import com.dto.DealStatusDto;
import com.dto.DealStatusImgDto;

import java.util.List;

public interface DealBiz {


    public DealStatusDto SelectDeal(DealStatusDto dto);


    public DealStatusDto SelectDealOne(int dealNo);

    public int InsertImg(DealStatusImgDto dto);

    public List<DealStatusImgDto> SelectDealImg(int dealNo);

    public int DeleteOnlineImg(int dealImgNo);

    public DealStatusDto SelectDealOneBuyer(int dealNo);

    public void InsertFinDealStatus(DealStatusDto dto);

    public int TradeComplete(int dealNo);



}
