package com.webtoonBoot.admin.order.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface AdminOrderController {
	
	public ModelAndView adminOrderMain(@RequestParam Map<String, String> dateMap,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, 
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
