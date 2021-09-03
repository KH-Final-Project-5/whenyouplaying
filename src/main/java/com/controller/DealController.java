package com.controller;


import com.biz.DealBiz;
import com.dto.DealStatusDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DealController {

    @Autowired
    DealBiz biz;

    @RequestMapping("/onlinetrade.do")
    public String OnlineTradeForm(Model model, DealStatusDto dto) {


        DealStatusDto dealStatusDto = biz.SelectDeal(dto);

        model.addAttribute("Deal", dealStatusDto);


        return "trade/onlinetradingbuyer";
    }
}
