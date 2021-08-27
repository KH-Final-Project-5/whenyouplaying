package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProjectDao;
import com.dto.ProjectDto;

@Service
public class ProjectBizImpl implements ProjectBiz{

	
	@Autowired
	private ProjectDao dao;
	
	@Override
	public List<ProjectDto> selectDesign(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectDesign(prTalent);
	}

	@Override
	public List<ProjectDto> selectTranslation(String prTalent) {
		
		return dao.selectTranslation(prTalent);
	}

	@Override
	public List<ProjectDto> selectDocument(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectDocument(prTalent);
	}

	@Override
	public List<ProjectDto> selectMusic(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectMusic(prTalent);
	}

	@Override
	public List<ProjectDto> selectProgram(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectProgram(prTalent);
	}

	@Override
	public List<ProjectDto> selectBiz(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectBiz(prTalent);
	}

	@Override
	public List<ProjectDto> selectLife(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectLife(prTalent);
	}

	
	
	
	
	
	
	@Override
	public ProjectDto selectDetail(int prNo) {
		
		return dao.selectDetail(prNo);
	}
	

	
	

}
