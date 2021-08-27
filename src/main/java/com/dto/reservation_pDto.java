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
public class reservation_pDto {
	
	private int rvno;
	private Date rvstart;
	private Date rvend;
}
