<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
<h1>예약 중인 상품</h1>
	<form action="">
		<table border="1">
			<tr>
				<td><input type="checkbox"> 전체 선택</td>
				<td>상품 이미지</td>
				<td>상품 제목</td>
				<td>요구사항</td>
				<td>상품 가격</td>
			</tr>
			<c:forEach var="basket" items="${basketList}">
				<tr>
					<td><input type="checkbox" name="select">선택</td>
					<td>${basket.item_idx }</td>
					<td>${basket.img_real_name }</td>
					<td>${basket.item_title }</td>
					<td>${basket.item_price }</td>
				</tr>
			</c:forEach>
			
		</table>
		<button onclick="location.href=''">선택 삭제</button>
		<input type="submit" value="구매하기">
	</form>
</body>
</html>