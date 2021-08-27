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
public class notificationDto {
	
	private int notino;
	private String notititle;
	private String noticontent;
	private Date notidate;
	private int notiviews;
}
