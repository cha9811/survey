<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<title>에러 페이지</title>
<script>
function goBack() {
  window.history.back(); // 뒤로 가기 작업 수행
}
</script>
</head>
<body>

해당 페이지에 접근할수 있는 권한이 없습니다.
<button onclick="goBack()">뒤로 가기</button>

<h2>
</h2>
</body>
</html>
