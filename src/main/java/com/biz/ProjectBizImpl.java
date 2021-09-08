package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Criteria;
import com.dao.ProjectDao;
import com.dto.ProjectDto;
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
	public List<ProjectDto> newest() {

		return dao.newest();
	}









	

}
