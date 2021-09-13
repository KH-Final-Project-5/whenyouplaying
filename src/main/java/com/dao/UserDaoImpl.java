package com.dao;

import com.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public UserDto login(UserDto dto) {

        UserDto userDto = null;

        try {
            userDto = sqlSessionTemplate.selectOne(NAMESPACE+"loginUser", dto);
        } catch (Exception e) {
            System.out.println("로그인 에러");
            e.printStackTrace();
        }

        return userDto;
    }

	@Override
	public int regi(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"regi",dto);
		}catch(Exception e) {
			System.out.println("회원가입 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int idChk(UserDto dto) throws Exception{
		
		int res = 0;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"idChk",dto);
		} catch (Exception e) {
		System.out.println("id중복확인 에러");
		e.printStackTrace();
		}
		return res;
	}

	@Override
	public void Charge(UserDto dto) {
		sqlSessionTemplate.update(NAMESPACE + "charge", dto);
	}


	public String findId(UserDto dto) {
		
		String res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"findId", dto);
		} catch (Exception e) {
			System.out.println("[error] : id찾기 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String findPw(UserDto dto) {
		
		String res = null;
		
		try {
			res = sqlSessionTemplate.selectOne(NAMESPACE+"findPw", dto);
		} catch (Exception e) {
			System.out.println("[error] : pw찾기 에러");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int userEdit(UserDto dto) {

		int res = 0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"userEdit", dto);
		} catch (Exception e) {
			System.out.println("[error] : 회원정보등록 에러");
			e.printStackTrace();
		}
		
		return res;
	}
}
