<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/header.css">

<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice/noticeMakeStyle.css">

</head>
<body>

<h1>공지사항 만들기</h1>
<hr>
<br>
	<form action="/survey/noticeMake" method="post">
	<table>
			<tr>
				<td class="notice_title">게시글 제목<br> <textarea name="notice_title"
						style="width: 770px; height: 25px; resize: none;"></textarea><br>
				</td>
			</tr>
			<tr>
				<td class="content">게시글 내용 <br> <textarea
						name="notice_content"
						style="width: 770px; height: 250px; resize: none;"></textarea><br>
				</td>
			</tr>
			
		</table>
		<button>작성하기</button>
	</form>
<br>
<br>
</body>
</html>