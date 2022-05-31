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
		  <div id="sub_img_member"></div>
		  <h1>회원가입 방법 선택</h1>
		  		<fieldset>
		  			<input type="button" name="kakao" value="카카오톡으로 가입"><br>
		  			<input type="button" name="naver" value="네이버로 가입"><br>
		  			<input type="button" name="normal" value="다른방법 가입" onclick="location.href='MemberJoinForm.func'"><br>	
		  		</fieldset>
		  			이미 가입하셨다면? <a href="MemberLogin.func">바로 로그인하기</a><br>
	</div>
</body>
</html>


