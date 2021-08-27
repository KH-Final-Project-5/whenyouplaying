package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ProjectDto;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public ProjectDto selectDesign(String prTalent) {
		ProjectDto dto = null;
		
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectDesign", prTalent);
		} catch (Exception e) {
			System.out.println("[error] : selectDesign");
			e.printStackTrace();
		}
		
		
		
		return dto;
	}



	@Override
	public ProjectDto selectTranslation(String prTalent) {
		ProjectDto dto = null;
		
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectTranslation", prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectTranslation");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public ProjectDto selectDocument(String prTalent) {
		ProjectDto dto = null;
		
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectDocument",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectDocument");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public ProjectDto selectMusic(String prTalent) {
		ProjectDto dto = null;
		
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectMusic",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectMusic");
				e.printStackTrace();
			}
			
		
		return dto;
	}



	@Override
	public ProjectDto selectProgram(String prTalent) {
		ProjectDto dto = null;
		
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectProgram",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectProgram");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public ProjectDto selectBiz(String prTalent) {
		ProjectDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectBiz",prTalent);
		} catch (Exception e) {
			System.out.println("[error : selectBiz");
			e.printStackTrace();
		}
		
		return dto;
	}



	@Override
	public ProjectDto selectLife(String prTalent) {
		ProjectDto dto  =null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectLife",prTalent);
		} catch (Exception e) {
			System.out.println("[error : selectBiz");
			e.printStackTrace();
		}
		return dto;
	}

}
