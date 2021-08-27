package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ProjectDto;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public List<ProjectDto> selectDesign(String prTalent) {
		
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
	public List<ProjectDto> selectTranslation(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
			try {
				dto = sqlSession.selectList(NAMESPACE+"selectTranslation", prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectTranslation");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public List<ProjectDto> selectDocument(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
			try {
				dto = sqlSession.selectList(NAMESPACE+"selectDocument",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectDocument");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public List<ProjectDto> selectMusic(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
			try {
				dto = sqlSession.selectList(NAMESPACE+"selectMusic",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectMusic");
				e.printStackTrace();
			}
			
		
		return dto;
	}



	@Override
	public List<ProjectDto> selectProgram(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
			try {
				dto = sqlSession.selectList(NAMESPACE+"selectProgram",prTalent);
			} catch (Exception e) {
				System.out.println("[error] : selectProgram");
				e.printStackTrace();
			}
			
		return dto;
	}



	@Override
	public List<ProjectDto> selectBiz(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
		try {
			dto = sqlSession.selectList(NAMESPACE+"selectBiz",prTalent);
		} catch (Exception e) {
			System.out.println("[error : selectBiz");
			e.printStackTrace();
		}
		
		return dto;
	}



	@Override
	public List<ProjectDto> selectLife(String prTalent) {
		List<ProjectDto> dto = new ArrayList<ProjectDto>();
		
		try {
			dto = sqlSession.selectList(NAMESPACE+"selectLife",prTalent);
		} catch (Exception e) {
			System.out.println("[error : selectBiz");
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

}
