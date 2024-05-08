<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 회원 탈퇴시 메인으로 안가지는 사항 해결 -->
<c:if test="${isLogOn==false and empty memberInfo }">
	<script>
			location.href = "${contextPath}/main/main.do";
	</script>
</c:if>
	<div id="memInfo" class="detail_box">
		<h2>내정보</h2>
		<form name="mod_member" method="post">
			<table>
				<!-- 아이디 -->
				<tr>
					<td>아이디</td>
					<td><input type="text" name="member_id" value="${memberInfo.member_id }" disabled></td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td>이름</td>
					<td><input type="text" name="member_name" value="${memberInfo.member_name }"></td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="member_pwd" value="${memberInfo.member_pwd }"></td>
				</tr>
				<!-- 휴대폰번호 -->
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="hp1" value="${memberInfo.hp1 }"></td>
				</tr>
				
				<tr>
					<td>배송지</td>
					<td>
						<div>
							<!-- 우편번호  -->
							<input type="text" placeholder="우편번호" id="zipcode" name="zipcode"
							value="${memberInfo.zipcode }">
							<!-- 다음 우편번호 검색 -->
							<a href="javascript:execDaumPostcode()">우편번호검색</a>
						</div>
						<!-- 주소 -->
						<input type="text" id="address" placeholder="주소" name="address" value="${memberInfo.address }" size="50">
						<input type="text" id="subAddress" name="subAddress" value="${memberInfo.subAddress }" size="50">
					</td>
				</tr>
				
			</table>
			
			<button onclick="fn_modify_member_info()">수정하기</button>
			<button onclick="location.reload()">취소하기</button>
			<button onclick="fn_delete_member('${memberInfo.member_id}', 'Y')">탈퇴하기</button>
			
		</form>
	</div>
	
	<script>
	//다음 주소 찾기
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = data.address;
			}
		}).open();
	}
// 	회원정보 수정
	function fn_modify_member_info() {
		let mod_member = document.mod_member.value;
		let member_name = document.mod_member.member_name.value;
		let member_pwd = document.mod_member.member_pwd.value;
		let hp1 = document.mod_member.hp1.value;
		let zipcode = document.mod_member.zipcode.value;
		let address= document.mod_member.address.value;
		let subAddress= document.mod_member.subAddress.value;
		$.ajax({
			type:"post",
			async:false,
			url:"${contextPath}/mypage/modifyMyInfo.do",
			data:{
				member_name:member_name,
				member_pwd:member_pwd,
				hp1:hp1,
				zipcode:zipcode,
				address:address,
				subAddress:subAddress
			},
			success:function(data,textStatus){
				if(data.trim()=='mod_success'){
					// 성공시
					alert("회원 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");
				}
			},
			error:function(data,textStatus){
					alert("에러가 발생했습니다." + data);
			},
			complete:function(data,textStatus){
			}
		});
	}

	//회원탈퇴
	function fn_delete_member(member_id, del_yn) {
		var mod_member = document.mod_member.value;
		var member_id = document.mod_member.member_id.value;

		var answer = confirm("탈퇴하시겠습니까?");
		//confirm answer = true일때 submit
		if (answer == true) {
			$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/mypage/deleteMember.do",
				data : {
					member_id : member_id, 
					del_yn : del_yn
				},
				success : function(data, textStatus) {
					if (data.trim() == 'delete_success') {
						//성공시 안내와 함께 logout.do
						alert("탈퇴되었습니다.");
						location.href = "${contextPath}/member/logout.do";
					} else if (data.trim() == 'failed') {
						alert("다시 시도해 주세요.");
					}
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다." + data);
				},
				complete : function(data, textStatus) {
				}
			});
		}
	}
	

	</script>

