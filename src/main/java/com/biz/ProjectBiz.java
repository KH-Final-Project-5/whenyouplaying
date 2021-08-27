package com.biz;

import java.util.List;

import com.dto.ProjectDto;

public interface ProjectBiz {
	
	public ProjectDto selectDesign(String prTalent);
	public ProjectDto selectTranslation(String prTalent);
	public ProjectDto selectDocument(String prTalent);
	public ProjectDto selectMusic(String prTalent);
	public ProjectDto selectProgram(String prTalent);
	public ProjectDto selectBiz(String prTalent);
	public ProjectDto selectLife(String prTalent);
}
