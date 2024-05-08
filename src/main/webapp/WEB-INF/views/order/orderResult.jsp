<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="tot_price" value="0"/>
<c:forEach var="item" items="${myOrderList }">
	<c:set var="tot_price" value="${tot_price+item.goods_price*item.order_goods_qty}" />
</c:forEach>
<div id="order_result">
	<div>
		<h2>
			<span>주문이 정상적으로 완료</span>되었습니다.
		</h2>

		<table class="order_goods_info">
			<h3>상품 정보</h3>
			<tr>
				<td>주문번호</td>
				<td>주문상품</td>
				<td>수량</td>
				<td>상품금액</td>
				<td>배송비</td>
				<td>주문금액합계</td>
			</tr>
			<tr>
				<td rowspan="${myOrderList.size() }">${myOrderList[0].order_id }</td>
				<td><a
						href="${contextPath}/goods/goodsDetail.do?goods_id=${myOrderList[0].goods_id }">
							<img
							src="${contextPath}/thumbnails.do?goods_id=${myOrderList[0].goods_id}&fileName=${myOrderList[0].goods_fileName}"
							width="75">
							<p>${myOrderList[0].goods_title }</p>
					</a></td>
					<td><h5>${myOrderList[0].order_goods_qty }</h5></td>
					<td><fmt:formatNumber value="${myOrderList[0].order_goods_qty*myOrderList[0].goods_price }"/> 원</td>
					<td rowspan="${myOrderList.size() }">3,000 원</td>
					<td rowspan="${myOrderList.size() }"><fmt:formatNumber value="${tot_price+3000 }" pattern="#,###"/> 원</td>
			</tr>
			<c:if test="${myOrderList.size()>1 }">
				<c:forEach var="item" items="${myOrderList }" begin="1">
					<tr>
						<td><a
								href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
									<img
									src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
									width="75">
									<p>${item.goods_title }</p>
							</a></td>
							<td><h5>${item.order_goods_qty }</h5></td>
							<td><fmt:formatNumber value="${item.order_goods_qty*item.goods_price }"/> 원</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<table class="orderPage_info order_table">
			<h3>주문자</h3>
			<tr>
				<td>이름</td>
				<td>${orderer.member_name }</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>${orderer.hp1 }</td>
			</tr>
		</table>
		
		<table class="receiver_info order_table">
			<h3>배송지 정보</h3>
			<tr>
				<td>수령인</td>
				<td>${myOrderInfo.receiver_name }</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>${myOrderInfo.receiver_hp1 }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${myOrderInfo.delivery_address }</td>
			</tr>
			
		</table>
		
		<table class="pay_info order_table">
			<h3>결제 정보</h3>
			<tr>
				<td>결제방법</td>
				<td>${myOrderInfo.pay_method }</td>
			</tr>
			<tr>
				<td>결제카드</td>
				<td>${myOrderInfo.card_com_name }</td>
			</tr>
			<tr>
				<td>할부기간</td>
				<td>${myOrderInfo.card_pay_month }</td>
			</tr>
			
		</table>
		<button onclick="location.href='${contextPath }/mypage/listMyOrderHistory.do'">주문목록 보기</button>
		<button onclick="location.href='${contextPath}/main/main.do'">쇼핑 계속하기</button>
		
		
	</div>

	

</div>
