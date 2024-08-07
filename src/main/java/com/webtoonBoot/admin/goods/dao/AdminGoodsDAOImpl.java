package com.webtoonBoot.admin.goods.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webtoonBoot.goods.vo.GoodsVO;
import com.webtoonBoot.goods.vo.ImageFileVO;
import com.webtoonBoot.order.vo.OrderVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.admin.goods.insertNewGoods", newGoodsMap);
		return ((BigInteger) newGoodsMap.get("goods_id")).intValue();
	}

	@Override
	public void insertGoodsImageFile(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) fileList.get(i);
			sqlSession.insert("mapper.admin.goods.insertGoodsImageFile", imageFileVO);
		}
	}

	@Override
	public List<GoodsVO> selectNewGoodsList(Map condMap) throws DataAccessException {
		ArrayList<GoodsVO> goodsList = (ArrayList) sqlSession.selectList("mapper.admin.goods.selectNewGoodsList",
				condMap);
		return goodsList;
	}

	@Override
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException {
		GoodsVO goodsBean = new GoodsVO();
		goodsBean = (GoodsVO) sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail", goods_id);
		return goodsBean;
	}

	@Override
	public List selectGoodsImageFileList(int goods_id) throws DataAccessException {
		List imageList = new ArrayList();
		imageList = (List) sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList", goods_id);
		return imageList;
	}

	@Override
	public List<OrderVO> selectOrderGoodsList(Map condMap) throws DataAccessException {
		List<OrderVO> orderGoodsList = (ArrayList) sqlSession.selectList("mapper.admin.selectOrderGoodsList", condMap);
		return orderGoodsList;
	}


	@Override
	public void deleteGoods(int goods_id) {
		sqlSession.delete("mapper.admin.goods.deleteGoods", goods_id);
		sqlSession.delete("mapper.admin.goods.deleteimages", goods_id);
	}

	@Override
	public void modifyGoods(String goods_id, Map newGoodsMap) throws Exception {
		sqlSession.update("mapper.admin.goods.modifyGoods", newGoodsMap);
	}

	@Override
	public void modifyImages(List imageFileList) throws Exception {
		for (int i = 0; i < imageFileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) imageFileList.get(i);
			sqlSession.insert("mapper.admin.goods.modifyimages", imageFileVO);
		}

	}

}