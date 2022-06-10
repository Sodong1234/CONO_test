<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1>회원 정보 삭제</h1>
	<table border="1">
		<tr><th>보유 코인</th><td>${coin_total } c</td><tr>
		<tr><th>탈퇴 하시겠습니까?</th><td><button onclick="">탈퇴</button></td><tr>
	</table>

	<div class="clear">
 		<jsp:include page="../header_footer/bottom.jsp" />
	</div>	
</body>
</html>