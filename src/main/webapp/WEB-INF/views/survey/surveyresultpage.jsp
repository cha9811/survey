<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/header.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyListStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<h1>요목조목에 오신걸 환영합니다.</h1>
	결과 페이지
	<br>
	<table class="board-table">
		<thead>
			<tr>
				<th>제목</th>
				<th>현황</th>
				<th>마감일</th>
			</tr>
		</thead>
		<c:forEach items="${result_main}" var="vo">
			<a href="./surveyresultdetailpage/${vo.main_id}">
				<tbody>
					<tr>
						<c:set var="mainId" value="${vo.main_id}" />
						<td>${vo.main_title}</td>
						<td style="text-align: center">${surveyStatus[vo.main_id]}</td>
						<td>${formattedMainEndTime[vo.main_id]}</td>

					</tr>
				</tbody>
		</c:forEach>
	</table>
</body>
</html>