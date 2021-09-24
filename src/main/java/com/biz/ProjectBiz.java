package com.biz;

import java.util.List;

import com.commons.Criteria;
import com.dto.CalendarDto;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.ScheduleDto;
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
    
    public List<ProjectDto> prSearch(ProjectDto dto,Criteria cri)throws Exception;;

    public List<ReviewDto> newest();
    
    public List<ReviewDto> popularity();

    public int insertReivew(ReviewDto dto);
    
    
    public List<ReviewDto> reviewSelect(int prNo);
    
    public int reviewUpdate(ReviewDto dto);
    
    public int reviewDelete(int rvNo);

	public int insertCalendar(ProjectDto dto);

	public List<ScheduleDto> scheduleList(int prNo);

	public int insertSchedule(ScheduleDto dto);

	public CalendarDto selectCalendar(int prNo);

	public int deleteSchedule(ScheduleDto dto);

	public ProjectDto selectPrNo(ProjectDto dto);

}
