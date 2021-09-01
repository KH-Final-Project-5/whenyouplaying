package com.dao;

import com.dto.MessageDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoImpl implements MessageDao{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public int SendMessage(MessageDto dto) {

        int res = 0;

        try {
            res = sqlSessionTemplate.insert(NAMESPACE + "sendmessage", dto);
        } catch (Exception e) {
            System.out.println("전송 실패");
            e.printStackTrace();
        }


        return res;
    }
}
