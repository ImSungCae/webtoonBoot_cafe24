<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<img class="banner" src="${contextPath}/resources/image/main_banner_${menuGoods }.jpg">
		<h4 class="goodsCount">상품 <span>(${goodsList.size()})</span>
		</h4>
	<div id="menuGoods">
		<c:choose>
			<c:when test="${empty goodsList }">
				해당 카테고리에 상품이 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${goodsList }">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"> 
					<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> 
								<p>${item.goods_title}</p>
								<p><span>&#8361;
								<fmt:formatNumber value="${item.goods_price}" pattern="#,###" />
								</span></p>
							</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
