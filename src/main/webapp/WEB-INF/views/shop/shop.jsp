<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop/shopStyle.css">

</head>
<body>


	<h2>굿즈샵</h2>
	<hr>
	기프티콘 사용 기한은 각 상품마다 상이합니다.
	<br>
	<br>
	<sec:authorize access="hasRole('ROLE_MASTER')">
		<button style="padding: 5px 10px;">
			<a href="./shop/shopUploadPage.jsp">등록하기 
		</button>
	</sec:authorize>
	<div class="card-container">
		<c:forEach items="${goodsAll}" var="goods" varStatus="loop">
			<div class="card2">
				<div class="card-image">
					<a href="./shopDetail/${goods.goods_content}"> <c:choose>
							<c:when test="${goods.goods_img != null}">
								<img
									src="${pageContext.request.contextPath}/resources/img/${goods.goods_img}"
									alt="${goods.goods_content}" />
							</c:when>
							<c:otherwise>
								<img src="resources/img/no_img.jpg" alt="No Image" />
							</c:otherwise>
						</c:choose>
				</div>
				<div class="card-content">
					<div class="card-text">
						<p>${goods.goods_price}원</p>
						<p>${goods.goods_content}</p>
					</div>
					</a>
					<sec:authorize access="hasRole('ROLE_MASTER')">

						<!-- 				<button><a href="./shop/shopUpdatePage.jsp">수정하기</button> -->
						<button>
							<a href="/survey/shop/shopUpdatePage/${goods.goods_content}">수정하기


							
						</button>
						<button>
							<a href="/survey/shopDelete/${goods.goods_id}">삭제하기 
						</button>
				</div>
				</sec:authorize>
			</div>


			<c:if test="${loop.index % 3 == 2 || loop.last}">
				<div style="clear: both;"></div>
			</c:if>
		</c:forEach>
	</div>

	<br>
	<br>
	<br>
	<br>

</body>
</html>