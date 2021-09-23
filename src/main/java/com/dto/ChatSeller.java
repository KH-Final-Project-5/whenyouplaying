package com.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatSeller {

    private String writer;
    private String buyer;
    private int dealNo;
    private String content;
    private String cal;

}
