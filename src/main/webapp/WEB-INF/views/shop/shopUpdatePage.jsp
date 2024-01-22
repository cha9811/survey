<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="//header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

	굿즈 썸네일 수정하기
<!-- 	<form action="/shopUpload" method="post"> -->
	<form action="/survey/shopUpdate" method="post" enctype="multipart/form-data">
		<sec:csrfInput/>
		<table>
			<tr>
				<td>상품번호<br> <textarea 	name="goods_id"
						style="resize: none;">${goods.goods_id}</textarea><br>
				</td>
			</tr>
			<tr>
				<td>상품명<br> <textarea name="goods_content"
						style="resize: none;">${goods.goods_content}</textarea><br>
				</td>
			</tr>
			<tr>
				<td>가격 <br> <textarea name="goods_price"
						style="resize: none;">${goods.goods_price}</textarea><br>
				</td>
			</tr>
			<tr>
				<td>브랜드 <br> <textarea name="goods_brand"
						style="resize: none;">${goods.goods_brand}</textarea><br>
				</td>
			</tr>
			<tr>
				<td>
					<div style="display: flex; align-items: center;">
						 <input type="file" name="file" id="goods_img"
							onchange="previewImage(this);">
					</div> <img id="preview" style="max-width: 200px; max-height: 200px;" src=${goods.goods_img}>
				</td>
			</tr>
		</table>
		<button type="submit" style="margin-left: 80px;" >작성하기</button>

	</form>

</body>
</html>