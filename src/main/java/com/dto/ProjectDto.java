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
public class ProjectDto {
	private int prNo;
	private String prTitle;
	private String prContent;
	private String prPrice;
	private Date prWriteDate;
	private String prTalent;
	private String prDeal;
	private String prYoutube;
	private String prImage;
	private Date prDate;
	private String prStatus;
	private String prLatitude;
	private String prLongitude;
	private String prAddress;
}
