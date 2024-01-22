<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/loginStyle.css">
<title>Insert title here</title>
<script>
	function submitLoginForm() {

		var memberName = document.getElementsByName("member_name")[0].value;
		var memberPassword = document.getElementsByName("member_password")[0].value;

		if (memberName === "" || memberPassword === "") {
			alert("아이디와 비밀번호를 입력하세요.");
			return false;
		}

		//TODO: 현재 미작동
		if (validationFails) {
			alert("계정이 올바르지 않습니다."); // Display the popup
			return false; // Prevent form submission
		}

		console.log("양식이 성공적으로 제출되었습니다."); // 디버깅을 위해 이 줄을 추가합니다

	}
</script>
</head>
<body>
	<h1>요목조목에 오신걸 환영합니다.</h1>
	<div class="wrapper">
		<div class="container">
			<div class="sign-in-container">
	<h2 style="margin-left: 80px;">로그인페이지</h2>
				<form action="login" method="post"
					onsubmit="return submitLoginForm();">
					<table>
						<tr>
							<td>아이디<br> <input name="member_name"
								placeholder="id" value="admin"><br>
							</td>
						</tr>
						<tr>
							<td>비밀번호 <br> <input name="member_password"
									type="password" placeholder="Password" value="yuno8282"><br>
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /></td>
						</tr>
					</table>
					<button class="form_btn">로그인하기</button>
				</form>
					
				
			</div>
			<div class="overlay-container">
				<div class="overlay-right">
					<h1>방문을 환영합니다.</h1>
					<p>당신의 정보를 더욱 가치있게</p>			
					
					<a href="/survey/signUpPage" class="button-link"><button id="signUp" class="overlay_btn">회원가입</button></a>
					<a href="/survey/findMemberPage" class="button-link"><button>ID/비밀번호 찾기</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
		 window.onload = function() {
		        // URL에서 쿼리 파라미터를 파싱합니다.
		        var queryParams = new URLSearchParams(window.location.search);
		        // 'message' 파라미터의 값을 확인합니다.
		        var message = queryParams.get('message');
		        // 'message' 파라미터가 'error'와 일치하는 경우 알림을 표시합니다.
		        if (message === 'error') {
		            alert('로그인에 실패하였습니다. 다시 시도해주세요.');
		        }
		    };		</script>
</html>