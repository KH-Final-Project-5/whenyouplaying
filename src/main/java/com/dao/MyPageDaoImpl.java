package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commons.Criteria;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public UserDto selectUser(int usNo) {
		
		UserDto userDto = null;
		
		try {
			userDto = sqlSessionTemplate.selectOne(NAMESPACE+"selectUser", usNo);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, selectUser 에러");
			e.printStackTrace();
		}
		
		return userDto;
	}

	@Override
	public List<ChargeHistoryDto> chargeList(Criteria cri) {
		
		List<ChargeHistoryDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"cashRecord", cri);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, cashRecord 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int chargeListCount(Criteria cri) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"cashRecordCount", cri);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, cashRecordCount 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<FinishDealDto> selectAllList(FinishDealDto dto) {

		List<FinishDealDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"allPurHistory", dto);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, 재능구매내역 전체불러오기 에러");
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<FinishDealDto> selectOneList(FinishDealDto dto) {
		List<FinishDealDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"onePurHistory", dto);
		} catch (Exception e) {
			System.out.println("내용물 확인: " + dto.getUsBuyNo() + " : " + dto.getFinStatus());
			System.out.println("[error] : MyPageDao, 재능구매내역 전체불러오기 에러");
			e.printStackTrace();
		}
	
		return res;
	}


	
	
	
}
