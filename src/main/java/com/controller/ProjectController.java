package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.biz.ProjectBiz;
import com.commons.Criteria;
import com.commons.FtpClient;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.ScheduleDto;
import com.dto.UserDto;

@Controller
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectBiz biz;

    private int result;
    
    @RequestMapping("/prsearch.do")
    public String Prsearch(Model model, ProjectDto dto, Criteria cri) throws Exception {
    	logger.info("PrSearch");
    	model.addAttribute("pr_dto",biz.prSearch(dto, cri));
    	
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(biz.listCount());
    	model.addAttribute("pr_PageMaker", pageMaker);
    	return "projectBoard/talentBoard";
    	
    }

    @RequestMapping("/category.do")
    public String designProject(Model model, String prTalent, Criteria cri) throws Exception {
    	

        logger.info("Select Category");
        model.addAttribute("pr_dto", biz.selectCategory(cri));
        
        cri.setPrTalent(prTalent);
        model.addAttribute("pr_cri",cri);
        System.out.println( "prtalent값 확인: " + cri.getPrTalent());
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(biz.listCount());
        
        model.addAttribute("pr_PageMaker", pageMaker);
        
        return "projectBoard/talentBoard";
    }
    
    @RequestMapping("search.do")
    public String Search(Model model, ProjectDto dto){
        
        logger.info("Search content");
        model.addAttribute("pr_dto",biz.search(dto));
        
    	return "projectBoard/talentBoard";
    }


    @RequestMapping("/Detail.do")
    public String ProjectDetail(Model model, int prNo) {

        logger.info("Detail test");
        model.addAttribute("detail_dto", biz.selectDetail(prNo));
        
        //리뷰 뿌려주기
        model.addAttribute("review",biz.reviewSelect(prNo));
        
        return "projectBoard/talentBoardDetail";
        
    }

    @RequestMapping("popup.do")
    public String ProjectDetail(int prNo, Model model) {

        model.addAttribute("popupDto", biz.messagePopup(prNo));

        return "trade/messagePopup";

    }

    @RequestMapping("review.do")
    public void Review(ProjectDto dto,ReviewDto dto3,HttpServletResponse response,FinishDealDto dto2) throws IOException {
    	
    	
    	int dealNo = dto2.getDealNo();
    	List<FinishDealDto> finDto = new ArrayList<>();
    	
    	
    	finDto = biz.selectReview(dto2);
    	
    	
    	System.out.println(finDto+"finDto 확인!!!!!!!!!!!!!!");
    	
    	if(finDto.size()!=0) {
    		int res= 0;
    		res = biz.insertReivew(dto3);
    		
    		if(res>0) {
    			ScriptUtils.alertAndMovePage(response, "작성완료", "Detail.do?prNo="+dto.getPrNo());
    		}else {
    			ScriptUtils.alertAndMovePage(response, "작성실패", "Detail.do?prNo="+dto.getPrNo());
    		}
    	}else {
    		ScriptUtils.alertAndMovePage(response, "구매후 작성이 가능합니다.", "Detail.do?prNo="+dto.getPrNo());
    	}
    	 
    }

    @RequestMapping("insertProject.do")
    public String insertProject(Model model) {
        logger.info("insert");
        return "projectBoard/talentBoardInsert";
    }

    @RequestMapping(value = "insertProjectRes.do")
    public void insertProjectRes(HttpServletResponse response, ProjectDto dto) throws Exception {
        logger.info("Insert Res");
        FtpClient ftpClient =
                new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");

        String filename = null;

        //dto안에 들어있는 file을 가져오고
        MultipartFile multiFile = dto.getPrImage2();

        //파일 real이름을 filename 변수에 저장
        filename = multiFile.getOriginalFilename();

        //id : id값 을 id만 나올 수 있게 만든다


        String filename2 = ftpClient.fileName(filename, dto.getUsId());

        //경로/id/filename
        dto.setPrImage("http://wjwan0.dothome.co.kr/stoarge/" + dto.getUsId() + "/" + filename2);

        //multiPartFile을 File로 변환하는 작업
        File file = ftpClient.convert(multiFile);

        ftpClient.upload(file, filename, dto.getUsId());


        int res = biz.insertProject(dto);

        if (res > 0) {
        	
        	int resCal = biz.insertCalendar(dto);
        	
        	if(resCal>0) {
        		ScriptUtils.alertAndMovePage(response, "입력 완료", "main.do");
        	}else {
        		ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
        	}
        	
        } else {
            ScriptUtils.alertAndMovePage(response, "입력 실패", "main.do");
        }
    }

	@RequestMapping("ProjectUpdate.do")
	public String ProjectUpdate(Model model, int prNo) {
		logger.info("UPDATE FORM");
		model.addAttribute("dto", biz.selectDetail(prNo));
		return "projectBoard/talentBoardUpdate";
	}

	@RequestMapping("ProjectUpdateRes.do")
	public void ProjectUpdateRes(HttpServletResponse response, ProjectDto dto) throws Exception {
		logger.info("Update Res");

		FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");

		String filename = null;

		// dto안에 들어있는 file을 가져오고
		MultipartFile multiFile = dto.getPrImage2();

		// 파일 real이름을 filename 변수에 저장
		filename = multiFile.getOriginalFilename();

		// id : id값 을 id만 나올 수 있게 만든다

		String filename2 = ftpClient.fileName(filename, dto.getUsId());
		
		// 경로/id/filename
		dto.setPrImage("http://wjwan0.dothome.co.kr/stoarge/" + dto.getUsId() + "/" + filename2);

		// multiPartFile을 File로 변환하는 작업
		File file = ftpClient.convert(multiFile);

		ftpClient.upload(file, filename, dto.getUsId());

		int res = biz.updateProject(dto);
		if (res > 0) {
			ScriptUtils.alertAndMovePage(response, "수정 완료", "main.do");
		} else {
			ScriptUtils.alertAndMovePage(response, "수정 실패", "main.do");
		}

	}
    
    
    @RequestMapping("deleteReview.do")
    public void deleteReview(HttpServletResponse response,int rvNo,int prNo) throws IOException {
    	int res = 0;
    	System.out.println(rvNo);
    	System.out.println(prNo);
    	res = biz.reviewDelete(rvNo);
    	
    	if(res>0) {
    		ScriptUtils.alertAndMovePage(response, "리뷰 삭제 완료", "Detail.do?prNo="+prNo);
    	}else {
    		ScriptUtils.alertAndMovePage(response, "리뷰 삭제 실패", "Detail.do?prNo="+prNo);
    	}
    }
   
    //일정페이지 이동
    @RequestMapping("appointChange.do")
    public String appointChange(Model model,int prNo) {
    	
    	model.addAttribute("calendar",biz.selectCalendar(prNo));
    	
    	return "seller/reservationyer_pop_seller";
    }
    
    //일정 불러오기
    @RequestMapping("calendar.do")
    @ResponseBody
    public List calendar(int prNo) {
    		
    	List<ScheduleDto> list = biz.scheduleList(prNo);
    	
    	List jArray = new ArrayList();
    	
    	for(int i=0; i< list.size(); i++) {
    		
    		JSONObject sObject = new JSONObject();
    		sObject.put("title", list.get(i).getScTitle());
    		sObject.put("start", list.get(i).getScStart());
    		sObject.put("end", list.get(i).getScEnd());
    		jArray.add(sObject);
    		
    	}
    	
    	return jArray;
    	
    }
    
    //날짜 +1
    private static String AddDate(String strDate, int year, int month, int day) throws Exception { 
    	SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd"); 
    	
    	Calendar cal = Calendar.getInstance(); 
    	Date dt = dtFormat.parse(strDate); 
    	cal.setTime(dt); cal.add(Calendar.YEAR, year); 
    	cal.add(Calendar.MONTH, month); 
    	cal.add(Calendar.DATE, day); 
    	
    	return dtFormat.format(cal.getTime()); 
    }

    
    //일정 저장
    @RequestMapping("insertSchedule.do")
    public String insertSchedule(ScheduleDto dto) throws Exception {
    	
    	String scTitle = dto.getScTitle()+"님의 스케줄";
    	
    	String endDate = dto.getScEnd();
    	
    	String[] dateSplit = endDate.split("-");
    	String date = dateSplit[0] + dateSplit[1] + dateSplit[2];
    	
    	String addDate = AddDate(date, 0, 0, 1);
    	
    	String year = addDate.substring(0,4);
    	String mon = addDate.substring(4, 6);
    	String day = addDate.substring(6);
    	
    	String finDate = year+"-"+mon+"-"+day;
    	
    	dto.setScEnd(finDate);
    	
    	dto.setScTitle(scTitle);
    	
    	int res = biz.insertSchedule(dto);
    	
    	if(res>0) {
    		return "redirect:appointChange.do?prNo="+dto.getPrNo();
    	}else {
    		return "redirect:appointChange.do?prNo="+dto.getPrNo();
    	}
    	
    }
    
    //일정삭제
    @RequestMapping("/deleteSchedule.do")
    @ResponseBody
    public String deleteSchedule(String scTitle, Date scStartDate, Date scEndDate) {
    	
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String scStart = dateFormat.format(scStartDate);
    	String scEnd = dateFormat.format(scEndDate);
    	
    	ScheduleDto dto = new ScheduleDto();
    	dto.setScTitle(scTitle);
    	dto.setScStart(scStart);
    	dto.setScEnd(scEnd);
    	
    	int res = biz.deleteSchedule(dto);
    	
    	if(res>0) {
    		return "삭제 성공";
    	}else {
    		return "삭제 실패";
    	}
    	
    }
    

	@RequestMapping("reviewUpdate.do")
	public void UpdateReview(HttpServletResponse response, ReviewDto dto, ProjectDto dto2) throws IOException {

		int res;

		res = biz.reviewUpdate(dto);

		if (res > 0) {
			ScriptUtils.alertAndMovePage(response, "리뷰 수정 완료", "Detail.do?prNo=" + dto2.getPrNo());
		} else {
			ScriptUtils.alertAndMovePage(response, "리뷰 수정 실패", "Detail.do?prNo=" + dto2.getPrNo());
		}

	}

	@RequestMapping("ProjectDelete.do")
	public void ProjectDelete(HttpServletResponse response, int prNo) throws IOException {

		logger.info("Delete");

		int res = biz.deleteProject(prNo);

		if (res > 0) {
			ScriptUtils.alertAndMovePage(response, "삭제 성공", "main.do");
		} else {
			ScriptUtils.alertAndMovePage(response, "삭제 실패", "detail.do?prNo=" + prNo);
		}
	}

	@RequestMapping("online.do")
	public String Online(Model model, int prNo, int usNo, int loginUsNo, String buyselect, HttpSession session) {
		System.out.println("online");

		UserDto dto = (UserDto) session.getAttribute("user");
		ProjectDto dto2 = biz.selectDetail(prNo);

		int cash = dto.getUsCash();
		int price = dto2.getPrPrice();

		result = cash - price;
		System.out.println(result);
		model.addAttribute("result1", result);
		model.addAttribute("dto", biz.selectDetail(prNo));

		return "trade/onlinetrade";

	}

	@RequestMapping("direct.do")
	public String Perchase(Model model, int prNo, int usNo, int loginUsNo, HttpSession session) {
		System.out.println("direct");

		UserDto dto = (UserDto) session.getAttribute("user");

		String phone1 = dto.getUsPhone().substring(0, 3);

		String phone2 = dto.getUsPhone().substring(4, 4);

		String phone3 = dto.getUsPhone().substring(4, 4);
		ProjectDto dto2 = biz.selectDetail(prNo);
		model.addAttribute("dto", dto2);

		System.out.println(dto.getUsPhone());
		System.out.println(phone1);
		System.out.println(phone2);
		System.out.println(phone3);

		model.addAttribute("phone", dto);

		int cash = dto.getUsCash();
		int price = dto2.getPrPrice();

		result = cash - price;
		System.out.println(result);
		model.addAttribute("result1", result);

		return "trade/directtrade";

	}


}
