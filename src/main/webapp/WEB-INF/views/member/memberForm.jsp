<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function fn_overlapped() {
		var _id = $("#member_id").val();
		if (_id == '') {
			$('.invalid').addClass('d-none');
			$('#member_id').addClass('unuse');
			return;
		}

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do",
			dataType : "text",
			data : {
				id : _id
			},
			success : function(data, textStatus) {
				if (data == 'false') {
					$('#member_id').removeClass('unuse');
					$('.invalid').removeClass('d-none');
					$('.uninvalid').addClass('d-none');
				} else {
					$('#member_id').addClass('unuse');
					$('.uninvalid').removeClass('d-none');
					$('.invalid').addClass('d-none');
				}
			},
			error : function(data, textStatus) {
			},
			complete : function(data, textStatus) {
			}

		});
	}
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="${contextPath }/member/addMember.do" method="post"
		id="memberForm" class="member">


		<label id="member_id_label">아이디 <span class="d-none invalid">사용가능한
				아이디입니다.</span><span class="d-none uninvalid">사용중인 아이디입니다.</span><br> <input
			type="text" name="member_id" id="member_id" onblur="fn_overlapped()"
			placeholder="아이디" class="inputs" required>
		</label> <label>비밀번호<br> <input type="password" name="member_pwd"
			placeholder="비밀번호" class="inputs" required><br>
		</label> <label>이름<br> <input type="text" name="member_name"
			placeholder="이름" class="inputs" required><br>
		</label> <label>휴대폰<br> <input type="text" name="hp1"
			placeholder="휴대폰 번호" class="inputs" required><br>
		</label>


		<div class="allRequiredInputCheck d-none">모든 정보를 입력해주세요.</div>

		<button onclick="fn_submit()">회원가입</button>
		<br>
		<button type="button"
			onclick="location.href='${contextPath}/member/loginForm.do'">로그인</button>
	</form>

	<script>
		const form = document.getElementById("memberForm");
		const inputs = form.querySelectorAll(".inputs");
		var allRequiredInputCheck = document
				.querySelector('.allRequiredInputCheck');
		
		function fn_submit() {
			let isValid = true;
			
			inputs.forEach(function (input) {
				if(!input.value){
					isValid = false;
					input.classList.add("unuse");
				}else{
					input.classList.remove("unuse");
					allRequiredInputCheck.classList.add('d-none');
				}
			});
			
			if (isValid) { 
				form.submit();
			} else {
				allRequiredInputCheck.classList.remove('d-none');
			}
		}

	</script>
</body>
</html>