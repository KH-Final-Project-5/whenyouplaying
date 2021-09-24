package com.controller;

import com.biz.ProjectBiz;
import com.biz.ReportBiz;
import com.commons.Criteria;
import com.commons.PageMaker;
import com.commons.ScriptUtils;
import com.dao.ReportDao;
import com.dto.AbilityDto;
import com.dto.ProjectDto;
import com.dto.ReportDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReportController {

    @Autowired
    ReportBiz biz;

    @RequestMapping("/reportsend.do")
    @ResponseBody
    public Map<String, Boolean> ReportSend(ReportDto dto) {

        int res = 0;

        boolean check = false;

        res = biz.ReportSend(dto);

        Map<String, Boolean> map = new HashMap<>();

        if (res > 0) {
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping("/reportMain.do")
    public String ReportMain(Model model, Criteria criteria) {

        if (criteria.getChange().equals("no")) {
            criteria.setChange("");
        } else if (criteria.getChange().equals("a")) {
            criteria.setChange("삭제 완료");
        } else if (criteria.getChange().equals("b")) {
            criteria.setChange("삭제 반려");
        } else if (criteria.getChange().equals("c")) {
            criteria.setChange("삭제 대기");
        }

        List<ReportDto> list = biz.ReportListPaing(criteria);
        List<ReportDto> userlist = biz.ReportListUser(criteria);

        for (ReportDto dto : list) {
            if (dto.getDecContent().contains("음란성")) {
                dto.setDecReason("음란성");
            } else if (dto.getDecContent().contains("홍보")) {
                dto.setDecReason("홍보");
            } else if (dto.getDecContent().contains("저작권")) {
                dto.setDecReason("저작권");
            } else {
                dto.setDecReason("기타");
            }
        }

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(biz.ReportListCount(criteria));

        model.addAttribute("decList", list);
        model.addAttribute("userList", userlist);
        model.addAttribute("pageMaker", pageMaker);


        return "admin/reportMain";
    }

    @RequestMapping("/reportCheck.do")
    public String reportChk(Model model, ReportDto dto) {

        ReportDto reportDto = biz.ReportCheck(dto);
        ReportDto userDto = biz.ReportCheckUser(dto);

        model.addAttribute("reportDto", reportDto);
        model.addAttribute("userDto", userDto);


        return "admin/reportCheck";
    }

    @RequestMapping("/reportDetail.do")
    public String ReportDetail(ReportDto dto, Model model) {

        ReportDto reportDto = biz.ReportCheck(dto);

        model.addAttribute("dto", reportDto);


        return "admin/reportDetail";
    }

    @RequestMapping("/reportsubmit.do")
    public void ReportSubmit(HttpServletResponse response, int prNo, int decNo) throws IOException {

        int res = biz.ReportComplete(prNo, decNo);


        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "승인 완료", "reportMain.do?change=no");
        }

    }

    @RequestMapping("/reportNega.do")
    public void ReportNega(HttpServletResponse response, int decNo) throws IOException {

        int res = biz.ReportNega(decNo);

        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "반려 완료", "reportMain.do?change=no");
        }
    }
}
