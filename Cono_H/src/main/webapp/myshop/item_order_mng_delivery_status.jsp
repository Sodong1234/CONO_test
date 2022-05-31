<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_order_mng_delivery_status.jsp</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="item_upload.jsp">상품 등록</a></li>
			<li><a href="item_mng.jsp">상품 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<hr>
	
	<h3>상품 주문 관리</h3>
	
	<div>
		<ul>
			<li onclick="location.href='item_order_mng.jsp'">전체 주문</li>
			<li onclick="location.href='item_order_mng_pay_status.jsp'">결제상태<br>(일반결제)</li>
			<li onclick="location.href='item_order_mng_delivery_status.jsp'">배송 상태</li>
			<li onclick="location.href='item_order_mng_cancel.jsp'">취소/환불 요청</li>
		</ul>
	</div>
	
	<hr>
	
	<div>
		<h3>배송 전</h3>
		<form action="">
			<table border="1">
				<tr>
					<th>주문일시</th>
					<th>주문상품</th>
					<th>주문한 사람</th>
					<th>가격</th>
					<th>결제방식</th>
					<th>배송상태</th>
					<th>V</th>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><input type="checkbox"></td>
				</tr>
			</table>
			<input type="submit" value="배송 시작">
		</form>
		
		<h3>배송 중</h3>
		<form action="">
			<table border="1">
				<tr>
					<th>주문일시</th>
					<th>주문상품</th>
					<th>주문한 사람</th>
					<th>가격</th>
					<th>결제방식</th>
					<th>배송상태</th>
					<th>V</th>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><input type="checkbox"></td>
				</tr>
			</table>
			<input type="submit" value="배송 완료">
		</form>
		
		<h3>배송 완료</h3>
		<table border="1">
			<tr>
				<th>주문일시</th>
				<th>주문상품</th>
				<th>주문한 사람</th>
				<th>가격</th>
				<th>결제방식</th>
				<th>배송상태</th>
				<th>V</th>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="checkbox"></td>
			</tr>
		</table>
	</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
	
</body>
</html>