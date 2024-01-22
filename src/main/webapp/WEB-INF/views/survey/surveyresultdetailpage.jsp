<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 결과 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyResultDetailStyle.css">

</head>
<body>

	<h1>요목조목에 오신걸 환영합니다.</h1>
	결과 페이지
	<table class="board-table">
		<thead>
			<tr>
				<th>지문 번호</th>
				<th>답변내용</th>
				<th>작성자명</th>
			</tr>
		</thead>
	<c:forEach items="${answerall}" var="vo">
		<tbody>
			<tr>
				<c:set var="mainId" value="${vo.detail_id}" />
				<td>${vo.answer_id}</td>
				<td>${vo.answer}</td>
				<td>${vo.member_name}</td>				
			</tr>
		</tbody>
	</c:forEach>
</table>
<!-- 	<button>제출하기</button> -->
<%-- 	<a href="/survey/surveyUpdatePage?id=${id}"> --%>
<!-- 		<button>수정하기</button> -->
<!-- 		<button> -->
<%-- 			<a href="/survey/surveydelete?id=${id}">삭제하기</a> --%>
<!-- 		</button> -->

<!-- 	</a> -->

</body>
</html>