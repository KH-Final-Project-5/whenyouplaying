package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commons.Criteria;
import com.dto.BankAccountDto;
import com.dto.ChargeHistoryDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;
import com.dto.WithDrawDto;

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
			System.out.println("[error] : MyPageDao, 재능구매내역 조건불러오기 에러");
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<FinishDealDto> sellerAllList(FinishDealDto dto) {

		List<FinishDealDto> res = null;
		
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"allSelHistory", dto);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, 재능판매내역 전체불러오기 에러");
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<FinishDealDto> sellerOneList(FinishDealDto dto) {
		List<FinishDealDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"oneSelHistory", dto);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, 재능판매내역 조건불러오기 에러");
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<WithDrawDto> pointList(Criteria cri) {
		List<WithDrawDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"pointList", cri);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, pointList 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int pointListCount(Criteria cri) {
		int res = 0;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"pointListCount", cri);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, pointListCount 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<WithDrawDto> totalPriceList(int usNo) {

		List<WithDrawDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"totalPriceList", usNo);
		} catch (Exception e) {
			System.out.println("[error] : MyPageDao, totalPriceList 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<BankAccountDto> accountList(int usNo) {

		List<BankAccountDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"accountList", usNo);
		} catch (Exception e) {
			System.out.println("[error] : MyPagdDao, accountList 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertAccount(BankAccountDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insertAccount", dto);
		} catch (Exception e) {
			System.out.println("[error] : insertAccount 에러");
			e.printStackTrace(); 
		}
		
		return res;
	}

	@Override
	public int deleteAccount(int baNo) {
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"deleteAccount", baNo);
		} catch (Exception e) {
			System.out.println("[error] : deleteAccount 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int closeUser(int usNo) {
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"closeUser", usNo);
		} catch (Exception e) {
			System.out.println("[error] : closeUser 에러");
			e.printStackTrace();
 		}
		
		return res;
	}

	@Override
	public BankAccountDto getAccount(int baNo) {

		BankAccountDto res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"getAccount", baNo);
		} catch (Exception e) {
			System.out.println("[error] : getAccount 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateCash(UserDto user) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"updateCash", user);
		} catch (Exception e) {
			System.out.println("[error] : updateCash 에러");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insertWithDraw(WithDrawDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insertWithDraw", dto);
		} catch (Exception e) {
			System.out.println("[error] : insertWithDraw 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public BankAccountDto selectedBank(String wiBank) {
		
		BankAccountDto res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"selectedBank", wiBank);
		} catch (Exception e) {
			System.out.println("[error] : selectedBank 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	

	
	
	
}
