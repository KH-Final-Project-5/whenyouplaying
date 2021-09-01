package com.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto extends ProjectDto {
    private int mesNo;
    private String usSendId;
    private String mesContents;
    private String mesStatus;
    private Date mesDate;
    private String mesDateSt;
}
