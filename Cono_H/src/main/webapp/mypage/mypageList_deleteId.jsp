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
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<h1>회원 정보 삭제</h1>
	<table border="1">
		<tr><th>보유 코인</th><td>1000000</td><tr>
		<tr><th>진짜 탈퇴 할거임?</th><td><button onclick="../main/main.jsp">탈퇴</button></td><tr>
	</table>

	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>	
</body>
</html>