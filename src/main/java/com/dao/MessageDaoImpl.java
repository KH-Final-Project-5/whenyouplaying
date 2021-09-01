package com.dao;

import com.commons.Criteria;
import com.dto.MessageDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public int MesCountChk(int usNo) {

        int res = 0;

        try {
            res = sqlSessionTemplate.selectOne(NAMESPACE + "mesNoReadCount", usNo);
        } catch (Exception e) {
            System.out.println("카운팅 불가");
            e.printStackTrace();
        }


        return res;
    }

    @Override
    public List<MessageDto> MessageChk(Criteria criteria) {

        List<MessageDto> list = new ArrayList<>();

        try {
            list = sqlSessionTemplate.selectList(NAMESPACE + "mesPagingList", criteria);
        } catch (Exception e) {
            System.out.println("쪽지 리스트 페이징 실패");
            e.printStackTrace();
        }


        return list;
    }

    @Override
    public int MessageCount(Criteria criteria) {

        int res = 0;

        try {
            res = sqlSessionTemplate.selectOne(NAMESPACE + "mesPagingCount", criteria);
        } catch (Exception e) {
            System.out.println("카운팅 실패");
            e.printStackTrace();
        }


        return res;
    }

    @Override
    public MessageDto ResendMessage(int mesNo) {

        MessageDto dto = null;

        try {
            dto = sqlSessionTemplate.selectOne(NAMESPACE + "ResendMessage", mesNo);
        } catch (Exception e) {
            System.out.println("쪽지 하나 가져오기");
            e.printStackTrace();
        }


        return dto;
    }

    @Override
    public int ReMessageSend(MessageDto dto) {

        int res = 0;

        try {
            res = sqlSessionTemplate.insert(NAMESPACE + "ResendMessageOut", dto);
        } catch (Exception e) {
            System.out.println("답장 실패");
            e.printStackTrace();
        }


        return res;
    }

    @Override
    public int DeleteMessage(int mesNo) {

        int res = 0;

        try {
            res = sqlSessionTemplate.delete(NAMESPACE + "DeleteMessage", mesNo);
        } catch (Exception e) {
            System.out.println("삭제 실패");
            e.printStackTrace();
        }


        return res;
    }

    @Override
    public int MessageStatus(int mesNo) {

        int res = 0;

        try {
            res = sqlSessionTemplate.update(NAMESPACE + "StatusUpdate", mesNo);
        } catch (Exception e) {
            System.out.println("확인처리 실패");
            e.printStackTrace();
        }


        return res;
    }

}
