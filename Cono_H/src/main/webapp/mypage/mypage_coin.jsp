<%@page import="vo.CoinDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<CoinDTO> articleList = (ArrayList<CoinDTO>)request.getAttribute("articleList");
String coinBalance = (String)request.getAttribute("coinBalance");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>코인페이지</h1>
	<button onclick="">충전하기</button>
	<table border="1">
		
		<tr><td colspan="3">사용가능한 코인</td><td><%= coinBalance %></td></tr>
		<tr><td>적립내역</td><td>사용내역</td><td>날짜</td><td>총 코인</td></tr>
		<%for(CoinDTO article : articleList) { %>
		<tr><td><%=article.getCoin_add() %></td><td><%=article.getCoin_use() %></td><td><%=article.getCoin_date() %></td><td><%=article.getCoin_total() %></td></tr>
		<%} %>
	</table>
</body>
</html>