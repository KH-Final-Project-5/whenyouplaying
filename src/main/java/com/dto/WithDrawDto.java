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
public class WithDrawDto {
	
	
	
	private int wiNo;
	private int wiCash;
	private Date wiDate;
	private String wiStatus;
}
