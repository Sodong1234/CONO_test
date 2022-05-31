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
	<h1>구매완료된 상품</h1>
	<section>
		<span>
			<input type="text" id="searchText" placeholder="상품명 입력">
			<input type="button" id="searchBtn" value="검색">
		</span>
		<span>
<!-- 			<select> -->
<!-- 				<option>날짜 순</option> -->
<!-- 				<option>가격 순</option> -->
<!-- 			</select> -->
		</span>
	</section>
	<section>
		<table border="1">
			<tr>
				<td>상품 명</td>
				<td>상품 이미지</td>
				<td>가격</td>
				<td>판매자</td>
				<td>지역</td>
				<td>구매 완료 날짜</td>
			</tr>
			<%for(ArrayList<String> article : articleList) { %>
			<tr>
				<td><%=article.get(2) %></td>
				<td><%=article.get(1) %></td>
				<td><%=article.get(4) %></td>
				<td><%=article.get(3) %></td>
				<td><%=article.get(5) %></td>
				<td><%=article.get(6) %></td>
			</tr>
			<%} %>
		</table>
	</section>
</body>
</html>