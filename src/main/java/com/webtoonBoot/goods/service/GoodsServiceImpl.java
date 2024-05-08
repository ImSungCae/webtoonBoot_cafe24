package com.webtoonBoot.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtoonBoot.goods.dao.GoodsDAO;
import com.webtoonBoot.goods.vo.GoodsVO;
import com.webtoonBoot.goods.vo.ImageFileVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();

		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("bestgoods");
		goodsMap.put("bestgoods", goodsList);
		goodsList = goodsDAO.selectGoodsList("newgoods");
		goodsMap.put("newgoods", goodsList);

		return goodsMap;
	}
	
	@Override
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception {
		return goodsDAO.selectMenusList(menuGoods);
	}

	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		return goodsDAO.selectKeywordSearch(keyword);
	}
	
	@Override
	public List<GoodsVO> searchGoods(String searchWord) throws Exception {
		return goodsDAO.selectGoodsBySearchWord(searchWord);
	}

	@Override
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id);
		goodsMap.put("goodsVO", goodsVO);
		
		List<ImageFileVO> imageList = goodsDAO.selectGoodsDetailImage(_goods_id);
		goodsMap.put("imageList", imageList);
		
		return goodsMap;
	}

	
}
