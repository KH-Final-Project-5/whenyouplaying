package com.dao;

import java.util.HashMap;
import java.util.List;

import com.dto.ProjectDto;
import com.dto.UserDto;

public interface ProjectDao {
	
	
	String NAMESPACE="project.";
	
	public List<ProjectDto> selectCategory(String prTalent);
	
	
	
	
	public ProjectDto selectDetail(int prNo);
	
	public int insertProject(ProjectDto dto);
	
	public int updateProject(ProjectDto dto);
	
	public int deleteProject(int prNo);
	
}
