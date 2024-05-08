<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<script>
	function fn_category() {
		if($('#suggestList').hasClass('d-none')){
			$('#suggestList').removeClass('d-none');
			
		}else{
			$('#suggestList').addClass('d-none');
		}
	}
	
	
	var loopSearch = true;
	function keywordSearch() {
		var searchWordValue = document.getElementById('searchWord').value;
		var value = document.frmSearch.searchWord.value;
		
		if (loopSearch == false) return;
		if(searchWordValue.length > 0){
			$.ajax({
				type : "get",
				async : true, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/goods/keywordSearch.do",
				data : {
					keyword : value
				},
				success : function(data, textStatus) {
					var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다." + data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
				}
			}); //end ajax	
		}else{
			hide('suggest');
		}
	}

	function displayResult(jsonInfo) {
		var count = jsonInfo.keyword.length;
		var listView = document.getElementById("innerDivForSuggestList");
		if (count > 0) {
			var html = '';
			for ( var i in jsonInfo.keyword) {
				html += "<li><a class='dropdown-item small' href=\"javascript:select('"
						+ jsonInfo.keyword[i]
						+ "')\">"
						+ jsonInfo.keyword[i]
						+ "</a></li>";
			}
			listView.innerHTML = html;
			show('suggest');
		} else {
			hide('suggest');
		}
	}

	function select(selectedKeyword) {
		document.frmSearch.searchWord.value = selectedKeyword;
		loopSearch = false;
		hide('suggest');
	}

	function show(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.classList.remove('d-none');
		}
	}

	function hide(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.classList.add('d-none');
		}
	}
	
</script>

	<div id="head_link">
		<ul>
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo }">
					<li><a href="${contextPath }/member/logout.do">로그아웃</a></li>
					<li><a href="${contextPath }/mypage/listMyOrderHistory.do">마이페이지</a></li>
					<li><a href="${contextPath }/cart/myCartList.do">장바구니</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${contextPath }/member/loginForm.do">로그인</a></li>
					<li><a href="${contextPath }/member/memberForm.do">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="#">고객센터</a></li>
			<c:if test="${isLogOn==true and memberInfo.member_id=='admin' }">
					<li><a href="${contextPath }/admin/goods/adminGoodsMain.do">관리자</a></li>
			</c:if>
		</ul>
	</div>
		<div id="head">
			<ul id="category" onclick="fn_category()">
				<li><i class="fa-sharp fa-solid fa-bars fa-2xl"
					style="color: #00dc64;"></i>
					<ul id="suggestList" class="d-none">
						<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=화산귀환"><img src="${contextPath }/resources/image/sub_banner_화산귀환.jpg">화산귀환</a></li>
						<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=물위의우리"><img src="${contextPath }/resources/image/sub_banner_물위의우리.jpg">물위의우리</a></li>
						<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=언덕위의제임스"><img src="${contextPath }/resources/image/sub_banner_언덕위의제임스.jpg">언덕 위의 제임스</a></li>
						<li><a href="${contextPath }/goods/menuGoods.do?menuGoods=바른연애길잡이"><img src="${contextPath }/resources/image/sub_banner_바른연애길잡이.jpg">바른연애 길잡이</a></li>
					</ul>	
				</li>
				
			</ul>
			<a href="${contextPath }/main/main.do"> <img width="202"
				height="32" alt="로고 이미지"
				src="${contextPath }/resources/image/webtoonfriends_logo.png">
			</a>
			<div id="search">
				<form name="frmSearch" action="${contextPath }/goods/searchGoods.do">
					<input name="searchWord" class="main_input" type="text" id="searchWord"
					onkeyup="keywordSearch()" autocomplete="off"> 
					<button type="submit">
						<i
							class="fa-sharp fa-solid fa-magnifying-glass fa-xl"
							style="color: #00dc64;"></i>
					</button>
				</form>
				<!-- 추천키워드  -->
				<div id="suggest" class="d-none">
					<ul id="suggest_list" class="keywordSearchList">
						<div id="innerDivForSuggestList"></div>
					</ul>
				</div>
			</div>
			<a href="
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo }">
					${contextPath }/mypage/myDetailInfo.do"> 
				</c:when>
				<c:otherwise>
					${contextPath }/member/loginForm.do"> 
				</c:otherwise>
			</c:choose>
			<i class="fa-sharp fa-solid fa-user fa-xl"
				style="color: #00dc64;"></i>
			</a> 
			
			<a href="
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo }">
					${contextPath }/cart/myCartList.do"> 
				</c:when>
				<c:otherwise>
					${contextPath }/member/loginForm.do"> 
				</c:otherwise>
			</c:choose>
			<i class="fa-sharp fa-solid fa-cart-shopping fa-xl"
				style="color: #00dc64;"></i>
			</a>
		</div>

