package com.webtoonBoot.goods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.webtoonBoot.common.base.BaseController;
import com.webtoonBoot.goods.service.GoodsService;
import com.webtoonBoot.goods.vo.GoodsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value = "/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	private GoodsService goodsService;

	@Override
	@RequestMapping(value = "/menuGoods.do", method = RequestMethod.GET)
	public ModelAndView menuGoods(@RequestParam("menuGoods") String menuGoods, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		List<GoodsVO> goodsList = goodsService.menuGoods(menuGoods);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		mav.addObject("menuGoods", menuGoods);
		return mav;
	}

	// 추천키워드
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam(name= "keyword") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		// keyword가 null인경우는 아무것도 return하지않는다.
		if (keyword == null || keyword.equals(""))
			return null;

		// 대소문자를 구분하지않고 검색하도록 한다.
		keyword = keyword.toUpperCase();
		List<String> keywordList = goodsService.keywordSearch(keyword);

		// 결과값 산출
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();

		// 변환한 string jsonObject, jsonInfo 리턴
		return jsonInfo;
	}

	@RequestMapping(value = "/searchGoods.do", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<GoodsVO> goodsList = goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		mav.addObject("searchWord",searchWord);
		return mav;
	}

	@RequestMapping(value = "/goodsDetail.do", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();

		// goods_id값에 맞는 상세정보 가져와 goodsMap 할당
		Map goodsMap = goodsService.goodsDetail(goods_id);
		mav.addObject("goodsMap", goodsMap);
		// goodsMap을 goodsVO 객체에 대입
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");

		// 퀵메뉴에 방문한 해당 상품정보를 추가
		addGoodsInQuick(goods_id, goodsVO, session);

		// 뷰 + 상품상세 정보 리턴
		return mav;
	}

	// 퀵메뉴
	private void addGoodsInQuick(String goods_id, GoodsVO goodsVO, HttpSession session) {
		
		// 중복체크를 위한 변수 초기화
		boolean already_existed = false;
		int duplicate_number = 0;
		// 기존 퀵메뉴 리스트 quickGoodsList 할당
		List<GoodsVO> quickGoodsList;
		quickGoodsList = (ArrayList<GoodsVO>) session.getAttribute("quickGoodsList");
		
		
		// 퀵메뉴에 리스트가 있을때
		if (quickGoodsList != null) {
			
			for (int i = 0; i < quickGoodsList.size(); i++) {
				String _goodsBean = String.valueOf(quickGoodsList.get(i).getGoods_id());
				// 상품id, goods_id가 동일하다면 already_existed=true, 코드종료.
				if (goods_id.equals(_goodsBean)) {
					already_existed = true;
					// 인덱스 번호를 저장시켜 중복일시에 인덱스번호에 해당하는 List 제거
					duplicate_number = i;
					break;
				}
			}
			
			// already_existed이 false, 중복되지않는 새로운 상품일 경우 add
			if (already_existed == false) {
				// 퀵메뉴 리스트에는 3개의 리스트만 표시할것임.
				if (quickGoodsList.size() < 3) {
					quickGoodsList.add(0,goodsVO);
				}else {
					// 퀵메뉴 리스트가 3개를 넘어가게 될경우
					// 마지막 상품을 없애고 새로운 상품을 추가.
					quickGoodsList.remove(2);
					quickGoodsList.add(0,goodsVO);
				}
			} else {
				// 중복될 경우 중복된 리스트 삭제 후 추가
				quickGoodsList.remove(duplicate_number);
				quickGoodsList.add(0,goodsVO);
			}

			// 퀵메뉴에 리스트가 없을 경우 새 ArrayList생성 및 추가 add
		} else {
			quickGoodsList = new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
		}
		// 위 작업을 완료 한 뒤 세션에 저장.
		session.setAttribute("quickGoodsList", quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}

}
