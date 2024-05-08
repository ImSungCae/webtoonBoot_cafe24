package com.webtoonBoot.cart.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CartController {
		//장바구니
		public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

		//장바구니 추가
		public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, 
				@RequestParam("cart_goods_qty") int cart_goods_qty,HttpServletRequest request,
				HttpServletResponse response) throws Exception;

		//장바구니 삭제
		public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id, HttpServletRequest request,
				
				HttpServletResponse response) throws Exception;

		//장바구니 수정
		public @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goods_id,
				@RequestParam("cart_goods_qty") int cart_goods_qty, HttpServletRequest request,
				HttpServletResponse response) throws Exception;
}
