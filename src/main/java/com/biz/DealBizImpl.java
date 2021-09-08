package com.biz;

import com.dao.DealDao;
import com.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DealBizImpl implements DealBiz{

    @Autowired
    DealDao dao;




    @Override
    @Transactional
    public DealStatusDto SelectDeal(DealStatusDto dto) {
        dao.UpdateProject(dto);
        dao.InsertDealStatus(dto);
        return dao.SelectDeal(dto);
    }

    @Override
    public DealStatusDto SelectDealOne(int dealNo) {
        return dao.SelectDealOne(dealNo);
    }

    @Override
    public int InsertImg(DealStatusImgDto dto) {
        return dao.InsertImg(dto);
    }

    @Override
    public List<DealStatusImgDto> SelectDealImg(int dealNo) {
        return dao.SelectDealImg(dealNo);
    }

    @Override
    public int DeleteOnlineImg(int dealImgNo) {
        return dao.DeleteOnlineImg(dealImgNo);
    }

    @Override
    public DealStatusDto SelectDealOneBuyer(int dealNo) {
        return dao.SelectDealOneBuyer(dealNo);
    }

    @Override
    public void InsertFinDealStatus(DealStatusDto dto) {
        dao.InsertFinDealStatus(dto);
    }

    @Override
    public int TradeComplete(int dealNo) {
        return dao.TradeComplete(dealNo);
    }

    @Override
    public int UpdateDealUser(UserDto dto) {
        return dao.UpdateDealUser(dto);
    }

    @Override
    public int TradeSellerComplete(int dealNo) {
        return dao.TradeSellerComplete(dealNo);
    }

    @Override
    public FinishDealDto DealCheck(int dealNo) {
        return dao.DealCheck(dealNo);
    }

    @Override
    public UserDto IdCheck(int usNo) {
        return dao.IdCheck(usNo);
    }

    @Override
    public List<ProjectDto> SelectTwo(String prTalent) {
        return dao.SelectTwo(prTalent);
    }
}
