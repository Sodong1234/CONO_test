<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<jsp:include page="../header_footer/top.jsp"/>
</div>
	<h1>관심상품</h1>
	<hr>
	<table border="1">
		
		<tr>
			<td>item_idx</td>
			<td>img_real_name</td>
			<td>item_title</td>
			<td>item_region</td>
			<td>item_price</td>
			<td>item_date</td>
		</tr>
		
		<c:forEach var="wish" items="${wishList}" >
			<tr>
				<td>${wish.item_idx}</td>
				<td>${wish.img_real_name}</td>
				<td>${wish.item_title}</td>
				<td>${wish.item_region}</td>
				<td>${wish.item_price}</td>
				<td>${wish.item_date}</td>
			</tr>
		</c:forEach>
		
	</table>
	
<div id="wrap">
	<jsp:include page="../header_footer/bottom.jsp"/>
</div>
</body>
</html>