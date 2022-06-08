<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_order_mng.jsp</title>
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
	
	<hr>

	<h3>상품 주문 관리</h3>
	
	<hr>
	
	<!-- 
	판매 중('Y')
	구매 진행 중 ('I') : ord 테이블 insert할 때
	구매 완료 ('F') : ord 테이블 delete할 때
	예약 중('R')
	 -->
	
	<div>
		<h4>주문 진행 중</h4>
		<table border="1">
			<tr>
				<th>주문일시</th>
				<th>주문상품</th>
<!-- 				<th>주문수량</th> -->
				<th>주문한 사람</th>
				<th>가격</th>
				<th>주문 요청사항</th>
			</tr>
			<c:forEach items="${ordList }" var="ord">
				<tr>
					<td>${ord.get('order_date') }</td>
					<td>${ord.get('item_title') }</td>
<%-- 					<td>${ord.get('ord_quantity') }</td> --%>
					<td>${ord.get('member_id') }</td>
					<td>${ord.get('item_price') }</td>
					<td>${ord.get('order_reqContent') }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>