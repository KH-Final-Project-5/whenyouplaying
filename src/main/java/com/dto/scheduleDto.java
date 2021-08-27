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
public class scheduleDto {
	private int scno;
	private String sctitle;
	private Date scstart;
	private Date scend;
}
