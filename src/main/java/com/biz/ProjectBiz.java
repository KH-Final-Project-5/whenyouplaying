package com.biz;

import java.util.List;

import com.commons.Criteria;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.UserDto;

public interface ProjectBiz {

    public List<ProjectDto> selectCategory(Criteria cri) throws Exception;

    public int listCount() throws Exception;
    
    public ProjectDto selectDetail(int prNo);
    
    public List<FinishDealDto> selectReview(FinishDealDto dto);
    
    public int insertProject(ProjectDto dto);

    public int updateProject(ProjectDto dto);

    public int deleteProject(int prNo);

    public UserDto selectSession(int usNo);

    public ProjectDto messagePopup(int prNo);
    
    public List<ProjectDto> search(ProjectDto dto);
    
    public int insertReivew(ReviewDto dto);
    
    
    public List<ReviewDto> reviewSelect(int prNo);
    
    public int reviewUpdate(ReviewDto dto);
    
    public int reviewDelete(int rvNo);
}
