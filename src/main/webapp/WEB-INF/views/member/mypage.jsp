<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS 파일 링크 -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/myPage.css">
</head>
<body>
	<h1>요목조목에 오신걸 환영합니다.</h1>
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h2 class="text-center mb-4">마이페이지</h2>
			<div class="info-group">
				닉네임: ${memberInfo.member_nickname} 보유 포인트 :
				${memberInfo.member_money} 내가 가진 기프티콘 <br>
				<hr>
				<div class="card-container">
					<c:forEach items="${giftcon}" var="giftcon" varStatus="loop">
						<div class="card">
							<div class="card-image">
								<img
									src="${pageContext.request.contextPath}/resources/img/${giftcon.gifticon_img}"
									alt="Gift Image">
							</div>
							<div class="card-content">
								<h3>굿즈: ${giftcon.goods_content}</h3>
								<p>구매일: ${giftcon.date}</p>
								<button><a href="./myGifticonDelete/${giftcon.gifticon_id}">사용완료</a></button>
							</div>
						</div>

					</c:forEach>
				</div>
				<button type="button" class="btn btn-primary custom-button"
					id="changeBtn">내 정보 변경하기</button>
				<button type="button" class="btn btn-primary custom-button"
					id="changeBtn2">비밀번호 변경하기</button>


				<!-- 비번변경 -->
				<form id="passwordChangeForm" action="memberPWupdate"
					style="display: none;">
					<label>현재 비밀번호:</label> <input type="password" class="form-control"
						name="member_password" id="inputOldPassword"> <label>새
						비밀번호 :</label> <input type="password" class="form-control"
						name="new_member_password" id="inputNewPassword">
					<button type="submit">변경하기</button>
					<button type="button" class="btn btn-secondary custom-button"
						id="cancelBtn">취소하기</button>
				</form>
				<!-- 비번변경 끝 -->

				<!-- 내정보변경 -->
				<div id="passwordPopup" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="passwordPopupLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="passwordPopupLabel">개인정보 변경하기</h5>
								<button type="button" id="Cancel_button"
									class="close custom-button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="memberupdate">
									<label>유저 ID:</label> <input name="member_id"
										value="${memberInfo.member_id}"> <label>닉네임:</label> <input
										name="member_nickname" value="${memberInfo.member_nickname}">
									<label>나이 : </label> <select name="member_age">
										<option value="20대">20대</option>
										<option value="30대">30대</option>
										<option value="40대">40대</option>
									</select> <label>핸드폰 번호 :</label> <input name="member_phone"
										value="${memberInfo.member_phone}"> <label>직업
										:</label> <select name="member_job">
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
									</select>
									</td>
									</tr>
									<label>거주지 :</label> <select name="member_local">
										<option>경기도</option>
										<option>경상남도</option>
										<option>경상북도</option>
										<option>전라남도</option>
										<option>전라북도</option>
										<option>충청남도</option>
										<option>충청북도</option>
										<option>제주도</option>
									</select>
									</td>
									</tr>

									<label>이메일 :</label> <input name="member_email"
										value="${memberInfo.member_email}"> <br> <label>현재
										비밀번호:</label> <input type="password" class="form-control"
										name="member_password" id="inputOldPassword"> <label>비밀번호
										확인:</label> <input type="password" class="form-control"
										name="member_password2" id="inputNewPassword">


									<div class="modal-footer">
										<button type="submit" class="btn btn-primary custom-button"
											id="confirmChange">변경하기</button>
									</div>
								</form>
</body>
<style>
#passwordPopup {
	display: none; /* 처음에는 숨김 */
}
</style>
<!-- JavaScript 파일 링크 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#changeBtn2").click(function() {
			// 비밀번호 변경 폼을 표시하는 코드
			$("#passwordChangeForm").show();
		});
	});
	$("#cancelBtn").click(function() {
		// 취소하기 버튼을 클릭하면 폼을 숨기는 코드
		$("#passwordChangeForm").hide();
	});

	$(document).ready(function() {
		$("#changeBtn").click(function() {
			// 개인정보변경 보이기
			$("#passwordPopup").modal("show");
		});

		// 개인정보변경 숨김
		$(".custom-button[data-dismiss='modal']").click(function() {
			$("#passwordPopup").modal("hide");
		});
	});

	// JavaScript를 사용하여 option 요소에 value를 추가
	var ageSelect = document.querySelector("select[name='member_age']");
	var optionElement = selectElement.querySelector("option");

	// option 요소의 내용을 value로 설정
	optionElement.value = optionElement.textContent;
</script>
</html>
