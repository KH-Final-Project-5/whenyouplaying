package com.controller;



import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.DealBiz;
import com.biz.UserBiz;
import com.commons.FtpClient;
import com.commons.ScriptUtils;
import com.dto.DealStatusDto;
import com.dto.DealStatusImgDto;
import com.dto.FinishDealDto;
import com.dto.UserDto;

@Controller
public class DealController {

    private static final Logger logger = LoggerFactory.getLogger(DealController.class);

    @Autowired
    DealBiz biz;

    @Autowired
    UserBiz biz1;

    @Autowired
    FtpClient ftpClient;

    @RequestMapping("/onlinetrade.do")
    public String OnlineTradeForm(Model model, DealStatusDto dto, HttpSession session) {

        DealStatusDto dealStatusDto = biz.SelectDeal(dto);
        biz.InsertFinDealStatus(dealStatusDto);
        UserDto dto1 = (UserDto) session.getAttribute("user");
        dto1.setUsCash(dto1.getUsCash() - dto.getDealPrice());
        biz.UpdateDealUser(dto1);

        dto1 = biz1.login(dto1);

        session.setAttribute("user", dto1);


        return "redirect:buylist.do?usNo=" + dto1.getUsNo() + "&finStatus=1";
    }
    
    @RequestMapping("/directtrade.do")
    public String DirectTradeForm(Model model, DealStatusDto dto, HttpSession session) {
    	
    	DealStatusDto dealStatusDto = biz.SelectDeal(dto);
    	biz.InsertFinDealStatus(dealStatusDto);
    	UserDto dto1 = (UserDto) session.getAttribute("user");
        dto1.setUsCash(dto1.getUsCash() - dto.getDealPrice());
        biz.UpdateDealUser(dto1);
        
        biz1.login(dto1);
        session.setAttribute("user", dto1);
        
        model.addAttribute("Deal", dealStatusDto);
        
    	return "redirect:buylist.do?usNo="+ dto1.getUsNo() + "&finStatus=1";
    }

    @RequestMapping("/onlineTradeSellForm.do")
    public String OnlineTradeSellerForm(Model model, int dealNo) {

        DealStatusDto dto = biz.SelectDealOne(dealNo);
        dto.setPrPrice((int) (dto.getPrPrice() * 0.7));
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);

        return "trade/onlinetradingseller";
    }


    @RequestMapping("/onlineSellerImgUpload.do")
    public void OnlineSellerImgUpload(MultipartHttpServletRequest multipartHttpServletRequest, DealStatusImgDto dto, HttpServletResponse response) throws Exception {

        List<MultipartFile> fileList = multipartHttpServletRequest.getFiles("files");
        String[] fileContent = dto.getImgContent();
        int res = 0;
        int result = 0;
        int index = 0;
        for (MultipartFile file : fileList) {
            String filename = file.getOriginalFilename();
            filename = ftpClient.fileName(filename, "deal" + dto.getDealNo());

            File file1 = ftpClient.convert(file);


            ftpClient.upload(file1, filename, "deal" + dto.getDealNo());
            dto.setDealImgContent(fileContent[index]);
            dto.setDealImgSrc("http://wjwan0.dothome.co.kr/stoarge/deal" + dto.getDealNo() + "/" + filename);
            res = biz.InsertImg(dto);
            if (res > 0) {
                result++;
            }

            index++;
        }

        if (result == fileList.size()) {
            ScriptUtils.alertAndMovePage(response, "입력 성공하였습니다.", "onlineTradeSellForm.do?dealNo=" + dto.getDealNo());
        }
    }

    @RequestMapping("/deletesellimg.do")
    public void OnlineDeleteSellImg(HttpServletResponse response, int dealImgNo, int dealNo) throws IOException {

        int res = biz.DeleteOnlineImg(dealImgNo);

        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "삭제가 완료되었습니다.",
                    "onlineTradeSellForm.do?dealNo=" + dealNo);
        }


    }

    @RequestMapping("/onlineTradeBuyForm.do")
    public String OnlineTradeBuyerForm(Model model, int dealNo) {

        logger.info("buyForm.do : 온라인 구매자 거래페이지");


        DealStatusDto dto = biz.SelectDealOneBuyer(dealNo);
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);

        return "trade/onlinetradingbuyer";
    }

    @RequestMapping("/buytradecomplete.do")
    public void TradingComplete(HttpSession session, HttpServletResponse response, DealStatusDto dto) throws IOException {
        logger.info("buytradecomplete.do : 재능거래완료");

        int res = biz.TradeComplete(dto.getDealNo());
        FinishDealDto finishDealDto = biz.DealCheck(dto.getDealNo());
        if (finishDealDto.getFinIf().equals("Y")) {
            UserDto userDto = biz.IdCheck(dto.getUsSellNo());

            int price = (int) (dto.getDealPrice() * 0.7);

            userDto.setUsCash(userDto.getUsCash() + price);
            biz.UpdateDealUser(userDto);


            UserDto userDto1 = new UserDto();
            userDto1.setUsNo(4);

            userDto1 = biz.IdCheck(userDto1.getUsNo());

            price = (int) (dto.getDealPrice() * 0.3);

            userDto1.setUsCash(userDto1.getUsCash() + price);
            biz.UpdateDealUser(userDto1);
        }


        if (res == -1) {
            ScriptUtils.alertAndMovePage(response, "구매 완료",
                    "buylist.do?usNo=" + dto.getUsNo() + "&finStatus=1");
        }


    }

    @RequestMapping("/onlinesellcomplete.do")
    public void OnlineSellComplete(HttpSession session, HttpServletResponse response, DealStatusDto dto) throws IOException {
        biz.TradeSellerComplete(dto.getDealNo());
        FinishDealDto finishDealDto = biz.DealCheck(dto.getDealNo());

        if (finishDealDto.getFinIf().equals("Y")) {
            UserDto userDto = (UserDto) session.getAttribute("user");

            int price = (int) (dto.getDealPrice() * 0.7);


            userDto.setUsCash(userDto.getUsCash() + price);
            biz.UpdateDealUser(userDto);

            userDto = biz.IdCheck(userDto.getUsNo());

            session.setAttribute("user", userDto);

            UserDto userDto1 = new UserDto();
            userDto1.setUsNo(4);

            userDto1 = biz.IdCheck(userDto1.getUsNo());

            price = (int) (dto.getDealPrice() * 0.3);

            userDto1.setUsCash(userDto1.getUsCash() + price);
            biz.UpdateDealUser(userDto1);
        }

        ScriptUtils.alertAndMovePage(response, "판매완료!", "main.do");


    }
}
