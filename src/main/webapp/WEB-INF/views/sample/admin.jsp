<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goBack() {
  window.history.back(); // 뒤로 가기 작업 수행
}
</script>
</head>
<body>
admin
<button onclick="goBack()">뒤로 가기</button> <!-- 버튼을 클릭하면 뒤로 가기 작업을 트리거합니다. -->
<a href="survey/customLogout">로그아웃</a>
</body>
</html>