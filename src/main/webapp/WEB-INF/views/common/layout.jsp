<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<script defer src="${contextPath }/resources/js/main.js" type="text/javascript"></script>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" >
<script src="https://kit.fontawesome.com/c80b274b94.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/jquery-1.6.2.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="outer_wrap">
		<header>
				 <tiles:insertAttribute name="header" />
		</header>
			<tiles:insertAttribute name="quickMenu" />
		<div id="wrap">
		
			<article>
				<tiles:insertAttribute name="mypage" />
				<tiles:insertAttribute name="body" />
			</article>
			
			
		</div>
		
			<footer>
			<tiles:insertAttribute name="footer" />
			</footer>
		
	</div>
</body>
</html>