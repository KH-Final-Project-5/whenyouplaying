package com.dao;

import com.dto.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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
        int res = map.get("FF_UPDATE");
        return res;
    }

    @Override
    public int UpdateDealUser(UserDto dto) {
        return sqlSessionTemplate.update(NAMESPACE + "UpdateDealUser", dto);
    }

    @Override
    public int TradeSellerComplete(int dealNo) {
        Map<String, Integer> map = new HashMap<>();
        map.put("dealNo", dealNo);

        sqlSessionTemplate.update(NAMESPACE + "TradeSellerComplete", map);
        int res = map.get("FF_UPDATE");
        return res;
    }

    @Override
    public FinishDealDto DealCheck(int dealNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "DealCheck", dealNo);
    }

    @Override
    public UserDto IdCheck(int usNo) {
        return sqlSessionTemplate.selectOne(NAMESPACE+"IdCheck", usNo);
    }

    @Override
    public List<ProjectDto> SelectTwo(String prTalent) {
        List<ProjectDto> list = new ArrayList<>();
        list = sqlSessionTemplate.selectList(NAMESPACE + "SelectTwo", prTalent);
        return list;
    }

	@Override
	public int UpdateUserDeal(UserDto dto) {
		int res = sqlSessionTemplate.update(NAMESPACE + "NewUserDeal", dto);
		return res;
	}
}
