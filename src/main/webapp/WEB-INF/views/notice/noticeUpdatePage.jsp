<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

공지사항 수정하기
		<a href="noticeDetail?id=${notice.notice_id}">취소하기</a>
	"${notice.notice_id}"
	<form action="noticeUpdate" method="post">
	<table>
			<input type="hidden" name="id" value="${notice.notice_id}">
			<tr>
				<td class="notice_title">게시글 제목<br> <textarea name="notice_title"
						 style="width: 770px; height: 25px; resize: none;">${notice.notice_title}</textarea><br>
				</td>
			</tr>
			<tr>
				<td class="content">게시글 내용 <br> <textarea
						name="notice_content"
						style="width: 770px; height: 250px; resize: none;">${notice.notice_content}</textarea><br>
				</td>
			</tr>
			<!--  <tr>
				<td>
					<div style="display: flex; align-items: center;">
						<!-- 이미지 업로드를 위한 input 태그
						<input type="file" name="file" id="MD_post_Thumbnail"
							onchange="previewImage(this);">
						<button type="submit" style="margin-left: 80px;">작성하기</button>
					</div> <img id="preview" style="max-width: 200px; max-height: 200px;">
				</td>
			</tr> -->
			<button>수정하기</button>
		</table>
	
	</form>

</body>
</html>