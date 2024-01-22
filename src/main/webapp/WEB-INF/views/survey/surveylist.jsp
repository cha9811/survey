<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 스프링 시큐리티 사용 목적 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyListStyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>설문조사</title>
</head>
<body>

	<h1>요목조목에 오신걸 환영합니다.</h1>
	
	<p>
	<h2>
		안녕하세요
		<c:out value="${pageContext.request.userPrincipal.name}" />
		님!
	</h2>
	<h5>원하는 설문조사를 클릭해주세요</h5>
	</p>
	<table class="board-table">
		<thead>
			<tr>
				<th>제목</th>
				<th>주요내용</th>
				<th>소요시간</th>
				<th>카테고리</th>
				<th>리워드</th>
			</tr>
		</thead>
		<c:forEach items="${mainsurvey}" var="vo">
			<thead>
					<tbody>
						 <tr class="clickable-row" data-href="<c:url value='surveydetail?id=${vo.main_id}'/>">
							<td>${vo.main_title}</td>
							<td>${vo.main_content}</td>
							<td>${vo.use_time}분</td>
							<td>${vo.main_category}</td>
							<td>${vo.main_reward}</td>
						</tr>
					</tbody>

			</thead>
		</c:forEach>
	</table>
	<sec:authorize access="hasAnyRole('ROLE_MASTER', 'ROLE_ADMIN')">
		<a href="./survey/surveyMakePage.jsp"><button>작성하기</button></a>
	</sec:authorize>

</body>
<script>
$(document).ready(function() {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});
</script>
</html>