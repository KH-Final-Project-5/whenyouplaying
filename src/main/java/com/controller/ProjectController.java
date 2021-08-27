package com.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biz.ProjectBiz;

@Controller
public class ProjectController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	
	@Autowired
	private ProjectBiz biz;
	@RequestMapping("/design.do")
	public String designProject(Model model, String prTalent) {
		
		logger.info("Select Design");
		model.addAttribute("pr_dto",biz.selectDesign(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	@RequestMapping("/translation.do")
	public String translationProject(Model model, String prTalent) {
		
		logger.info("Select Translation");
		model.addAttribute("pr_dto",biz.selectTranslation(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	@RequestMapping("/document.do")
	public String DocumentProject(Model model, String prTalent) {
		
		logger.info("Select Document");
		model.addAttribute("pr_dto",biz.selectDocument(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	@RequestMapping("/music.do")
	public String MusicProject(Model model, String prTalent) {
		
		logger.info("Select Music");
		model.addAttribute("pr_dto",biz.selectMusic(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	@RequestMapping("/program.do")
	public String ProgramProject(Model model, String prTalent) {
		
		logger.info("Select Program");
		model.addAttribute("pr_dto",biz.selectProgram(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	
	@RequestMapping("/biz.do")
	public String BizProject(Model model, String prTalent) {
		
		logger.info("Select Biz");
		model.addAttribute("pr_dto",biz.selectBiz(prTalent));
		return "projectBoard/talentBoard";
	}
	
	@RequestMapping("/life.do")
	public String LifeProject(Model model, String prTalent) {
		
		logger.info("Select Life");
		model.addAttribute("pr_dto",biz.selectLife(prTalent));
		
		return "projectBoard/talentBoard";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/Detail.do")
	public String ProjectDetail(Model model, int prNo) {
		
		logger.info("Detail");
		model.addAttribute("detail_dto",biz.selectDetail(prNo));
		
		
		return "projectBoard/talentBoardDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
