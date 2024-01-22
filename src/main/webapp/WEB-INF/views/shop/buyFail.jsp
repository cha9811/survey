<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="//header.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 글쓰기 목적 -->

<link rel="stylesheet"
	<%-- 	href="${pageContext.request.contextPath}/resources/css/shop/shopStyle.css"> --%>
	href="<c:url value="/resources/css/shop/shopStyle.css"/>">

</head>
<body>

	<h2>굿즈샵</h2>
	금액이 부족합니다
	<hr>
	<div class="container">
		<br>
		        <button onclick="goBack()">이전 페이지로 돌아가기</button>
	</div>
		
		<script>
        // 이전 페이지로 돌아가는 함수
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>