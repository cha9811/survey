<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/surveyDetailStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>설문조사시작하기</title>
</head>
<body>

	<hr>
	<h1>제목: ${survey_main_title}</h1>
	<h3>리워드: ${id}</h3>

	<table class="board-table">
		<thead>
			<tr>
				<th>구분</th>
				<th>내용</th>
				<th>답변</th>
			</tr>
		</thead>
		<form id="surveyForm" action="/survey/surveySubmit?id=${id}">
			<input type="hidden" name="id" value="${id}"></input>
			<c:forEach items="${detailsurvey}" var="vo" varStatus="status">
				<tbody>
					<c:if test="${vo.detail_category == '1'}">
						<tr>
							<c:set var="mainId" value="${vo.main_id}" />
							<td>${status.index + 1}번째문항</td>
							<td>${vo.detail_content}</td>
							<td><input type="text" name="detail_answer_${vo.detail_id}"
								value="${vo.detail_answer}" required /> <br>
						</tr>
					</c:if>
					<c:if test="${vo.detail_category == '2'}">
						<tr>
							<c:set var="mainId" value="${vo.main_id}" />
							<td>${status.index + 1}번째문항</td>
							<td>${vo.detail_content}</td>
							<td><select class="detail-category-select"
								data-detail-id="${vo.detail_id}"
								name="detail_answer_${vo.detail_id}" required>
									<c:forEach items="${answerMap[vo.detail_id]}" var="option">
										<option name="detail_answer_${vo.detail_id}"
											value="${option.answerlist_answer}">${option.answerlist_answer}</option>
									</c:forEach>
							</select>
						</tr>
					</c:if>
					<c:if test="${vo.detail_category == '3'}">
						<tr>
							<c:set var="mainId" value="${vo.main_id}" />
							<td>${status.index + 1}번째문항</td>
							<td class="big_input">${vo.detail_content}</td>
							<td><input type="checkbox"
								name="detail_answer_${vo.detail_id}" value="1">1번 <br>
								<input type="checkbox" name="detail_answer_${vo.detail_id}"
								value="2">2번 <br> <input type="checkbox"
								name="detail_answer_${vo.detail_id}" value="3">3번 <br>
								<input type="checkbox" name="detail_answer_${vo.detail_id}"
								value="4">4번 <br> <input type="checkbox"
								name="detail_answer_${vo.detail_id}" value="5">5번 <br></td>
						</tr>
					</c:if>
				</tbody>
			</c:forEach>
		</form>
	</table>
	<div class="button-container">
		<button type="submit" form="surveyForm">제출하기</button>
		<sec:authorize access="hasAnyRole('ROLE_MASTER', 'ROLE_ADMIN')">
		    <c:if test="${isNameMatch}">
			<button>
				<a href="/survey/surveyUpdatePage?id=${id}">수정하기 
			</button>
			</a>
			<button>
				<a href="/survey/surveydelete?id=${id}">삭제하기 
			</button>
			</a>
			</c:if>
		</sec:authorize>
	</div>
</body>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						document
								.getElementById('surveyForm')
								.addEventListener(
										'submit',
										function(event) {
											var inputs = document
													.querySelectorAll('#surveyForm input[type="text"]');
											for (var i = 0; i < inputs.length; i++) {
												if (inputs[i].value == null
														|| inputs[i].value
																.trim() === '') {
													alert('모든 필드를 채워주세요.');
													event.preventDefault();
													return false;
												}
											}
										});
					});
</script>

</html>