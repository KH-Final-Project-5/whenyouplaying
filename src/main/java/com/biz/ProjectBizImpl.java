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
	public List<ProjectDto> selectCategory(String prTalent) {
		// TODO Auto-generated method stub
		return dao.selectCategory(prTalent);
	}

	

	
	
	
	
	
	
	@Override
	public ProjectDto selectDetail(int prNo) {
		
		return dao.selectDetail(prNo);
	}
	

	
	

}
