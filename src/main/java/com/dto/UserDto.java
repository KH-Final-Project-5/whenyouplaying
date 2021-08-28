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
public class UserDto {
	
	private int usNo;
	private String usId;
	private String usPw;
	private String usName;
	private String usPhone;
	private String usAddress;
	private String usEmail;
	private String usTalent;
	private Date usDate;
	private String usStatus;
	private String usRole;
	private int usCash;
}
