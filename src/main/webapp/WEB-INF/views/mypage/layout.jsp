<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="cartCount" value="${sessionScope.cartCount}" />
<c:set var="deliveringCount" value="${sessionScope.deliveringCount}" />
	<!-- 레이아웃 컨테이너  -->
	<div class="container">
		<div class="mypageBox">
			MyPage
		</div>
		<div class="mypageBox">
			<h5>배송중</h5>
			
			<!-- 배송중 카운트 -->
			<span>${deliveringCount }</span>
			<!-- 배송중 카운트 -->
			
		</div>
		<div class="mypageBox">
			<h5>장바구니</h5>
			
			<!-- 장바구니 카운트 -->
			<span>${cartCount }</span>
			<!-- 장바구니 카운트 -->
			
		</div>
		<div class="mypageBox lastbox">
			<h5>${memberInfo.member_name }님 환영합니다!</h5>
		</div>
			
		<!-- side 메뉴 -->
		<div class="side">
			<b>마이페이지</b><br>
			<a href="${contextPath }/mypage/listMyOrderHistory.do">주문목록</a><br>
			<a href="${contextPath }/cart/myCartList.do">장바구니</a><br>
			<a href="${contextPath }/mypage/myDetailInfo.do">내정보</a>
		</div>
		<!-- side 메뉴 -->
	</div> 
	<!-- 레이아웃 컨테이너  -->
	
	
