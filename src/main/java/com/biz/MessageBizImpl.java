package com.biz;

import com.commons.Criteria;
import com.dao.MessageDao;
import com.dto.MessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageBizImpl implements MessageBiz {

    @Autowired
    MessageDao dao;

    @Override
    public int SendMessage(MessageDto dto) {
        return dao.SendMessage(dto);
    }

    @Override
    public int MesCountChk(int usNo) {
        return dao.MesCountChk(usNo);
    }

    @Override
    public List<MessageDto> MessageChk(Criteria criteria) {
        return dao.MessageChk(criteria);
    }

    @Override
    public int MessageCount(Criteria criteria) {
        return dao.MessageCount(criteria);
    }

    @Override
    public MessageDto ResendMessage(int mesNo) {
        return dao.ResendMessage(mesNo);
    }

    @Override
    public int ReMessageSend(MessageDto dto) {
        return dao.ReMessageSend(dto);
    }

    @Override
    public int DeleteMessage(int mesNo) {
        return dao.DeleteMessage(mesNo);
    }

    @Override
    public int MessageStatus(int mesNo) {
        return dao.MessageStatus(mesNo);
    }
}
