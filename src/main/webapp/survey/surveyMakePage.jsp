<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyMakeStyle.css">
<title>설문조사 만들기</title>
</head>
<body>

	<h1 style="text-align: center;">메인 설문조사 만들기</h1>
	<form action="/survey/surveyMake" method="post">
		<table>
			<sec:csrfInput />
			<tr>
				<td class="content">게시글 제목<br> <input type="text"
					name="main_title" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td class="content">게시글 내용 <br> <input type="text"
					name="main_content" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td class="content">카테고리 <br> <select name="main_category">
						<option value="온라인">온라인</option>
						<option value="오프라인">오프라인</option>
						<option value="패널단 모집">패널단 모집</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="content">리워드<br> <input type="number"
					name="main_reward" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td class="content">인원 제한 <br> <input type="number"
					name="main_limit" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td class="content">시작 시간 <br> <input type="date"
					name="main_start_time">
				</td>
			</tr>
			<tr>
				<td class="content">종료 시간 <br> <input type="date"
					name="main_end_time">
				</td>
			</tr>
			<tr>
				<td class="content">예상 소요시간(분) <br> <input type="number"
					name="use_time" style="width: 100%;">
				</td>
			</tr>
			<tr>
			
		</tr>
		</table>
		<button>작성하기</button>
	</form>

</body>
</html>