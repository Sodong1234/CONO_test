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
	
	<h1>장바구니</h1>
	<form action="">
		<table border="1">
		<tr>
				<td><input type="checkbox"> 전체 선택</td>
				<td>상품 이미지</td>
				<td>상품 제목</td>
				<td>요청사항(결정x)</td>
				<td>상품 가격</td>
				<td>삭제</td>
			</tr>
		<%for(ArrayList<String> article : articleList) { %>
			<tr>
				<td><input type="checkbox" name="">선택</td>
				<td><%=article.get(1) %></td>
				<td><%=article.get(2) %></td>
				<td>요청사항(결정x)</td>
				<td><%=article.get(3) %></td>
				<td><button onclick="location.href='MypageBasketDelete.mypage?item_idx=<%=article.get(0) %>'">삭제<%=article.get(0) %></button></td>
			</tr>
			<%} %>
		</table>
		<input type="submit" value="구매하기">
	</form>
	
	
</body>
</html>