<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css"> --%>
<%-- ${pageContext.request.contextPath} 현재 위치 참조 --%>
</head>
<body>

	<h1 style="margin-left: 20px;">요목조목</h1>
	<header>
		<nav>
			<ul class="header-bar">
				<li><a href="/survey/surveylist">설문조사</a></li>
				<li><a href="/survey/notice" class="button-link">공지사항</a></li>
				<c:choose>

<%--  		세션방식에서 스프링 시큐리티 방식으로 변경 			<c:when test="${sessionScope.user != null}"> --%>

				    <c:when test="${pageContext.request.userPrincipal != null}">
						<!-- 사용자가 로그인한 경우 -->
						<li><a href="/survey/logOut" class="button-link">로그아웃</a></li>
						<li><a href="/survey/mypage">마이페이지</a></li>
						<li><a href="/survey/surveyresultpage" class="button-link">결과보기</a></li>
					</c:when>
					<c:otherwise>
						<!-- 사용자가 로그아웃한 경우 -->
						<li><a href="/survey/loginPage" class="button-link">로그인</a></li>
						<li><a href="/survey/signUpPage" class="button-link">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="/survey/shop">굿즈샵</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<br>
	<div class="center-container">
		<img src="${pageContext.request.contextPath}/resources/img/wave.jpg" width="800" height="200" />
	</div>
</body>
</html>