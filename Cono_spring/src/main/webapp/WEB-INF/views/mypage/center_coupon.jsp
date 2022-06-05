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
	<h1>쿠폰</h1>
	<c:forEach var="coupon" items="${couponList }">
		<table border="1">
			<tr><td>${coupon.coupon_title }</td><th>${coupon.coupon_price }</th><td>${coupon.coupon_content }</td></tr>
		</table>
		<br><br>
	</c:forEach>
</body>
</html>