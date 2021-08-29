package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ProjectDto;
import com.dto.UserDto;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public List<ProjectDto> selectCategory(String prTalent) {
		
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
		try {
			dto = sqlSession.selectList(NAMESPACE+"selectDesign", prTalent);
		} catch (Exception e) {
			System.out.println("[error] : selectDesign");
			e.printStackTrace();
		}
		
		
		
		return dto;
	}



	



	
	
	
	@Override
	public ProjectDto selectDetail(int prNo) {
		ProjectDto dto = null;
		
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"detail",prNo);
		} catch (Exception e) {
			System.out.println("[error : detail");
			e.printStackTrace();
		}
		
		
		return dto;
	}










	@Override
	public int insertProject(ProjectDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		return res;
	}












}
