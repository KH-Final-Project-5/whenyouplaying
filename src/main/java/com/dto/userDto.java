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
public class userDto {
	
	private int usno;
	private String usid;
	private String uspw;
	private String usname;
	private String usphone;
	private String usemail;
	private String ustalent;
	private Date usdate;
	private String usstatus;
	private String usrole;
	private int uscash;
}
