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
public class WithDrawDto extends UserDto{
	
	
	private int wiNo;
	private int wiCash;
	private Date wiDate;
	private String wiStatus;
	private String wiBank;
}
