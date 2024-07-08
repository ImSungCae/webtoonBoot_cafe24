<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<div id="slide">
		<ul>
			<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=화산귀환"><img alt="배너1" src="${contextPath}/resources/image/main_banner_화산귀환.jpg"></a></li>
			<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=물위의우리"><img alt="배너2" src="${contextPath}/resources/image/main_banner_물위의우리.jpg"></a></li>
			<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=언덕위의제임스"><img alt="배너3" src="${contextPath}/resources/image/main_banner_언덕위의제임스.jpg"></a></li>
			<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=바른연애길잡이"><img alt="배너4" src="${contextPath}/resources/image/main_banner_바른연애길잡이.jpg"></a></li>
		</ul>
			
		<a class="btn_left" data-direction="-1">
			<img alt="왼쪽 슬라이드" src="${contextPath}/resources/image/arrow_back.svg">
		</a>
		<a class="btn_right" data-direction="1">
			<img alt="오른쪽 슬라이드" src="${contextPath}/resources/image/arrow_forward.svg">
		</a>
		<div class="button"></div>
	</div>
	
	<div id="best_goods" class="goods_box">
		<h2>인기 굿즈</h2>
		<div class="best_goods_list goods_box_list">
			<c:forEach var="item" items="${goodsMap.bestgoods }">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"> 
					<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> 
								<p>${item.goods_title}</p>
								<p><span>&#8361;
								<fmt:formatNumber value="${item.goods_price}" pattern="#,###" />
								</span></p>
							</a>
			</c:forEach>
		</div>
		
	</div>
	
	<div id="new_goods" class="goods_box">
		<h2>신규 굿즈</h2>
		<div class="new_goods_list goods_box_list">
			<c:forEach var="item" items="${goodsMap.newgoods }" begin="0" end="3">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"> 
					<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> 
								<p>${item.goods_title}</p>
								<p><span>&#8361;
								<fmt:formatNumber value="${item.goods_price}" pattern="#,###" />
								</span></p>
							</a>
			</c:forEach>
		</div>
	</div>
	

</body>
</html>