<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="//header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function previewImages(input) {
    if (input.files && input.files.length > 0) {
        for (var i = 0; i < input.files.length; i++) {
            var reader = new FileReader();
            reader.onload = function(e) {
                // 이미지를 미리 보여주는 img 태그에 설정
                $('#preview').append('<img src="' + e.target.result + '" style="max-width: 200px; max-height: 200px; margin-right: 10px;">');
            };
            reader.readAsDataURL(input.files[i]);
        }
        $('#preview').show(); // 이미지를 보이도록 설정
    }
}
</script>
<!-- <script>
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
</script> -->
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/header.css">

<title>Insert title here</title>
</head>
<body>

	굿즈 올리기
<form action="${pageContext.request.contextPath}/shopGoodsUpload/${name}" method="post" enctype="multipart/form-data">
    <sec:csrfInput/>
    <input name="name" value="${name}" />
    <table>            
        <tr>
            <td>
                <div style="display: flex; align-items: center;">
                    <input type="file" name="files" id="goods_img" multiple
                        onchange="previewImages(this);">
                </div>
                <div id="preview"></div>
            </td>
        </tr>
    </table>    
    <button type="submit" style="margin-left: 80px;">작성하기</button>
</form>
<%-- 	응용 프로그램의 컨텍스트 경로를 가져오기 위해 ${pageContext.request.contextPath} EL 표현식을 포함하고 ${name}을 사용하여 URL 경로에서 name 매개변수의 실제 값을 포함합니다. --%>

<!-- 이 변경으로 form을 제출하면 요청이 올바른 URL로 전송되고, {name} 자리 표시자가 URL 경로의 실제 값으로 대체될 것입니다. 결과적으로 shopGoodsUpload 메서드는 올바른 name 매개변수를 받아야 합니다. -->
<!-- 	<form action="/survey/shopGoodsUpload" method="post" enctype="multipart/form-data"> -->
<!-- 		<table>			 -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<div style="display: flex; align-items: center;"> -->
<!-- 						 <input type="file" name="file" id="goods_img" -->
<!-- 							onchange="previewImage(this);"> -->
<!-- 					</div> <img id="preview" style="max-width: 200px; max-height: 200px;" src=${goods.goods_img}> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table>	 -->
<!-- 		<button type="submit" style="margin-left: 80px;" >작성하기</button> -->
<!-- 	</form> -->

</body>
</html>