package com.webtoonBoot.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.webtoonBoot.member.vo.MemberVO;

public interface AdminMemberDAO {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;
}
