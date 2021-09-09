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
public class ReviewDto extends ProjectDto{
    private int rvNo;
    private String rvContent;
    private Date rvDate;
    private double rvGrade;
    
    
    private int prNo;
    private int usBuyNo;
    private int usSellNo;
    private double rating;
    
    
    private int w;
    private double e;
}
