<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 일단보류 -->
<!-- 일단보류 -->
<!-- 일단보류 -->
<!-- 일단보류 -->

<h1>요목조목에 오신걸 환영합니다.</h1>
관리자페이지

회원리스트
	<form action="login" method="post">
			<table>
			<tr>
				<td>아이디<br> <textarea name="member_name"
						style="resize: none;">admin</textarea><br>
				</td>
			</tr>
			<tr>
				<td>비밀번호 <br> <textarea name="member_password"
						style="resize: none;">1234</textarea><br>
				</td>
			</tr>
		</table>
		<button type="submit" style="margin-left: 80px;">로그인</button>

</form>
</body>
</html>