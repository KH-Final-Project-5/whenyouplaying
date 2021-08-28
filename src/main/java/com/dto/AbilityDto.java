package com.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AbilityDto {
	private int abNo;
	private String abCate;
	private String abTitle;
	private String abContent;
	private Date abDate;
	private String abStatus;
	private String abImg1;
	private String abImg2;
	private int usNo;
	private UserDto userDto;
}
