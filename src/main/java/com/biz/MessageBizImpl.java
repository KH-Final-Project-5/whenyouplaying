package com.biz;

import com.dao.MessageDao;
import com.dto.MessageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageBizImpl implements MessageBiz {

    @Autowired
    MessageDao dao;

    @Override
    public int SendMessage(MessageDto dto) {
        return dao.SendMessage(dto);
    }
}
