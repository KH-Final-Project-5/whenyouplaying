package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Criteria;
import com.dao.ProjectDao;
import com.dto.CalendarDto;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.ScheduleDto;
import com.dto.UserDto;

@Service
public class ProjectBizImpl implements ProjectBiz{

	
	@Autowired
	private ProjectDao dao;
	
	@Override
	public List<ProjectDto> selectCategory(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.selectCategory(cri);
	}

	
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}
	
	@Override
	public ProjectDto selectDetail(int prNo) {
		
		return dao.selectDetail(prNo);
	}

	@Override
	public int insertProject(ProjectDto dto) {
		
		return dao.insertProject(dto);
	}

	@Override
	public int updateProject(ProjectDto dto) {
		
		return dao.updateProject(dto);
	}

	@Override
	public int deleteProject(int prNo) {
		// TODO Auto-generated method stub
		return dao.deleteProject(prNo);
	}

	@Override
	public UserDto selectSession(int usNo) {
		// TODO Auto-generated method stub
		return dao.selectSession(usNo);
	}

	@Override
	public ProjectDto messagePopup(int prNo) {
		return dao.messagePopup(prNo);
	}


	@Override
	public List<ProjectDto> search(ProjectDto dto) {
		
		return dao.search(dto);
	}


	@Override

	public List<ReviewDto> newest() {

		return dao.newest();
	}
	
	public List<ReviewDto> popularity(){
		return dao.popularity();
	}


	public int insertReivew(ReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.insertReview(dto);
	}


	@Override
	public List<ReviewDto> reviewSelect(int prNo) {
		// TODO Auto-generated method stub
		return dao.reviewSelect(prNo);
	}


	@Override
	public List<FinishDealDto> selectReview(FinishDealDto dto) {
		// TODO Auto-generated method stub
		return dao.selectReview(dto);
	}


	@Override
	public int reviewUpdate(ReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.reviewUpdate(dto);
	}


	@Override
	public int reviewDelete(int rvNo) {
		// TODO Auto-generated method stub
		return dao.reviewDelete(rvNo);
	}


	@Override
	public List<ProjectDto> prSearch(ProjectDto dto,Criteria cri) {
		
		return dao.prSearch(dto, cri);
	}


	@Override
	public int insertCalendar(ProjectDto dto) {
		return dao.insertCalendar(dto);
	}


	@Override
	public List<ScheduleDto> scheduleList(int prNo) {
		return dao.scheduleList(prNo);
	}


	@Override
	public int insertSchedule(ScheduleDto dto) {
		return dao.insertSchedule(dto);
	}


	@Override
	public CalendarDto selectCalendar(int prNo) {
		return dao.selectCalendar(prNo);
	}


	@Override
	public int deleteSchedule(ScheduleDto dto) {
		return dao.deleteSchedule(dto);
	}


	@Override
	public ProjectDto selectPrNo(ProjectDto dto) {
		return dao.selectPrNo(dto);
	}

	









	

}
