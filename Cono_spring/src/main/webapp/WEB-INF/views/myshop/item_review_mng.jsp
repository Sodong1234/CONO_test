<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_review_mng.jsp</title>
<style type="text/css">
img {
	width: 200px;
}
</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/top.jsp" />
	</div>

	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>

	<hr>

	<div>
		<h3>상품 후기 관리</h3>
		<span>${itemAvg.get('avg') }</span> <span> (${itemAvg.get('item_idx') })</span>
		<table border="1">
			<!-- 막대 표현 어떻게 할지 고민..!! -->
			<tr>
				<td>5점</td>
				<td>${itemScore.get('5') }</td>
				<td rowspan="5"><img alt="" src="resources/upload/file/${img }"></td>
			</tr>
			<tr>
				<td>4점</td>
				<td>${itemScore.get('4') }</td>
			</tr>
			<tr>
				<td>3점</td>
				<td>${itemScore.get('3') }</td>
			</tr>
			<tr>
				<td>2점</td>
				<td>${itemScore.get('2') }</td>
			</tr>
			<tr>
				<td>1점</td>
				<td>${itemScore.get('1') }</td>
			</tr>
		</table>
	</div>
	
	<hr>
	
	<div>
		<table>
			<!-- 페이징 처리 처럼 옆으로 누르면 넘어가는 방식(한 칸씩 이동..! 부드럽게) -->
			<!-- URL 파라미터로 구분(상품 번호?) -->
			<tr>
				<c:forEach items="${imgNameList }" var="imgName">
					<td onclick="location.href='ItemReviewMng.shop?item_idx=${imgName.get('item_idx') }'">
						<c:choose>
							<c:when test="${imgName.get('img_name') ne null }">
								<img alt="" src="resources/upload/file/${imgName.get('img_name') }">
							</c:when>
							<c:otherwise>
								<img alt="" src="<spring:url value='/resources/default_img.png'/>">
							</c:otherwise>
						</c:choose>
						<span>${imgName.get('item_idx') }</span>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>

	<hr>

	<div>
		<!-- URL 파라미터로 구분(sort) -->
		추천순&nbsp;최신순&nbsp;평점순
		<table>
			<c:forEach items="${reviewList }" var="review">
				<tr>
					<td>${review.get('review_idx') }<br> ${review.get('review_content') }<br> ${review.get('item_score') }<br>
						${review.get('member_id') } / ${review.get('review_date') }<br>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>