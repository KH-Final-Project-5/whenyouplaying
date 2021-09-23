package com.dao;


import com.commons.Criteria;
import com.dto.DonateListDto;
import com.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public List<UserDto> SelectUserAll(Criteria criteria) {
        List<UserDto> list = new ArrayList<>();
        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "SelectUserAll", criteria);
        } catch (Exception e) {
            System.out.println("유저 목록 불러오기");
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public int SelectUserCount() {
        return sqlSessionTemplate.selectOne(NAMESPACE + "SelectUserCount");
    }

    @Override
    public int UserStop(int usNo) {


        return sqlSessionTemplate.update(NAMESPACE+"UserStop", usNo);
    }

    @Override
    public int UserStopCancel(int usNo) {
        return sqlSessionTemplate.update(NAMESPACE+"UserStopCancel", usNo);
    }

    @Override
    public List<UserDto> SelectUser(UserDto dto) {

        List<UserDto> list = new ArrayList<>();

        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "SelectUser", dto);
        } catch (Exception e) {
            System.out.println("유저 검색 실패");
            e.printStackTrace();
        }

        return list;
    }

	@Override
	public int insertDonate(String doName) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE + "insertDonate", doName);
		} catch (Exception e) {
			System.out.println("[error] : insertDonate 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<DonateListDto> selectDonateList() {

		List<DonateListDto> res = null;
		
		try {
			res = sqlSessionTemplate.selectList(NAMESPACE+"selectDonateList");
		} catch (Exception e) {
			System.out.println("[error] : selectDonateList 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteDonate(int doNo) {
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"deleteDonate", doNo);
		} catch (Exception e) {
			System.out.println("[error] : deleteDonate 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateDonate(DonateListDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"updateDonate", dto);
		} catch (Exception e) {
			System.out.println("[error] : updateDonate 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateUsCash(UserDto user) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"updateUsCash", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
}
