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
public class projectDto {
	private int prno;
	private String prtitle;
	private String prcontent;
	private String prprice;
	private Date prwritedate;
	private String prtalent;
	private String prdeal;
	private String pryoutube;
	private String primage;
	private Date prdate;
	private String prstatus;
	private String prlatitude;
	private String prlongitude;
	private String praddress;
}
