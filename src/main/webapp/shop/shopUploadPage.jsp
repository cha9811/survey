<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop/shopUploadStyle.css">

<script>
function previewImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            // 이미지를 미리 보여주는 img 태그에 설정
            $('#preview').attr('src', e.target.result);
            $('#preview').show(); // 이미지를 보이도록 설정
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/header.css">

<title>Insert title here</title>
</head>
<body>

	<h1>굿즈 썸네일 만들기</h1>
	<hr>
	<br>
	<br>
	<form action="/survey/shopUpload" method="post"
		enctype="multipart/form-data">
		<sec:csrfInput />
		<table>
			<tr>
				<td>상품명<br> <input type="text" name="goods_content"
					style="width: 100%;"><br>
				</td>
			</tr>
			<tr>
				<td>가격 <br> <input type="text" name="goods_price"
					style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td>브랜드 <br> <input type="text" name="goods_brand"
					style="width: 100%;">
				</td>
			</tr>
			<tr>
				<td>
					<div style="display: flex; align-items: center;">
						<input type="file" name="file" id="goods_img"
							onchange="previewImage(this);">
					</div> <img id="preview" style="max-width: 200px; max-height: 200px;">
				</td>
			</tr>
		</table>
		<button type="submit">작성하기</button>

	</form>
	<br>
	<br>
	<br>
</body>
</html>