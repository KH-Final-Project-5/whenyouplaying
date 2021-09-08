package com.dao;

import com.dto.DealStatusDto;
import com.dto.DealStatusImgDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DealDaoImpl implements DealDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public void InsertDealStatus(DealStatusDto dto) {

        sqlSessionTemplate.insert(NAMESPACE + "InsertDealStatus", dto);
    }

    @Override
    public DealStatusDto SelectDeal(DealStatusDto dto) {

        return sqlSessionTemplate.selectOne(NAMESPACE + "DealSelect", dto);
    }

    @Override
    public void UpdateProject(DealStatusDto dto) {
        sqlSessionTemplate.update(NAMESPACE + "DealUpdate", dto);
    }

    @Override
    public DealStatusDto SelectDealOne(int dealNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "DealSelectOne", dealNo);
    }

    @Override
    public int InsertImg(DealStatusImgDto dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "InsertDealImg", dto);
    }

    @Override
    public List<DealStatusImgDto> SelectDealImg(int dealNo) {
        return sqlSessionTemplate.selectList(NAMESPACE + "SelectDealImg", dealNo);
    }

    @Override
    public int DeleteOnlineImg(int dealImgNo) {
        return sqlSessionTemplate.delete(NAMESPACE + "DeleteOnlineImg", dealImgNo);
    }

    @Override
    public DealStatusDto SelectDealOneBuyer(int dealNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "SelectDealBuyer", dealNo);
    }

    @Override
    public void InsertFinDealStatus(DealStatusDto dto) {
        sqlSessionTemplate.insert(NAMESPACE + "InsertFinDeal", dto);
    }

    @Override
    public int TradeComplete(int dealNo) {
        Map<String, Integer> map = new HashMap<>();
        map.put("dealNo", dealNo);

        sqlSessionTemplate.update(NAMESPACE + "TradeComplete", map);
        int FF_UPDATE = map.get("FF_UPDATE");
        return FF_UPDATE;
    }

    @Override
    public int UpdateDealUser(UserDto dto) {
        return sqlSessionTemplate.update(NAMESPACE + "UpdateDealUser", dto);
    }

    @Override
    public int TradeSellerComplete(int dealNo) {
        return sqlSessionTemplate.update(NAMESPACE + "TradeSellerComplete", dealNo);
    }

    @Override
    public FinishDealDto DealCheck(int dealNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "DealCheck", dealNo);
    }

    @Override
    public UserDto IdCheck(int usNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE+"IdCheck", usNo);
    }
}
