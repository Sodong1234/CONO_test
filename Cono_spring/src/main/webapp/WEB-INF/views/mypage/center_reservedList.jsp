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
<c:forEach var="reserved" items="reservedList">
	<table border="1">
		<tr>
			<td>${reserved.it.item_idx }</td>
			<td>${reserved.im.img_real_name }</td>
			<td>${reserved.it.it.item_title }</td>
			<td>${reserved.it.item_region }</td>
			<td>${reserved.it.item_price }</td>
		</tr>
	</table>
	<br>
</c:forEach>
</body>
</html>