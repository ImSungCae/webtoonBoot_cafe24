package com.webtoonBoot.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtoonBoot.common.base.BaseController;
import com.webtoonBoot.member.vo.MemberVO;
import com.webtoonBoot.mypage.service.MyPageService;
import com.webtoonBoot.order.vo.OrderVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("myPageController")
@RequestMapping(value = "/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do" ,method = RequestMethod.GET)
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
			                               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		
		String beginDate=null,endDate=null;
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("member_id", member_id);
		List<OrderVO> myOrderHistList=myPageService.listMyOrderHistory(dateMap);
		
		String beginDate1[]=beginDate.split("-"); 
		String endDate1[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate1[0]);
		mav.addObject("endMonth",endDate1[1]);
		mav.addObject("endDay",endDate1[2]);
		mav.addObject("myOrderHistList", myOrderHistList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView cancelMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelOrder(order_id);
		mav.addObject("message", "cancel_order");
		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/returnMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView returnMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.returnOrder(order_id);
		mav.addObject("message", "returning_goods");
		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/exchangeMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView exchangeMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.exchangeOrder(order_id);
		mav.addObject("message", "exchange_goods");
		mav.setViewName("redirect:/mypage/listMyOrderHistory.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myDetailInfo.do",method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyMyInfo.do",method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(
			@RequestParam("member_pwd") String member_pwd,
			@RequestParam("member_name") String member_name,
			@RequestParam("hp1") String hp1,
			@RequestParam("zipcode") String zipcode,
			@RequestParam("address") String address,
			@RequestParam("subAddress") String subAddress, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String,String> memberMap = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		memberMap.put("member_pwd",member_pwd);
		memberMap.put("member_name",member_name);
		memberMap.put("hp1",hp1);
		memberMap.put("zipcode",zipcode);
		memberMap.put("address",address);
		memberMap.put("subAddress",subAddress);
		memberMap.put("member_id", member_id);
		
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responHeaders = new HttpHeaders();
		
		message = "mod_success";
		resEntity = new ResponseEntity(message,responHeaders,HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/deleteMember.do",method = RequestMethod.POST)
	public ResponseEntity deleteMember(@RequestParam("member_id") String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		myPageService.deleteMember(member_id);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responHeaders = new HttpHeaders();
		
		message = "delete_success";
		resEntity = new ResponseEntity(message,responHeaders,HttpStatus.OK);
		return resEntity;
	}


}
