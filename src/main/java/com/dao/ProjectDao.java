package com.dao;

import java.util.List;

import com.commons.Criteria;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.UserDto;

public interface ProjectDao {


    String NAMESPACE = "project.";

    public List<ProjectDto> selectCategory(Criteria cri);
    
    public int listCount() throws Exception;

    public ProjectDto selectDetail(int prNo);

    public List<FinishDealDto> selectReview(FinishDealDto dto);	
    
    public int insertProject(ProjectDto dto);

    public int updateProject(ProjectDto dto);

    public int deleteProject(int prNo);

    public UserDto selectSession(int usNo);

    public ProjectDto messagePopup(int prNo);

    public List<ProjectDto> search(ProjectDto dto);
    
    public List<ReviewDto> newest();
    
    public List<ReviewDto> popularity();

    public int insertReview(ReviewDto dto);
    
    public List<ReviewDto> reviewSelect(int prNo);
    
    
    public int reviewUpdate(ReviewDto dto);
    
    public int reviewDelete(int rvNo);
    
    public List<ProjectDto> prSearch(ProjectDto dto,Criteria cri);
    }
