<%@page import="java.util.ArrayList"%>
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

	<h1>코인페이지</h1>
	<button onclick="location.href='center_coin_payment'">코인충전</button>
	<table border="1">
		
		<tr><td colspan="4">사용가능한 코인</td><td>${coin_total}</td></tr>
		<tr><td>No.</td><td>적립내역</td><td>사용내역</td><td>보유 코인</td><td>날짜</td></tr>
		<c:forEach var="coinVO" items="${coin }">
		<tr><td>${coinVO.coin_idx}</td><td>${coinVO.coin_add }</td><td>${coinVO.coin_use }</td><td>${coinVO.coin_total }</td><td>${coinVO.coin_date }</td></tr>
		</c:forEach>
		
	</table>
</body>
</html>