<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty message }'>
	<script>
	 window.onload=function(){alert("아이디나 비밀번호가 틀립니다. 다시 입력해주세요.");}
	</script>
</c:if>


	<h3>로그인</h3>
	<form action="${contextPath }/member/login.do" method="post"
		id="loginForm" class="member">


		<label id="member_id_label">아이디 <span class="d-none invalid">사용가능한
				아이디입니다.</span><span class="d-none uninvalid">사용중인 아이디입니다.</span><br> <input
			type="text" name="member_id" id="member_id" onblur="fn_overlapped()"
			placeholder="아이디" class="inputs" required>
		</label> <label>비밀번호<br> <input type="password" name="member_pwd"
			placeholder="비밀번호" class="inputs" required><br>
		</label>
		
		<div class="allRequiredInputCheck d-none">모든 정보를 입력해주세요.</div>

		<button onclick="fn_submit()">로그인</button>
		<br>
		<button type="button"
			onclick="location.href='${contextPath}/member/memberForm.do'">회원가입</button>
	</form>
	<script>
		const form = document.getElementById("loginForm");
		const inputs = form.querySelectorAll(".inputs");
		var allRequiredInputCheck = document
				.querySelector('.allRequiredInputCheck');
		var check = document
		.querySelector('.check');

		function fn_submit() {
			let isValid = true;

			inputs.forEach(function(input) {
				if (!input.value) {
					isValid = false;
					input.classList.add("unuse");
				} else {
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
