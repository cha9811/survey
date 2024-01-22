<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice/notice_all_style.css">
<link rel="stylesheet" href="/resources/css/header.css">

</head>
<body>
	<h1>요목조목에 오신걸 환영합니다.</h1>
	<h2>공지사항</h2>
	<table class="board-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<c:forEach items="${notice}" var="vo">
			<tbody>
				<tr>
					<td>${vo.notice_id}</td>
					<td><a href="<c:url value='noticeDetail?id=${vo.notice_id}'/>">${vo.notice_title}</a></td>
					<td>${vo.writer}</td>
					<c:choose>
						<c:when test="${empty vo.notice_modifi_time}">
							<td>${vo.notice_create_time.substring(0, 10)}</td>
						</c:when>
						<c:otherwise>
							<td>${vo.notice_modifi_time.substring(0, 10)}(수정됨)</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</c:forEach>
	</table>

	<sec:authorize access="hasAnyRole('ROLE_MASTER', 'ROLE_ADMIN')">
		<div class="button">
			<a href="./notice/noticeMakePage.jsp"><span><input
					type="button" class="button-black" value="글쓰기"></span></a>
		</div>
	</sec:authorize>
</body>
</html>