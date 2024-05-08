package com.webtoonBoot.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.webtoonBoot.member.vo.MemberVO;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;
}
