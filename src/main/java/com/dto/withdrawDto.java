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
public class withdrawDto {
	
	
	
	private int wino;
	private int wicash;
	private Date widate;
	private String wistatus;
}
