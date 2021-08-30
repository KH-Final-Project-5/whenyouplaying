package com.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AbilityDto extends UserDto {
    private int abNo;
    private String abCate;
    private String abTitle;
    private String abContent;
    private Date abDate;
    private String abStatus;
    private String abImg1;
    private String abImg2;
    private String usName;
    private String usPhone;
    private String usEmail;
    private MultipartFile file1;
    private MultipartFile file2;
    //	private int usNo;
    //	private String usId;
}
