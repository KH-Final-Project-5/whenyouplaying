package com.biz;

import java.util.List;

import com.dto.ProjectDto;

public interface ProjectBiz {
	
	public List<ProjectDto> selectDesign(String prTalent);
	public List<ProjectDto> selectTranslation(String prTalent);
	public List<ProjectDto> selectDocument(String prTalent);
	public List<ProjectDto> selectMusic(String prTalent);
	public List<ProjectDto> selectProgram(String prTalent);
	public List<ProjectDto> selectBiz(String prTalent);
	public List<ProjectDto> selectLife(String prTalent);
	
	
	
	
	
	
	public ProjectDto selectDetail(int prNo);
}
