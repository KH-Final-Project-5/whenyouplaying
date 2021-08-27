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
public class ChargeHistoryDto {
	private int chNo;
	private int chCash;
	private Date chDate;
	private String chStatus;
}
