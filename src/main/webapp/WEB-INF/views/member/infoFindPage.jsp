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
	href="${pageContext.request.contextPath}/resources/css/member/memberSearch.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>회원가입 페이지</title>

</head>
<body>
	<div class="find-container">
		<div class="find-section">
			<h1>아이디 찾기</h1>
			<hr>
			<form action="/sendEmail" method="post">
				<sec:csrfInput />
				
					<div class="div-spacing">
						<span>이메일 주소</span> <input type="text" id="member_email"
							class="inputTextEmail" value="hyjm6713"><span>
							@naver.com </span>
					</div>
					<div class="div-spacing">
						<input type="text" placeholder="인증번호 6자리 입력" maxlength="6"
							disabled="disabled" id="certNum_ID">
						<button type="button" id="IDmailRequestBtn">
							<span>인증번호 받기</span>
						</button>
					</div>
					<div class="div-spacing">
						<button type="button" id="idCompairBtn">
							인증번호 확인<span id="mailCheckMsg"></span>
					</div>
			</form>
		</div>
		<br> <br> <br>
		<div class="find-section">
			<form action="/sendEmail" method="post">
				<h1>비밀번호 찾기</h1>
				<hr>

				<sec:csrfInput />
				<div class="div-spacing">
					<span>아이디</span> <input type="text" id="member_name"
						placeholder="아이디" value="cha8379">
				</div>
			<div class="div-spacing">
					<span>이메일 주소</span> <input type="text" id="member_PWemail"
						class="inputTextEmail" value="hyjm6713"><span>
						@naver.com </span>
				</div>
				<div class="div-spacing">
					<input type="text" placeholder="인증번호 6자리 입력" maxlength="6"
						disabled="disabled" id="certNum_PW">
					<button type="button" id="PWmailRequestBtn">
						<span>인증번호 받기</span>
					</button>
				</div>
				<div class="div-spacing">
					<button type="button" id="PWCompairBtn">
						인증번호 확인<span id="mailCheckMsg"></span>
				</div>
			</form>
		</div>
	</div>
	<div id="IdPopup" class="modal">
		<div>Email을 확인 해주세요</div>
		<button id="closeModal">확인</button>
	</div>
	<div id="passwordPopup" class="modal">
		<form id="passwordChangeForm" style="display: block;">
			<sec:csrfInput />
			<label>새 비밀번호:</label> <input type="password" class="form-control"
				name="member_password" id="new_member_password"> <label>새
				비밀번호 확인 :</label> <input type="password" class="form-control"
				name="new_member_password" id="new_member_password_cert">
			<button id="PWchangeBtn" type="submit">변경하기</button>
		</form>
	</div>
</body>

<script>
var csrfToken = $("input[name='_csrf']").val(); // CSRF 토큰 저장

function validateForm() {
    var new_member_password = document.getElementById("new_member_password").value;
    var new_member_password_cert = document.getElementById("new_member_password_cert").value;

    if (new_member_password == null || new_member_password.length < 8 || new_member_password.length > 15 ) {
        alert("비밀번호는 8자 이상 15자리 이하여야 합니다.");
        return false;
    }
    if (new_member_password_cert !== new_member_password) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true;
}

	//ID인증번호 보내기
	$(document).ready(function() {
		$('#IDmailRequestBtn').click(function() {
			var email = $('#member_email').val();
			$.ajax({
				url : '/survey/sendEmailID',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				},
				data : {
					email : email
				},
				success : function(response) {
					alert('인증번호가 발송되었습니다.');
					$('#certNum_ID').prop('disabled', false); // 인증번호 입력 필드 활성화
				},
				error : function(xhr, status, error) {
					alert('유효한 이메일이 아닙니다');
				}
			});
		});

		//ID인증번호 검증하기
		$('#idCompairBtn').click(function() {
			var certNum_ID = $('#certNum_ID').val();
			var email = $('#member_email').val();
			$.ajax({
				url : '/survey/compairNumber',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				},
				data : {
					email : email,
					certNum_ID : certNum_ID
				},
				success : function(checkNum) {
					alert("성공");
					$("#IdPopup").show();
				},
				error : function(xhr, status, error) {
					console.log(xhr.responseText);
					alert("실패" + xhr.responseText);
					console.error("오류 발생: " + error);
				}
			});
		});

		//PW 인증번호 보내기
		$('#PWmailRequestBtn').click(function() {
			var email = $('#member_PWemail').val();
			var member_name = $('#member_name').val();
			$.ajax({
				url : '/survey/sendEmailPW',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				},
				data : {
					email : email,
					member_name : member_name
				},
				success : function(response) {
					alert('인증번호가 발송되었습니다.');
					$('#certNum_PW').prop('disabled', false); // 인증번호 입력 필드 활성화

				},
				error : function(xhr, status, error) {
					alert('유효하지 않은 정보입니다.');
				}
			});
		});

		//PW인증번호 검증하기
		$('#PWCompairBtn').click(function() {
			var certNum_PW = $('#certNum_PW').val();
			$.ajax({
				url : '/survey/compairPWNumber',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				},
				data : {
					certNum_PW : certNum_PW
				},
				success : function(checkNum) {
					alert("성공");
					console.log("인증번호: " + checkNum);
					$("#passwordPopup").show();
					$(".modal-backdrop").removeClass("show"); // 배경에서 'show' 클래스 제거
				},
				error : function(xhr, status, error) {
					alert("올바른 번호가 아닙니다.");
				}
			});
		});
		
		//PW변경하기
		//AJAX 요청을 통해 서버에 데이터를 전송한 후 페이지 리디렉션을 원하는 경우, 페이지 리디렉션이 클라이언트 측 JavaScript에서 처리되어야 합니다. 서버에서 return "redirect:/loginPage";를 사용하는 것은 전통적인 서브밋(submit) 방식의 폼 처리에 적합하지만, AJAX 요청에서는 작동하지 않습니다. AJAX 요청은 비동기적으로 수행되며, 서버의 응답이 클라이언트에게 반환된 후 JavaScript 코드로 추가 처리를 해야 합니다.
		$('#PWchangeBtn').click(function() {
		    event.preventDefault(); // 폼의 기본 제출 동작 차단
		    // 유효성 검사 실패 시 작업 중단
		    if (!validateForm()) {
		        return;
		    }
		    
			var email = $('#member_PWemail').val();
			var new_member_password = $('#new_member_password').val();
			var new_member_password_cert = $('#new_member_password_cert').val();
			$.ajax({
				url : '/survey/PWupdate',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				},
				data : {
					email : email,
					new_member_password : new_member_password,
					new_member_password_cert : new_member_password_cert
				},
				success : function(checkNum) {
					alert("성공");
					window.location.href = '/survey/loginPage';
				},
				error : function(xhr, status, error) {
					alert("에러가 발생했습니다 다시 시도해주세요");
				}
			});
		});
		
		$('#closeModal').click(function() {
	        $('#IdPopup').hide(); // 모달 숨기기
	    });
	});
	

	
</script>
<style>
#passwordPopup {
	display: none; /* 처음에는 숨김 */
}
#IdPopup {
	display: none; /* 처음에는 숨김 */
}
</style>

</html>