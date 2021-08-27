package com.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProjectDao;
import com.dto.ProjectDto;

@Service
public class ProjectBizImpl implements ProjectBiz{

	
	@Autowired
	private ProjectDao dao;
	
	@Override
	public ProjectDto selectDesign(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectDesign(prTalent);
	}

	@Override
	public ProjectDto selectTranslation(String prTalent) {
		
		return dao.selectTranslation(prTalent);
	}

	@Override
	public ProjectDto selectDocument(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectDocument(prTalent);
	}

	@Override
	public ProjectDto selectMusic(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectMusic(prTalent);
	}

	@Override
	public ProjectDto selectProgram(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectProgram(prTalent);
	}

	@Override
	public ProjectDto selectBiz(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectBiz(prTalent);
	}

	@Override
	public ProjectDto selectLife(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectLife(prTalent);
	}
	

	
	

}
