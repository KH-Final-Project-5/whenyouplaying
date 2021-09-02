package com.biz;

import java.util.List;

import com.commons.Criteria;
import com.dto.ProjectDto;
import com.dto.UserDto;

public interface ProjectBiz {

    public List<ProjectDto> selectCategory(Criteria cri) throws Exception;

    public int listCount() throws Exception;
    
    public ProjectDto selectDetail(int prNo);

    public int insertProject(ProjectDto dto);

    public int updateProject(ProjectDto dto);

    public int deleteProject(int prNo);

    public UserDto selectSession(int usNo);

    public ProjectDto messagePopup(int prNo);
    
    public List<ProjectDto> search(ProjectDto dto);
}
