<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <!DOCTYPE html> -->
<html>
<head>
<meta charset="UTF-8">
<title>CONO::결제하기</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	<form action="PayItem" method="post">
		<input type="hidden" name="ord_quantity" value="${ord_quantity }">
		<input type="hidden" name="item_price" value="${itemDetail.item_price }">
		<input type="hidden" name="item_idx" value="${itemDetail.item_idx }">
		<table border="1">
			<tr>
				<td>상품 이미지</td>
				<td>상품 제목</td>
				<td>요구사항</td>
				<td>구매수량</td>
				<td>상품 가격</td>
			</tr>
			<tr>
				<td
					onclick="location.href='itemDetail?item_idx=${itemDetail.item_idx}'">
					<c:choose>
						<c:when test="${item.getImg_name() != null}">
							<img src="resources/upload/file/${item.getImg_name() }">
							<br>
						</c:when>
					</c:choose>
				</td>
				<td
					onclick="location.href='itemDetail?item_idx=${itemDetail.item_idx}'">${itemDetail.item_title }</td>
				<td><textarea name="ord_reqContent" rows="" cols="" placeholder="요구사항 작성"></textarea></td>
				<td>${ord_quantity }</td>
<%-- 				<td>${itemDetail.item_price }</td> --%>
				<td><fmt:formatNumber value="${itemDetail.item_price }" pattern="\#,###.##"/></td>
			</tr>

		</table>
		<input type="submit" value="구매하기">
	</form>
</body>
</html>
