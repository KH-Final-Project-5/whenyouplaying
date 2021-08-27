package com.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor

@AllArgsConstructor
public class chargeHistoryDto {
	private int chno;
	private int chcash;
	private Date chdate;
	private String chstatus;
}
