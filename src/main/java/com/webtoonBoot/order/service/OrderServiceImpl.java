package com.webtoonBoot.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtoonBoot.order.dao.OrderDAO;
import com.webtoonBoot.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception {
		return orderDAO.listMyOrderGoods(orderVO);
	}

	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		orderDAO.insertNewOrder(myOrderList);
		orderDAO.removeGoodsFromCart(myOrderList);
	}

	@Override
	public OrderVO findMyOrder(String order_id) throws Exception {
		return orderDAO.findMyOrder(order_id);
	}

}
