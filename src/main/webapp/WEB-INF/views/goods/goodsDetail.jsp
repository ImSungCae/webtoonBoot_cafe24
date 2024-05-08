<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="imageList" value="${goodsMap.imageList }" />
<%
	request.setCharacterEncoding("utf-8");
%>

<div id="goodsDetail">
	<!-- 메인 이미지  -->
 	<div>
 		<img class="main_img" src="${contextPath }/download.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
 		<!-- 카테고리  -->
	 	<div class="banner_box">
	 		<img class="sub_banner_img" src="${contextPath }/resources/image/sub_banner_${goods.goods_sort }.jpg">
	 		<div>
		 		<span>Designed By</span>
		 		<h4>${goods.goods_sort }</h4>
	 		</div>
	 	</div>
	 	<!-- 상세 이미지  -->
	 	<div>
	 		<c:forEach var="image" items="${imageList }">
				<div>
					<img class="sub_img" src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</div>
			</c:forEach>
	 	</div>
 	</div>
 	
	<!-- 상품정보  --> 	
 	<div class="goods_info">
 		<!-- 상품명  -->
 		<p>${goods.goods_title }</p>
 		<!-- 상품 소개 -->
 		<p>${goods.goods_writer_intro }</p>
 		<!-- 가격  -->
 		<p>
	 		<fmt:formatNumber var="num_price" value="${goods.goods_price }" pattern="#,###" />
	 		${num_price }<span>원</span>
	 		
 		</p>
 		<!-- 수량  -->
 		<div class="quantity">
 			<b>수량</b>
 			<div id="count_box">
 				<button id="minus" data-value="-1">-</button>
 				<input name="order_goods_qty" id="count" value="1" size="1">
 				<button id="plus" data-value="1">+</button>
 			</div>
 			
 		</div>
		<div>
 			<div>
	 			<span class="value">1</span>
	 			개 상품 금액
 			</div>
 			<div>
 				<span class="price"></span>원
 				<input type="hidden" value="${goods.goods_price }" id="price">
 			</div>
		</div> 	
		<div>
			<!-- 장바구니 담기, goods_id값과 함께 add_cart 실행 -->
			<a href="javascript:add_cart('${goods.goods_id}')">장바구니 담기</a>
			<!-- 주문하기, 상품정보와 함께 fn_order_each_goods실행  -->
			<a href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_price}','${goods.goods_fileName}');">바로 구매하기</a>
		</div>	
 	</div>
	<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/> 	
</div>


<script>
/* 수량 +,- 버튼시 수량 input value 값 변경  
	1미만으로 버튼 누를시 ++ 을 통해 1 유지
	7초과로 버튼 누를시 -- 을 통해 7 유지	
*/
let count = $('#count').val();
let price = $('#price').val();
$('.price').text((price*count).toLocaleString());
const count_box = document.querySelector('#count_box'),
		minus = document.querySelector('#minus'),
		plus = document.querySelector('#plus');
count_box.addEventListener('click', function (e) {
	const btn = e.target.closest('button');
	if(count_box.contains(btn)){
		const val = +btn.dataset.value;
		count= +count + val;
		if(count<=0){
			count++;
		}else if(count>7){
			count--;
		}
		price.replace(',','');
		$('#count').attr("value",count);
		$('.value').text(count);
		$('.price').text((price*count).toLocaleString()); 
	}
});

//장바구니 추가, goods_id정보를 넘겨줌.
function add_cart(goods_id) {
	let cart_goods_qty = $('#count').val();
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/cart/addGoodsInCart.do",
		data : {goods_id:goods_id,
			cart_goods_qty:cart_goods_qty},
		success : function(data, textStatus) {
			if(data.trim()=='add_success'){alert("장바구니에 추가되엇습니다.");
			location.reload();
			}else if(data.trim()=='already_existed'){alert("이미 카트에 등록된 상품입니다.");	}
		},
		error : function(data, textStatus) {alert("로그인 후 추가하실 수 있습니다!");},
		complete : function(data, textStatus) {}
	});
}


//바로 주문하기 
function fn_order_each_goods(goods_id,goods_title,goods_price,fileName){
	
		var _isLogOn=document.getElementById("isLogOn");
		var isLogOn=_isLogOn.value;
		
		 if(isLogOn=="false" || isLogOn=='' ){
			alert("로그인 후 주문이 가능합니다!!!");
		} 
	
		
	 	var total_price,final_total_price;
		var order_goods_qty=document.getElementById("count");
		var formObj=document.createElement("form");
		var i_goods_id = document.createElement("input"); 
	    var i_goods_title = document.createElement("input");
	    var i_goods_price=document.createElement("input");
	    var i_fileName=document.createElement("input");
	    var i_order_goods_qty=document.createElement("input");
	    
		 
		    i_goods_id.name="goods_id";
		    i_goods_title.name="goods_title";
		    i_goods_price.name="goods_price";
		    i_fileName.name="goods_fileName";
		    i_order_goods_qty.name="order_goods_qty";
		    i_goods_id.value=goods_id;
		    i_order_goods_qty.value=$('#count').val();
		    i_goods_title.value=goods_title;
		    i_goods_price.value=goods_price;
		    i_fileName.value=fileName;
		    
		    //formObj에 해당 상품 정보를 할당해 orderEachGoods로 action
		    formObj.appendChild(i_goods_id);
		    formObj.appendChild(i_goods_title);
		    formObj.appendChild(i_goods_price);
		    formObj.appendChild(i_fileName);
		    formObj.appendChild(i_order_goods_qty);
		    document.body.appendChild(formObj); 
		    
		    formObj.method="post";
		    formObj.action="${contextPath}/order/orderEachGoods.do";
		    formObj.submit();
		
	}
</script>