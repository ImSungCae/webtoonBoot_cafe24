<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myGoodsList" value="${cartMap.myGoodsList}" />

<c:set var="totalGoodsNum" value="0" />
<!--주문 개수 -->

<!-- 총 배송비 -->
<c:if test="${empty myCartList }">
<c:set var="totalDeliveryPrice" value="0" />
</c:if>
<c:if test="${not empty myCartList }">
<c:set var="totalDeliveryPrice" value="3000" />
</c:if>

<script>

	function selectValue(selectBox,value,goods_id,index) {
		var input = selectBox.nextElementSibling
		input.setAttribute("value",value);
		modify_cart_qty(index,goods_id,value);
	}
	
	
	//장바구니 수정하기
	function modify_cart_qty(index, goods_id, value){
		//수정할 cart_goods_qty의 값을 저장.
		var cart_goods_qty = Number(value);
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/cart/modifyCartQty.do",
			data : {
				goods_id:goods_id,
				cart_goods_qty:cart_goods_qty
			},
			success : function(data, textStatus) {
				if(data.trim()=='modify_success'){alert("수량을 변경했습니다!!");
				location.reload();
				}else{alert("다시 시도해 주세요!!");	}			
			},
			error : function(data, textStatus) {alert("에러가 발생했습니다."+data);},
			complete : function(data, textStatus) {			}
		});
	}
	//장바구니 삭제하기
	function delete_cart_goods(cart_id){
		// 삭제할 cart_id값을 저장
		var cart_id=Number(cart_id);
		//formObj을 만들어 submit
		var formObj=document.createElement("form");
		var i_cart = document.createElement("input");
		i_cart.name="cart_id";
		i_cart.value=cart_id;
		formObj.appendChild(i_cart);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/cart/removeCartGoods.do";
	    formObj.submit();
	}

	
	//선택(전체)상품 주문하기
function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
	for (var i = 0; i < length; i++) {
		cart_goods_qty[i].value=cart_goods_qty[i].previousElementSibling.value;
	}
}



	//개별 주문하기
	function fn_order_each_goods(goods_id,goods_title,goods_price,fileName){
		var total_price,final_total_price,_goods_qty;
		var cart_goods_qty=document.getElementById("cart_goods_qty");
		
		_order_goods_qty=cart_goods_qty.value;
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
	    i_order_goods_qty.value=_order_goods_qty;
	    i_goods_title.value=goods_title;
	    i_goods_price.value=goods_price;
	    i_fileName.value=fileName;
	    
	    //받아온 정보를 formObj에 저장
	    formObj.appendChild(i_goods_id);
	    formObj.appendChild(i_goods_title);
	    formObj.appendChild(i_goods_price);
	    formObj.appendChild(i_fileName);
	    formObj.appendChild(i_order_goods_qty);
	    document.body.appendChild(formObj);
	    
	    //submit
	    formObj.method="post";
	    formObj.action="${contextPath}/order/orderEachGoods.do";
	    formObj.submit();
	}

	
	
	
</script>









<div id="cart" class="detail_box">
	<h2>장바구니</h2>
	<div>
		<c:choose>
			<c:when test="${empty myCartList }">
				<p class="emptyCart">장바구니에 상품이 없습니다.
					<i class="fa-sharp fa-solid fa-cart-shopping fa-xl"></i>
				</p>
				
			</c:when>
			<c:otherwise>
				<form name="frm_order_all_cart">
					<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
						<!-- 인덱스 초기화 -->
						<c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
						<c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
						<!-- 인덱스 초기화 -->
						<!-- 상품정보 및 선택영역  -->
						<div class="goods_info_box">
							<!-- 체크박스 영역  -->
							<div class="check">
								<input type="checkbox" name="checked_goods"
									class="cartGood"
									price="${item.goods_price*cart_goods_qty }"
									value="${item.goods_id }">
							</div>
							<!-- 체크박스 영역  -->
							
							<!-- 상품상세페이지로 이동  -->
							<div class="detail_info_box">
								<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
									<div class="detail_info">
										<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
											style="width: 64px; height: 64px">
										<div>
											<p>${item.goods_title }</p>
											<p>${item.goods_writer_intro }</p>
											<p>
												<span>${cart_goods_qty }</span>개
												<span> · </span>
												<span>
													<fmt:formatNumber value="${item.goods_price*cart_goods_qty}" pattern="#,###" />
												</span>
												<span class="goods_price d-none">${item.goods_price*cart_goods_qty}</span>
												원
											</p>
										</div>
									</div>
								</a>
							</div>
							<!-- 상품상세페이지로 이동  -->
							
							<!-- 상품정보 수정영역  -->
							<div class="goods_modi">
								<select id="sel_qty" selectedValue="1"
									onchange="selectValue(this, this.value,${item.goods_id },${cnt.count-1 })">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
								</select> <input type="hidden" id="cart_goods_qty"
															name="cart_goods_qty" value="${cart_goods_qty}">
	
								<!-- 주문하기 -->
								<a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_price}','${item.goods_fileName}');"
									style="width: 150px;">주문하기</a>
	
								<!-- 삭제하기 -->
								<a href="javascript:delete_cart_goods('${cart_id}');"
									style="width: 150px;">삭제</a>
							</div>
							<!-- 상품정보 수정영역  -->
							
						</div>
						<!-- 상품정보 및 선택영역  -->
						
					</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 전체선택  -->
	<label class="allSelect">
		<input name="cheked_goods"  class="all-deal-select"
			title="모든 상품을 결제상품으로 설정" type="checkbox" onclick="selectAll(this)">
		전체선택
	</label>
	<!-- 전체선택  -->
	
	<!-- 선택상품 가격표시 영역  -->
	<div class="tot_price">
		<!-- 변수세팅 및 형 변환 -->
		<!-- 상품가격 * 갯수 및 형변환 -->
		<c:set var="totalGoodsPrice"
			value="${totalGoodsPrice+item.goods_price*cart_goods_qty }" />
					
		<c:set var="total_price"
			value="${totalGoodsPrice + totalDeliveryPrice}" />
		<!-- 변수세팅 및 형 변환 -->
		<!-- 가격정보 hidden input -->
		<input id="h_totalGoodsPrice" type="hidden" value="${totalGoodsPrice}" /> 
		<input id="h_totalDeliveryPrice" type="hidden" value="${totalDeliveryPrice}" /> 
		<input id="h_totalSalesPrice" type="hidden" value="${totalSalesPrice}" />
		<input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice}" />
		<!-- 가격정보 hidden input -->
		
		<!-- 총 상품가격 -->
		<p>총 상품가격 
			<span id="goodsPrice"><fmt:formatNumber value="${totalGoodsPrice }" pattern="#,###"/></span>원
		</p>
		+
		<!-- 총 배송비 -->
		<p>총 배송비
			<span id="deliveryPrice"><fmt:formatNumber value="${totalDeliveryPrice }" pattern="#,###"/></span>원
		</p>
		=
		<!-- 총 주문금액 -->
		<p>총 주문금액
			<span id="totalPrice"><fmt:formatNumber value="${total_price }" pattern="#,###"/></span>원
		</p>
		
	</div>
	<!-- 선택상품 가격표시 영역  -->
	
	<!-- 선택상품 주문하기  -->
	<button onclick="fn_order_all_cart_goods()">주문하기</button>
	<!-- 선택상품 주문하기  -->
</div>

<script>


/* input의 value를 select에 select해 사용자에게 보여주는 역할 */
var cart_goods_qty_inputs = document.getElementsByName("cart_goods_qty");
cart_goods_qty_inputs.forEach((cart_goods_qty_inputs) => {
	let inputValue = cart_goods_qty_inputs.value;
	let selectBox = cart_goods_qty_inputs.previousElementSibling;
	let selectBox_len = selectBox.options.length;
	for (let i=0; i<selectBox_len; i++){  
		if(selectBox.options[i].value == inputValue){
			selectBox.options[i].selected = true;
		}
	}
});


//전체 선택을 눌렀을때 금액 계산
var total = 0;
var total_all = 0;
const checkboxes = document.getElementsByName('checked_goods');
var totalPrice=document.getElementById("totalPrice");
var deliveryPrice=document.getElementById("deliveryPrice");
var goodsPrice=document.getElementById("goodsPrice");
function selectAll(selectAll){
	const goods_price = document.querySelectorAll(".goods_price");
	//checked_goods name을 가진 checkbox가 체크되엇는지 확인
	checkboxes.forEach((checkbox) => {checkbox.checked = selectAll.checked;}); 
	//체크되었을경우 금액추가
	if (selectAll.checked == true) {
		total_all=0;
		total=0;
		for (const i of goods_price) {total_all += i.innerHTML*1;total=total_all+3000;};
		goodsPrice.innerHTML=total_all.toLocaleString();
		totalPrice.innerHTML=total.toLocaleString();
	}
	//체크되지않았을 경우 금액빼기
	else if(selectAll.checked == false){ 
		for (const i of goods_price) {total_all -= i.innerHTML*1;total=total_all+3000;};
		goodsPrice.innerHTML=total_all.toLocaleString();
		totalPrice.innerHTML=total.toLocaleString();
	}
}


//체크박스를 누를때 금액 계산
let all_select = document.querySelector(".all-deal-select");
checkboxes.forEach((i) => i.addEventListener("click", function () {
	//체크되었을경우 금액추가
	if (this.checked == true) {total_all += i.getAttribute("price")*1;total=total_all+3000;}
	//체크되지않았을 경우 금액빼기
	else if(this.checked == false){total_all -= i.getAttribute("price")*1;all_select.checked = false;total=total_all+3000;}
	//계산된 금액 반영 innerHTML
	goodsPrice.innerHTML=total_all.toLocaleString(); 
	totalPrice.innerHTML=total.toLocaleString();
}));
</script>
