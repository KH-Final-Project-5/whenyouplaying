package com.dao;

import java.util.List;

import com.dto.ProjectDto;

public interface ProjectDao {
	
	
	String NAMESPACE="project.";
	
	public List<ProjectDto> selectCategory(String prTalent);
	
	
	
	
	public ProjectDto selectDetail(int prNo);
}
