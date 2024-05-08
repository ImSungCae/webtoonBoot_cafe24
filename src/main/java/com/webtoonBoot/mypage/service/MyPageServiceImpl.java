package com.webtoonBoot.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtoonBoot.member.vo.MemberVO;
import com.webtoonBoot.mypage.dao.MyPageDAO;
import com.webtoonBoot.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception {
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}
	
	@Override
	public void cancelOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderCancel(order_id);
	}
	
	@Override
	public void returnOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderReturn(order_id);
	}
	
	@Override
	public void exchangeOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderExchange(order_id);
	}
	
	@Override
	public MemberVO myDetailInfo(String member_id) throws Exception {
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		String member_id = (String)memberMap.get("member_id");
		myPageDAO.updateMyInfo(memberMap);
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		myPageDAO.deleteMember(member_id);
	}


}
