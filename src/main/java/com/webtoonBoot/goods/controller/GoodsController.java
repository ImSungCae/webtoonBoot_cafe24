package com.webtoonBoot.goods.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface GoodsController {
	public ModelAndView menuGoods(@RequestParam("menuGoods") String menuGoods,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
