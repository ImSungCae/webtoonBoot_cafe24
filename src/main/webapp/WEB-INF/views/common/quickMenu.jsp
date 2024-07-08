<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="cartCount" value="${sessionScope.cartCount}" />




<div id="sticky">
	<div>
		<a href="
		<c:choose>
			<c:when test="${isLogOn==true and not empty memberInfo }">
				${contextPath}/cart/myCartList.do
			</c:when>
			<c:otherwise>
				${contextPath }/member/loginForm.do
			</c:otherwise>
		</c:choose>
		">
		장바구니 <span>&nbsp;&nbsp; ${cartCount }</span></a>
		<p>최근본상품</p>
		<div>
			<c:choose>
				<c:when test="${empty quickGoodsList }">
					<p class="empty_list">최근 본 상품이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<form name="frm_sticky">
						<c:forEach var="item" items="${quickGoodsList }" varStatus="itemNum">
							<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
								<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
								>
							</a>
						</c:forEach>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
