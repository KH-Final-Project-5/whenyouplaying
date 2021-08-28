package com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.ProjectBiz;
import com.dto.UserDto;

@Controller
public class ProjectController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	
	@Autowired
	private ProjectBiz biz;
	@RequestMapping("/category.do")
	public String designProject(Model model, String prTalent) {
		
		logger.info("Select Category");
		model.addAttribute("pr_dto",biz.selectCategory(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/Detail.do")
	public String ProjectDetail(Model model, int prNo) {
		
		logger.info("Detail");
		model.addAttribute("detail_dto",biz.selectDetail(prNo));
		
		
		return "projectBoard/talentBoardDetail";
	}
	
	
	@RequestMapping("popup.do")
	public String ProjectDetail(UserDto dto)  {
		
		
		return "trade/messagePopup";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
