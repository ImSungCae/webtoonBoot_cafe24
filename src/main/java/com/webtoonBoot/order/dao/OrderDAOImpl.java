package com.webtoonBoot.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webtoonBoot.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException {
		List<OrderVO> orderGoodsList=new ArrayList<OrderVO>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.order.selectMyOrderList",orderVO);
		return orderGoodsList;
	}
	
	
	@Override
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO)myOrderList.get(i);
			sqlSession.insert("mapper.order.insertNewOrder",orderVO);
			
		}
	}
	
	@Override
	public OrderVO findMyOrder(String order_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectMyOrder",order_id);
	}	

	@Override
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException{
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);	
		}
	}
	@Override
	public void removeGoodsFromCart(OrderVO orderVO)throws DataAccessException{
			sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);	
	}


	
	
	
}
