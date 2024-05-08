package com.webtoonBoot.admin.order.service;

import java.util.List;
import java.util.Map;

import com.webtoonBoot.order.vo.OrderVO;

public interface AdminOrderService {
	public List<OrderVO> listNewOrder(Map condMap) throws Exception;

	public void modifyDeliveryState(Map deliveryMap) throws Exception;
}
