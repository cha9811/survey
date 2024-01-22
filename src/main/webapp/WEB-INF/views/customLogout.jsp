<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<form action="survey/customLogout" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<button>로그아웃</button>
</form>
<button onclick="goBack()">뒤로 가기</button> <!-- 버튼을 클릭하면 뒤로 가기 작업을 트리거합니다. -->



<h2>
</h2>
</body>
</html>