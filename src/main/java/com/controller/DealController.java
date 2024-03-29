package com.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.*;
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

@Controller
public class DealController {

    private static final Logger logger = LoggerFactory.getLogger(DealController.class);

    @Autowired
    DealBiz biz;

    @Autowired
    UserBiz biz1;

    FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");

    @RequestMapping("/onlinetrade.do")
    public String OnlineTradeForm(Model model, DealStatusDto dto, HttpSession session) throws Exception {

        DealStatusDto dealStatusDto = biz.SelectDeal(dto);
        biz.InsertFinDealStatus(dealStatusDto);
        UserDto dto1 = (UserDto) session.getAttribute("user");
        dto1.setUsCash(dto1.getUsCash() - dto.getDealPrice());
        biz.UpdateDealUser(dto1);

        dto1 = biz1.login(dto1);

        String dealNo = String.valueOf(dealStatusDto.getDealNo());

        session.setAttribute("user", dto1);

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = new File(dir, dealNo + ".txt");

        FileOutputStream fileOutputStream = new FileOutputStream(file, true);

        String filename = file.getName();

        ftpClient.uploadTxt(file, filename);
        System.out.println("파일 생성");

        file.delete();

        return "redirect:buylist.do?usNo=" + dto1.getUsNo() + "&finStatus=1";
    }



    @RequestMapping("/directtrade.do")
    public String DirectTradeForm(Model model, DealStatusDto dto, HttpSession session, String tradePhone_1, String tradePhone_2, String tradePhone_3) throws Exception {

        DealStatusDto dealStatusDto = biz.SelectDeal(dto);
        biz.InsertFinDealStatus(dealStatusDto);

        UserDto dto1 = (UserDto) session.getAttribute("user");

        dto1.setUsName(dto.getUsName());
        dto1.setUsAddress1(dto.getUsAddress1());
        dto1.setUsAddress2(dto.getUsAddress2());


        dto1.setUsCash(dto1.getUsCash() - dto.getDealPrice());
        biz.UpdateDealUser(dto1);

        String phone = tradePhone_1 + tradePhone_2 + tradePhone_3;
        dto1.setUsPhone(phone);
        biz.UpdateUserDeal(dto1);


        biz1.login(dto1);

        String dealNo = String.valueOf(dealStatusDto.getDealNo());

        session.setAttribute("user", dto1);

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = new File(dir, dealNo + ".txt");

        FileOutputStream fileOutputStream = new FileOutputStream(file, true);

        String filename = file.getName();

        ftpClient.uploadTxt(file, filename);
        System.out.println("파일 생성");

        file.delete();


        session.setAttribute("user", dto1);

        model.addAttribute("Deal", dealStatusDto);

        return "redirect:buylist.do?usNo=" + dto1.getUsNo() + "&finStatus=1";
    }

    @RequestMapping("/onlineTradeSellForm.do")
    public String OnlineTradeSellerForm(Model model, int dealNo) throws Exception {

        DealStatusDto dto = biz.SelectDealOne(dealNo);
        dto.setPrPrice((int) (dto.getPrPrice() * 0.7));
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);
        String line = ChatDownload(dealNo);
        model.addAttribute("chat", line);

        return "trade/onlinetradingseller";
    }

    @RequestMapping("/directTradeSellForm.do")
    public String DirectTradeSellerForm(Model model, int dealNo) throws Exception {

        DealStatusDto dto = biz.SelectDealOne(dealNo);
        dto.setPrPrice((int) (dto.getPrPrice() * 0.7));
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);
        String line = ChatDownload(dealNo);
        model.addAttribute("chat", line);

        return "trade/directtradingseller";
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
            ScriptUtils.alertAndMovePage(response, "사진 업로드 완료.", "onlineTradeSellForm.do?dealNo=" + dto.getDealNo());
        }
    }

    @RequestMapping("/deletesellimg.do")
    public void OnlineDeleteSellImg(HttpServletResponse response, int dealImgNo, int dealNo) throws IOException {

        int res = biz.DeleteOnlineImg(dealImgNo);

        if (res > 0) {
            ScriptUtils.alertAndMovePage(response, "삭제 완료.",
                    "onlineTradeSellForm.do?dealNo=" + dealNo);
        }


    }

    @RequestMapping("/onlineTradeBuyForm.do")
    public String OnlineTradeBuyerForm(Model model, int dealNo) throws Exception {


        DealStatusDto dto = biz.SelectDealOneBuyer(dealNo);
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);

        String line = ChatDownload(dealNo);
        model.addAttribute("chat", line);


        return "trade/onlinetradingbuyer";
    }


    @RequestMapping("/directTradeBuyForm.do")
    public String DirectTradeBuyerForm(Model model, int dealNo) throws Exception {


        DealStatusDto dto = biz.SelectDealOneBuyer(dealNo);
        List<DealStatusImgDto> list = biz.SelectDealImg(dealNo);

        model.addAttribute("dto", dto);
        model.addAttribute("list", list);
        String line = ChatDownload(dealNo);
        model.addAttribute("chat", line);




        return "trade/directtradingbuyer";
    }

    @RequestMapping("/buytradecomplete.do")
    public String TradingComplete(DealStatusDto dto, Model model) {
        logger.info("buytradecomplete.do : 재능거래완료");
        UserDto userDto = null;

        int res = biz.TradeComplete(dto.getDealNo());
        FinishDealDto finishDealDto = biz.DealCheck(dto.getDealNo());
        userDto = biz.IdCheck(finishDealDto.getUsSellNo());
        System.out.println(res);
        if (res == 2) {
            if (finishDealDto.getFinIf().equals("Y")) {

                int price = (int) (dto.getDealPrice() * 0.7);

                userDto.setUsCash(userDto.getUsCash() + price);
                biz.UpdateDealUser(userDto);


                UserDto userDto1 = new UserDto();
                userDto1.setUsNo(2);

                userDto1 = biz.IdCheck(userDto1.getUsNo());

                price = (int) (dto.getDealPrice() * 0.3);

                userDto1.setUsCash(userDto1.getUsCash() + price);
                biz.UpdateDealUser(userDto1);

            }
        }
        List<ProjectDto> list = biz.SelectTwo(finishDealDto.getPrTalent());
        int price = (int) (finishDealDto.getDealPrice() * 0.3);
        model.addAttribute("price", price);
        model.addAttribute("SellUser", userDto);
        model.addAttribute("All", finishDealDto);
        model.addAttribute("list", list);


        return "trade/dealFin";

    }

    @RequestMapping("/onlinesellcomplete.do")
    public void OnlineSellComplete(HttpSession session, HttpServletResponse response, DealStatusDto dto) throws
            IOException {
        int res = biz.TradeSellerComplete(dto.getDealNo());
        int price = 0;
        UserDto userDto = null;

        if (res == 2) {
            userDto = (UserDto) session.getAttribute("user");

            price = (int) (dto.getDealPrice() * 0.7);


            userDto.setUsCash(userDto.getUsCash() + price);

            biz.UpdateDealUser(userDto);

            userDto = biz.IdCheck(userDto.getUsNo());

            session.setAttribute("user", userDto);

            UserDto userDto1 = new UserDto();
            userDto1.setUsNo(2);

            userDto1 = biz.IdCheck(userDto1.getUsNo());

            price = (int) (dto.getDealPrice() * 0.3);

            userDto1.setUsCash(userDto1.getUsCash() + price);
            biz.UpdateDealUser(userDto1);
        }

        ScriptUtils.alertAndMovePage(response, "판매 완료!", "main.do");


    }

    @RequestMapping("/directsellcomplete.do")
    public void directSellComplete(HttpSession session, HttpServletResponse response, DealStatusDto dto) throws
            IOException {
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
            userDto1.setUsNo(2);

            userDto1 = biz.IdCheck(userDto1.getUsNo());

            price = (int) (dto.getDealPrice() * 0.3);

            userDto1.setUsCash(userDto1.getUsCash() + price);
            biz.UpdateDealUser(userDto1);
        }

        ScriptUtils.alertAndMovePage(response, "구매완료!", "main.do");

    }

    @RequestMapping("/videochat.do")
    public String VideoChat(int dealNo, Model model) {

        model.addAttribute("dealNo", dealNo);

        return "trade/videochat";
    }

    public String ChatDownload(int dealNo) throws Exception {

        String deal = String.valueOf(dealNo);

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt(deal, dir);

        Path path = Paths.get(dir + "/" + deal + ".txt");

        Stream<String> lines = Files.lines(path);

        String line = lines.collect(Collectors.joining(System.lineSeparator()));
        file.delete();
        return line;
    }
}