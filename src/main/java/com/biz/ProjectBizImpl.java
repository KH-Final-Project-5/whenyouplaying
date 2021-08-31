package com.biz;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProjectDao;
import com.dto.ProjectDto;
import com.dto.UserDto;

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









	@Override
	public int insertProject(ProjectDto dto) {
		
		return dao.insertProject(dto);
	}









	@Override
	public int updateProject(ProjectDto dto) {
		
		return dao.updateProject(dto);
	}









	@Override
	public int deleteProject(int prNo) {
		// TODO Auto-generated method stub
		return dao.deleteProject(prNo);
	}









	@Override
	public UserDto selectSession(int usNo) {
		// TODO Auto-generated method stub
		return dao.selectSession(usNo);
	}









	

	
	

}
