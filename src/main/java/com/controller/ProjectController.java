package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.ProjectBiz;
import com.commons.ScriptUtils;
import com.dto.ProjectDto;
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
	public String ProjectDetail(UserDto dto){
		
			return "trade/messagePopup";
		
	}
	
	
	@RequestMapping("insertProject.do")
	public String insertProject(Model model) {
			logger.info("insert");
		return "projectBoard/talentBoardInsert";
	}
	
	@RequestMapping(value="insertProjectRes.do")
	public void insertProjectRes(HttpServletResponse response,ProjectDto dto) throws IOException {
		logger.info("Insert Res");
		int res = biz.insertProject(dto);
		 if (res > 0) {
	            ScriptUtils.alertAndMovePage(response, "입력 완료", "main.do");
	        } else {
	            ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
	        }
	}
	
	
	@RequestMapping("ProjectUpdate.do")
	public String ProjectUpdate(Model model,int prNo) {
		logger.info("UPDATE FORM");
		model.addAttribute("dto",biz.selectDetail(prNo));
		return "projectBoard/talentBoardUpdate";
	}

	@RequestMapping("ProjectUpdateRes.do")
	public void ProjectUpdateRes(HttpServletResponse response,ProjectDto dto) throws IOException {
		logger.info("Update Res");
		
		int res = biz.updateProject(dto);
		 if (res > 0) {
	            ScriptUtils.alertAndMovePage(response, "수정 완료", "main.do");
	        } else {
	            ScriptUtils.alertAndMovePage(response, "수정 실패", "main.do");
	        }
		
	}
	
	
	@RequestMapping("ProjectDelete.do")
	public void ProjectDelete(HttpServletResponse response,int prNo) throws IOException {
		
		logger.info("Delete");
		
		int res = biz.deleteProject(prNo);
		
		if(res>0) {
			ScriptUtils.alertAndMovePage(response, "삭제 성공", "main.do");
		}else {
			ScriptUtils.alertAndMovePage(response, "삭제 실패", "detail.do?prNo="+prNo);
		}
	}
	
}
