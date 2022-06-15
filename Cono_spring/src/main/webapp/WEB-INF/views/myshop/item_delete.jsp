<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<style>
div {
  width: 300px;
  margin: auto;
/*   border: 1px solid red; */
}
</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp"/>
	</div>

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		
		<div>
		
		<h3>상품 삭제</h3>
		<hr>
		<form action="ItemDeletePro.shop" method="post">
			<input type="hidden" name="item_idx" value="<%=request.getParameter("item_idx")%>">
			
			<div class="w3-panel w3-border w3-hover-border-blue">
			<input type="text" name="member_id" placeholder="아이디를 입력하세요"/>
			</div>
			
			
			<div class="w3-panel w3-border w3-hover-border-blue">
			<input type="password" name="member_pass" placeholder="패스워드를 입력하세요"><br>
			</div>
			
			<div class="w3-container">
			<input type="submit" class="w3-button w3-blue" value="삭제하기" onclick="confirm('상품을 삭제 하시겠습니까?')">
			</div>
		
		</form>
		
		</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>