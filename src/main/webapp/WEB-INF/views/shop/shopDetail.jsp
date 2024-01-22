<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="//header.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상품페이지</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/shop/shopDetailStyle.css"/>">

</head>
<body>

	<h2>굿즈샵</h2>
	기프티콘 사용 기한은 발급일로부터 1년 이내 입니다. 타 매장의 상황마다 미 적용되는 가게가 있으니 참고부탁드립니다.
	<hr>
	<sec:authorize access="hasRole('ROLE_MASTER')">
		<button>
			<a href="/survey/shop/shopUpdatePage/${goods.goods_content}">수정하기</a>
		</button>
		<button>
			<a href="/survey/shop/shopGoodsUploadPage/${goods.goods_content}">등록하기</a>
		</button>

	</sec:authorize>
	<div class="container-container">
		<br>
		<div class="card">
			<c:choose>
				<c:when test="${goods.goods_img != null}">
					<img
						src="${pageContext.request.contextPath}/resources/img/${goods.goods_img}"
						alt="${goods.goods_content}" />

				</c:when>
				<c:otherwise>
					<img
						src="${pageContext.request.contextPath}/resources/img/no_img.jpg"
						alt="No Image" />
				</c:otherwise>
			</c:choose>
			<div class="card-text">
				<h3>
					<p>상품명 : ${goods.goods_content}</p>
				</h3>
				<p>사용처 : ${goods.goods_brand}</p>
				<p>금액 : ${goods.goods_price}원</p>
			</div>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<h3>구매 가능한 기프티콘 리스트</h3>
<div class="card-container">
	<!-- 기프티콘 리스트들 -->
	<c:forEach items="${gifticon}" var="vo" varStatus="loop">
	<div class="card2">
			<tr>
				<div class="card-image">
					<img
						src="${pageContext.request.contextPath}/resources/img/${vo.gifticon_img}"
						alt="Gift Image">
				</div>
				<div class="card-content">
					<td>제품명 : ${vo.goods_content}</td> <br>
					<td>등록일자 : ${vo.date}</td>
					<td>
					<br>
						<form action="/survey/gifticonBuy">
							<sec:csrfInput />
							<input type="hidden" name="gifticon_id" value="${vo.gifticon_id}" />
							<button type="submit">구매하기</button>
						</form>
						<form action="/survey/gifticonDelete">
							<sec:csrfInput />
							<input type="hidden" name="gifticon_id" value="${vo.gifticon_id}" />
							<button type="submit">삭제하기</button>
						</form>
					</td>
				</div>
		
			<c:if test="${loop.index % 3 == 2 || loop.last}">
				<div style="clear: both;"></div>
			</c:if>
			</div>
	</c:forEach>
</div>
</body>
<style>
form {
	display: inline; /* 혹은 display: inline-block; */
}
</style>
</html>