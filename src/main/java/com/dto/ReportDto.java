package com.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportDto extends ProjectDto{
    private int decNo;
    private int usWriteNum;
    private String decContent;
    private String decStatus;
    private String decReason;
    private Date decDate;
}
