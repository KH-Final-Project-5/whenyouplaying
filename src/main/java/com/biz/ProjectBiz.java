package com.biz;

import java.util.List;

import com.dto.ProjectDto;
import com.dto.UserDto;

public interface ProjectBiz {

    public List<ProjectDto> selectCategory(String prTalent);

    public ProjectDto selectDetail(int prNo);

    public int insertProject(ProjectDto dto);

    public int updateProject(ProjectDto dto);

    public int deleteProject(int prNo);

    public UserDto selectSession(int usNo);

    public ProjectDto messagePopup(int prNo);

}
