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
	
	<h1>최근 본 상품</h1>
	<hr>
	<c:forEach var="recentView" items="${recentViewList }">
		<table border="1" onclick="location.href='itemDetail?item_idx=${card.item_idx}'">
			<tr>
				<td>${recentView.item_idx }</td>
				<td>${recentView.img_real_name }</td>
				<td>${recentView.item_title }</td>
				<td>${recentView.item_region }</td>
				<td>${recentView.item_price }</td>
			</tr>
		</table>
	</c:forEach>
	
	<div class="clear">
 		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
	
</body>
</html>