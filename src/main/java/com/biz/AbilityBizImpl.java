package com.biz;

import com.dao.AbilityDao;
import com.dto.AbilityDto;
import com.commons.Criteria;
import com.dto.MessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AbilityBizImpl implements AbilityBiz {

    @Autowired
    private AbilityDao dao;


    @Transactional
    @Override
    public int AbilityInsert(AbilityDto dto) {
        return dao.AbilityInsert(dto);
    }

    @Override
    public List<AbilityDto> AbilityListAll() {

        return dao.AbilityListAll();
    }

    @Override
    public int AbilityListCount() {

        return dao.AbilityListCount();
    }

    @Override
    public List<AbilityDto> AbilityListPaging(Criteria criteria) {
        return dao.AbilityListPaging(criteria);
    }

    @Override
    public AbilityDto AbilityDetail(int abNo) {

        return dao.AbilityDetail(abNo);
    }

    @Transactional
    @Override
    public int AbilityApprove(AbilityDto dto) {

        int res = 0;

        res = dao.AbilityApprove(dto);

        res = dao.AbilityApproveUser(dto);


        return res;
    }

    @Transactional
    @Override
    public void AbilityNega(MessageDto messageDto, AbilityDto abilityDto) {

        int res = 0;

        dao.AbilityNega(messageDto);

        dao.AbilityNegaUser(abilityDto);



    }

    @Override
    public int AjaxAbilityListCount(Criteria criteria) {
        return dao.AjaxAbilityListCount(criteria);
    }

    @Override
    public List<AbilityDto> AjaxAbilityListPaging(Criteria criteria) {
        return dao.AjaxAbilityListPaging(criteria);
    }


}
