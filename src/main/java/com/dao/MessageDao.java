package com.dao;

import com.dto.MessageDto;

public interface MessageDao {

    String NAMESPACE = "message.";

    public int SendMessage(MessageDto dto);

}
