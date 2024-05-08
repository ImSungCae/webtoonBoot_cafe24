package com.webtoonBoot.mypage.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface MyPageController {
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView cancelMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView returnMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView exchangeMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity modifyMyInfo(@RequestParam("member_pwd") String member_pwd,
			@RequestParam("member_name") String member_name, @RequestParam("hp1") String hp1,
			@RequestParam("zipcode") String zipcode, @RequestParam("address") String address,
			@RequestParam("subAddress") String subAddress, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity deleteMember(@RequestParam("member_id") String member_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
