package com.biz;

import java.util.List;

import com.dto.ProjectDto;

public interface ProjectBiz {
	
	public List<ProjectDto> selectCategory(String prTalent);
	
	
	
	
	
	
	
	public ProjectDto selectDetail(int prNo);
}
