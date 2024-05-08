package com.webtoonBoot.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webtoonBoot.member.vo.MemberVO;
import com.webtoonBoot.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException {
		return sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList",dateMap);
	}
	
	@Override
	public void updateMyOrderCancel(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderCancel",order_id);
	}
	
	@Override
	public void updateMyOrderReturn(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderReturn",order_id);
	}
	
	@Override
	public void updateMyOrderExchange(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderExchange",order_id);
	}
	
	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",member_id);
	}

	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}

	@Override
	public void deleteMember(String member_id) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteMember",member_id);
	}

	
}
