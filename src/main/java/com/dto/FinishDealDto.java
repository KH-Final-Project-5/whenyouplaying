package com.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FinishDealDto extends DealStatusDto {
	
	
	private int finNo;
	private String finStatus;
	private Date finDate;
	private String finIf;
	
	
	
	
	
	
}
