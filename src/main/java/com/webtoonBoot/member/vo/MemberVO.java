package com.webtoonBoot.member.vo;


import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component("memberVO")
public class MemberVO {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String hp1;
	private String zipcode;
	private String address;
	private String subAddress;
	private String joinDate;
	private String del_yn;
	
	
}
