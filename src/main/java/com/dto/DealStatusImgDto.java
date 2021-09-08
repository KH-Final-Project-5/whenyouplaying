package com.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DealStatusImgDto extends DealStatusDto {

	private int dealImgNo;
	private String dealImgSrc;
	private String dealImgContent;

	private String[] imgContent;

}
