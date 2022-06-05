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
<h1>예약 중인 상품</h1>
<c:forEach var="reserved" items="${reservedList}">
	<table border="1" onclick="location.href='아이템디테일?idx'">
		<tr>
			<td>${reserved.item_idx }</td>
			<td>${reserved.img_real_name }</td>
			<td>${reserved.item_title }</td>
			<td>${reserved.item_region }</td>
			<td>${reserved.item_price }</td>
		</tr>
	</table>
	<br>
</c:forEach>
</body>
</html>