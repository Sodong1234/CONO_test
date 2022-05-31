 <%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ArrayList<String>> articleList = (ArrayList<ArrayList<String>>)request.getAttribute("articleList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>쿠폰</h1>
	<table border="1">
		<tr><th colspan="3">사용가능한 쿠폰</th></tr>
		<%for(ArrayList<String> article : articleList) { %>
		<tr><td>쿠폰 이름</td><td>할인 금액</td><td>유효 기간</td></tr>
		<tr><td><%=article.get(0) %></td><td><%=article.get(1) %></td><td></td></tr>
		
		<%} %>
	</table>
</body>
</html>