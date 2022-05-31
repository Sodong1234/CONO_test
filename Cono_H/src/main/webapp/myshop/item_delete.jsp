<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<div>
		<h3>상품 삭제</h3>
		<hr>
		<form action="ItemDeletePro.shop">
			<input type="hidden" name="item_idx" value="<%=request.getParameter("item_idx")%>">
			<input type="text" name="member_id" placeholder="아이디를 입력하세요"><br>
			<input type="password" name="member_pass" placeholder="패스워드를 입력하세요"><br>
			<input type="submit" value="삭제하기" onclick="confirm('상품을 삭제 하시겠습니까?')">
		</form>
	</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>