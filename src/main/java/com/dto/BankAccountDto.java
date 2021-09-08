package com.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BankAccountDto extends UserDto{

	private int baNo;
	private String baNickName;
	private String baBankName;
	private String baBankNumber;
	private String baOwner;
	
}
