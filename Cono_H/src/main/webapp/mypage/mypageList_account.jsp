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
	
	<form action="">
		<h1>계좌정보</h1>
		<input type="text" placeholder="예금주 입력">
		<input type="text" placeholder="계좌번호 입력">
	  	<input type="submit" value="확인">
	</form>
	
	
	<br>
	<h3>API 쓸거임</h3>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>	
</body>
</html>