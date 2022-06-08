<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
String[] myShopCountInfo = (String[])request.getAttribute("myShopCountInfo");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myShop/my_page.jsp</title>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="ItemOrdMng.shop">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<hr>
	<div id="shopInfo">
		<form action="ProductMyshopModifyForm.shop" name="shopForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="shop_idx" value="${myShop.get('shop_idx') }">
			<table border="1">
				<tr>
					<td class="td_left"><label for="shop_idx">상점번호</label></td>
					<td class="td_right">
						<input type="text" name="shop_idx" value="${myShop.get('shop_idx') }">
					</td>
				</tr>
				<tr>
					<td id="img" style="width:100px;">
						<c:choose>
							<c:when test="${myShop.get('shop_img') eq null }">
								<img alt="상점 이미지" src="<spring:url value='/resources/default_img.png'/>">
							</c:when>
							<c:when test="${myShop.get('shop_img') ne null }">
								<img alt="상점 이미지" src="<spring:url value='/resources/upload/shopImg/${myShop.get("shop_img") }'/>">
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="member_id">판매자이름</label></td>
					<td class="td_right">
						${myShop.get('member_id') }
					</td>
				</tr>
			
				<tr>
					<td class="td_left"><label for="shop_name">상점이름</label></td>
					<td class="td_right">
						${myShop.get('shop_name') }
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_content">내용</label></td>
					<td class="td_right">
						${myShop.get('shop_content') }
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_sellNum">판매횟수</label></td>
					<td class="td_right">
						<%=myShopCountInfo[0] %>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_item">상품 갯수 </label></td>
					<td class="td_right"><%=myShopCountInfo[1] %></td>
				</tr>
				<tr>
					<td class="td_left"><label for="follower">팔로워 </label></td>
					<td class="td_right">x명</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_openDate">상점 오픈일 </label></td>
					<td class="td_right">${myShop.get('member_date') }</td>
				</tr>
			</table>
			<input type="button" id="modify" value="수정" onclick="location.href='ProductMyshopModifyForm.shop'">
		</form>
	</div>
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>