<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice/noticeDetailStyle.css">

</head>
<body>
	<hr>
	<h2>공지사항 상세보기</h2>


	<div class="select-grup">

		<tbody>
			<tr>
				<td>제목 : ${notice.notice_title}</td>
				<br>
				<td>작성일시 : ${notice.notice_create_time.substring(0, 10)}</td>
				<br>
				<hr>
				<td>${notice.notice_content}</td>
				<br>
			</tr>
		</tbody>
	</div>

	<br>
	<div class="button-group">
		<button>
			<a href="<c:url value='noticeUpdatePage?id=${notice.notice_id}'/>">수정하기</a>
		</button>
		<form action="noticeDelete" method="post">
			<input type="hidden" name="id" value="${notice.notice_id}">
			<button type="submit" class="button-black">삭제하기</button>
		</form>
	</div>

</body>
</html>