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
	href="${pageContext.request.contextPath}/resources/css/member/singUpStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>회원가입 페이지</title>

</head>
<body>
	<div class="joinForm">
		<h1 style="text-align: center;">회원가입</h1>
		<hr>
		<form method="post" action="signUp">
			<table style="width: 1000px;">
				<sec:csrfInput />
				<tr class="textForm">
					<th>아이디</th>
					<td>
					<input type="text" name="member_name" id="member_name"
						placeholder="아이디를 입력해주세요">
						<button type="button" id="checkUsernameBtn" onclick="checkUsernameAvailability()">중복확인</button><br>
				    <span style="font-size: smaller; color: gray;">아이디는 4자 이상 20자 이하이어야 합니다.</span>
				</td> 
				</tr>

				<tr class="textForm">
					<th>비밀번호</th>
					<td>
					<input type="password" class="pw" id="member_password"
						name=member_password placeholder="비밀번호를 입력해주세요" value="1234">
					<br>
					<span style="font-size: smaller; color: gray;">비밀번호는 8자 이상이어야 합니다.</span></td>
				</tr>

				<tr class="textForm">
					<th>비밀번호 확인</th>
					<td><input type="password" class="pw" id="member_password2"
						placeholder="비밀번호를 다시 입력해주세요" value="1234"></td>
				</tr>
				<tr class="textForm">
					<th>이름</th>
					<td><input type="text" name="member_nickname" class="name"
						placeholder="member_nickname" value="가가가"></td>
				</tr>
				<tr class="textForm">
					<th>나이</th>
					<td><select name="member_age">
							<option value="20대">20대</option>
							<option value="30대">30대</option>
							<option value="40대">40대</option>
					</select></td>
				</tr>

				<tr class="textForm">
					<th>핸드폰 번호</th>
					<td><input type="text" name="member_phone"
						placeholder="member_phone" value="가가가"></td>
				</tr>
				<tr class="textForm">
					<th>직업</th>
					<td><select name="member_job">
							<option value="기획,전략">기획,전략</option>
							<option value="마케팅,홍보,조사">마케팅,홍보,조사</option>
							<option value="회계,세무,재무">회계,세무,재무</option>
							<option value="총무,법무,사무">총무,법무,사무</option>
							<option value="IT개발,데이터">IT개발,데이터</option>
							<option value="디자인">디자인</option>
							<option value="영업,판매,무역">영업,판매,무역</option>
							<option value="고객상담,TM">고객상담,TM</option>
							<option value="구매,자재,물류">구매,자재,물류</option>
							<option value="상품기획,MD">상품기획,MD</option>
							<option value="서비스">서비스</option>
							<option value="생산">생산</option>
							<option value="건설,건축">건설,건축</option>
							<option value="의료">의료</option>
							<option value="연구,R&D">연구,R&D</option>
							<option value="교육">교육</option>
							<option value="미디어,문화,스포츠">미디어,문화,스포츠</option>
							<option value="금융,보험">금융,보험</option>
							<option value="공공,복지">공공,복지</option>
							<option value="회계,세무,재무">회계,세무,재무</option>
					</select></td>
				</tr>
				<tr class="textForm">
					<th>주소</th>
					<td><select name="member_local">
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="부산시">부산시</option>
							<option value="대구시">대구시</option>
							<option value="인천시">인천시</option>
							<option value="광주시">광주시</option>
							<option value="대전시">대전시</option>
							<option value="울산시">울산시</option>
							<option value="세종시">세종시</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="제주도">제주도</option>
					</select></td>
				</tr>
				<tr class="textForm">
					<th>이메일</th>
					<td><input type="text" name="member_email" value=""> <span
						class="hyphen">@naver.com</span></td>
				</tr>
			</table>
			<br>
			<div class="button-container" style="text-align: center;">
				<input type="button" id="cancel" class="btn" value="취소">
				<button type="submit" id="inserBtn" class="btn">가입</button>
			</div>
		</form>
		<br><br>
	</div>

</body>

<script>
var isUsernameAvailable = false; // 중복 체크 결과를 저장하는 변수

$(document).ready(function() {
	// 취소 버튼 클릭 이벤트 핸들러 (뒤로가기)
    $('#cancel').click(function() {
        window.history.back(); // 이전 페이지로 이동
    });
	
	// id 중복 체크 
    $('#checkUsernameBtn').click(function() {
        checkUsernameAvailability(true); // 버튼 클릭 시 알림을 표시
    });

    // 폼 제출 핸들러
    $('form').submit(function(event) {
        event.preventDefault(); // 기본 제출 방지

        var self = this; // 현재 폼의 참조 저장
        // 1차로 유효성 검사 진행
        if (!validateForm()) {
            return; // 유효성 검사 실패 시 여기서 처리 종료
        }
        checkUsernameAvailability(false).then(function(isValid) { // 폼 제출 시에는 알림을 표시하지 않음
            console.log("CheckUsernameAvailability resolved");
            if (!isValid) {
            	// 아이디가 유효하지 않으면 여기서 종료
            	alert("이미 사용 중인 아이디입니다.");
                return;
            }
            if (validateForm()) {
                self.submit(); // 중복 체크와 유효성 검사를 통과하면 폼 제출
            }

        });
    });
});

function validateForm() {
    var username = document.getElementById("member_name").value;
    var password = document.getElementById("member_password").value;
    var confirmPassword = document.getElementById("member_password2").value;
    
    if (!username) {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if (username.length < 4 || username.length > 20) {
        alert("아이디는 4자 이상 20자 이하이어야 합니다.");
        return false;
    }
    if (password.length < 8 ||password.length > 15) {
        alert("비밀번호는 8자 이상 15자리 이하여야 합니다.");
        return false;
    }
    if (password !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true;
}

// 아이디 중복 체크
function checkUsernameAvailability(showAlert) {
    return new Promise(function(resolve, reject) {
        var username = $('#member_name').val().trim();
        if (!username || username.length < 4 || username.length > 20) {
            if (showAlert) {
                alert("아이디는 4자 이상 20자 이하이어야 합니다.");
            }
            return;
        }
        
        if (username.length > 20) {
            if (showAlert) {
                alert("아이디는 20자 이하이어야 합니다.");
            }
            isUsernameAvailable = false; // 중복 체크 결과를 실패로 설정
            resolve(); // Promise를 여기서 종료
            return;
        }
        $.ajax({
            url: '/survey/checkUsername',
            type: 'GET',
            dataType: 'json',
            data: { member_name: username },
            success: function(response) {
                isUsernameAvailable = response;
                resolve(response); 

                if (showAlert) {
                    if (response) {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용 중인 아이디입니다.");
                    }
                }
                resolve();
            },
            error: function(xhr, status, error) {
                alert("오류 발생: " + error);
            	console.log("ajax_error");

                isUsernameAvailable = false; 
                resolve();
            }
        });
    });
}
</script>

</html>