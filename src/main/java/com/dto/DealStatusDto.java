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
public class DealStatusDto extends ProjectDto{
	private int dealNo;
	private int usSellNo;
	private int usBuyNo;
	private int dealPrice;
	private String chatFile;
}
