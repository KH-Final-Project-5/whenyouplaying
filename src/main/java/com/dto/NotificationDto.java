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
public class NotificationDto extends UserDto {
	
	private int notiNo;
	private String notiTitle;
	private String notiContent;
	private Date notiDate;
	private int notiViews;
}
