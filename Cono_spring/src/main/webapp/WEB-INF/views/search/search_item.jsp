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
	<h1>${searchText } 검색</h1>
	<c:forEach var="card" items="${cardList }">
		<div>
			<table border="1">
				<tr>
					<td>${card.item_idx }</td>
					<td>${card.img_real_name }</td>
					<td>${card.item_title }</td>
					<td>${card.item_region }</td>
					<td>${card.item_price }</td>	
					<td>${card.item_date }</td>		
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>