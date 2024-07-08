<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goods}" />
<c:set var="imageFileList" value="${goodsMap.imageFileList}" />

<script>
function readURL(input,preview) {
	//  alert(preview);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+preview).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
  }  
</script>


<div class="detail_box goods_form">
	<h2>상품수정</h2>
	<form name="frm_modify_goods" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="goods_sort">
						<c:choose>
							<c:when test="${goods.goods_sort=='화산귀환' }">
								<option value="화산귀환" selected>화산귀환</option>
								<option value="물위의우리">물위의우리</option>
								<option value="언덕위의제임스">언덕위의제임스</option>
								<option value="바른연애길잡이">바른연애길잡이</option>
							</c:when>
							<c:when test="${goods.goods_sort=='물위의우리' }">
								<option value="화산귀환">화산귀환</option>
								<option value="물위의우리" selected>물위의우리</option>
								<option value="언덕위의제임스">언덕위의제임스</option>
								<option value="바른연애길잡이">바른연애길잡이</option>
							</c:when>
							<c:when test="${goods.goods_sort=='언덕위의제임스' }">
								<option value="화산귀환">화산귀환</option>
								<option value="물위의우리">물위의우리</option>
								<option value="언덕위의제임스" selected>언덕위의제임스</option>
								<option value="바른연애길잡이">바른연애길잡이</option>
							</c:when>
							<c:when test="${goods.goods_sort=='바른연애길잡이' }">
								<option value="화산귀환">화산귀환</option>
								<option value="물위의우리">물위의우리</option>
								<option value="언덕위의제임스">언덕위의제임스</option>
								<option value="바른연애길잡이" selected>바른연애길잡이</option>
							</c:when>
						</c:choose>
				</select></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td>
					<input type="text" placeholder="상품이름" value="${goods.goods_title }" name="goods_title">
				</td>
			</tr>
			<tr>
				<td>상품소개</td>
				<td>
					<input type="text" placeholder="상품소개" value="${goods.goods_writer_intro }" name="goods_writer_intro">
				</td>
			</tr>
			<tr>
				<td>상품판매가격</td>
				<td>
					<input type="text" placeholder="상품판매가격" value="${goods.goods_price }" name="goods_price">
				</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>
					<input type="text" placeholder="배송비" value="${goods.goods_delivery_price }" name="goods_delivery_price">
				</td>
			</tr>
			<tr>
				<td>상품배송일</td>
				<td>
					<input type="date" value="${goods.goods_delivery_date }" name="goods_delivery_date">
				</td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td>
					<select name="goods_status">
						<option value="bestgoods">인기굿즈</option>
						<option value="newgoods">신규굿즈</option>
						<option value="on_sale">판매중</option>
						<option value="buy_out">품절</option>
					</select>
					<input type="hidden" name="h_goods_status" value="${goods.goods_status }">
				</td>
			</tr>
			<tr>
				<td rowspan="2">상품 이미지</td>
			<c:forEach var="item" items="${imageFileList }" varStatus="itemNum">
				<c:choose>
					<c:when test="${item.fileType=='main_image' }">
						<td>메인 이미지 <input type="file" id="main_image" name="main_image" onchange="readURL(this,'preview${itemNum.count }');">
							<input type="hidden" name="image_id" value="${item.image_id }">
							<img id="preview${itemNum.count }" width="150" src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
						</td>
						
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td>상세 이미지 <input type="file" id="detail_image" name="detail_image" onchange="readURL(this,'preview${itemNum.count }');">
							<input type="hidden" name="image_id" value="${item.image_id }">
							<img id="preview${itemNum.count }" width="150" style="background-size: cover;" src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
						</td>
					</tr>
					</c:otherwise>
						
				</c:choose>
			</c:forEach>
		</table>
		<button type="submit" formaction="${contextPath }/admin/goods/modifyGoodsInfo.do?goods_id=${goods.goods_id}">수정하기</button>
	</form>
</div>
