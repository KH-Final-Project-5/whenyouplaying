package com.biz;

import com.commons.Criteria;
import com.dto.MessageDto;

import java.util.List;

public interface MessageBiz {

    public int SendMessage(MessageDto dto);


    public int MesCountChk(int usNo);

    public List<MessageDto> MessageChk(Criteria criteria);

    public int MessageCount(Criteria criteria);

    public MessageDto ResendMessage(int mesNo);

    public int ReMessageSend(MessageDto dto);

    public int DeleteMessage(int mesNo);

    public int MessageStatus(int mesNo);


}
