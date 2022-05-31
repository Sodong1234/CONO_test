<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"></jsp:include>
		  
		  <div id="sub_img_member"></div>
		  	<h1>아이디, 비밀번호 찾기</h1>
		  	<br>
		  	<form action="#" method="post" id="join">
		  		<fieldset>
		  			<legend>아이디</legend>
		  			<input type="text" name="id" placeholder="가입시 입력한 전화번호"><input type="button" value="인증번호 보내기"><br>
		  			<input type="text" name="id" placeholder="인증번호 입력"><input type="button" value="인증">
				</fieldset>		  
				<br>			
				<fieldset>
		  			<legend>비밀번호</legend>
		  			<input type="text" name="id" placeholder="가입시 입력한 아이디"><br>
		  			<input type="text" name="email" placeholder="이메일주소 입력"><input type="button" value="인증번호 보내기"><br>
		  			<input type="text" name="id" placeholder="인증번호 입력"><input type="button" value="인증">
		  		</fieldset>		  
				
		  	</form>
		<jsp:include page="../HeaderFooter/bottom.jsp"></jsp:include>
	</div>
</body>
</html>


