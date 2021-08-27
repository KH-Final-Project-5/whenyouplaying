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
public class abilityDto {
	
	private int abno;
	private String abcate;
	private String abtitle;
	private String abcontent;
	private Date abdate;
	private String abstatus;
	private String abimg1;
	private String abimg2;
}
