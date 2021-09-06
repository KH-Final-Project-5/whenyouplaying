package com.biz;

import com.dao.DealDao;
import com.dto.DealStatusDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
