<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_detail.jsp</title>
<style type="text/css">
	img {
		width: 200px;
	}
</style>
</head>
<body>
	
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="ItemOrdMng.shop">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	<!-------- 본문 -------->
	<h3>상품 정보 상세</h3>
	<div>
		<hr>
		<form>
			<table border="1">
				<tr>
					<td colspan="2">
						<input type="button" value="수정하기" onclick="location.href='ItemModifyForm.shop?item_idx=${itemDetail.get('item_idx')}'">
						<input type="button" value="삭제하기" onclick="location.href='ItemDelete.shop?item_idx=${itemDetail.get('item_idx')}'">
						<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}">
					</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td>
						<c:forEach items="${imgList }" var="item">
							<c:choose>
								<c:when test="${item.getImg_name() != null}">
									<img src="resources/upload/file/${item.getImg_name() }"><br>
								</c:when>
								<c:when test="${item.getImg_name() == null}">
									<img alt="상점 이미지" src="<spring:url value='/resources/default_img.png'/>"><br>
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td>${itemDetail.get('item_idx')}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${itemDetail.get('item_title')}</td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td>${itemDetail.get('item_content')}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${itemDetail.get('item_price')}</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${itemDetail.get('item_quantity')}</td>
				</tr>
				<tr>
					<th>상품 등록일</th>
					<td>${itemDetail.get('item_date')}</td>
				</tr>
				<tr>
					<th>판매 상태</th>
					<td>${itemDetail.get('item_status')}</td>
				</tr>
				<tr>
					<th>찜</th>
					<td>${itemDetail.get('COUNT(w.member_id)')}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${itemDetail.get('item_readCnt')}</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${itemDetail.get('category_big')} > ${itemDetail.get('category_small')}</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td>${itemDetail.get('item_region')}</td>
				</tr>
				<tr>
					<th>숨김</th>
					<td>${itemDetail.get('item_hide')}</td>
				</tr>
			</table>
		</form>
	</div>
	<!---------------------->
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>