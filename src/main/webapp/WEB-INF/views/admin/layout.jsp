<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- intercepter에서 set한 회원정보에 따른 조회값  get -->
<c:set var="goodsLen" value="${sessionScope.goodsLen}" />
<c:set var="ordersLen" value="${sessionScope.ordersLen}" />
<c:set var="membersLen" value="${sessionScope.membersLen}" />
<c:set var="totalSales" value="${sessionScope.totalSales}" />
<!-- intercepter에서 set한 회원정보에 따른 조회값  get -->

<!-- 레이아웃 컨테이너  -->
<div class="container">
	<div class="mypageBox">관리자</div>
	<div class="mypageBox">
		<h5>상품</h5>

		<!-- 상품 개수 카운트 -->
		<span>${goodsLen }</span>
		<!-- 상품 개수 카운트 -->

	</div>
	<div class="mypageBox">
		<h5>회원</h5>

		<!-- 회원 수 카운트 -->
		<span>${membersLen }</span>
		<!-- 회원 수 카운트 -->

	</div>
	<div class="mypageBox">
		<h5>주문건수</h5>

		<!-- 주문건수 카운트 -->
		<span>${ordersLen }</span>
		<!-- 주문건수 카운트 -->

	</div>
	<div class="mypageBox" id="totPrice_box">
		<h5>총 매출</h5>

		<!-- 총 매출 -->
		<span><fmt:formatNumber value="${totalSales }" pattern="#,###"/></span>
		<!-- 총 매출 -->

	</div>

	<!-- side 메뉴 -->
	<div class="side">
		<b>관리자</b><br> 
		<a href="${contextPath }/admin/goods/adminGoodsMain.do">상품관리</a><br>
		 <a href="${contextPath }/admin/order/adminOrderMain.do">주문/배송관리</a><br>
		<a href="${contextPath }/admin/member/adminMemberMain.do">회원관리</a>
	</div>
	<!-- side 메뉴 -->
</div>
<!-- 레이아웃 컨테이너  -->


