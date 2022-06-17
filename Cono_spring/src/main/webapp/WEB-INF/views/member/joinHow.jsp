<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>member/login.jsp</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<style>
* {
	text-align: center;
	padding-top: 30px;
}

body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: -moz-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: -o-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: linear-gradient(to top right, #CFFFE5 0%, #6EB4B5 100%);
}

</style>
<body>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<div class="container" id="wrap">
		<div id="sub_img_member"></div>
		<h1>CONO</h1>
		<fieldset>
			<div class="btn-group-vertical">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=f9f5f6880f6e92a9e2fabbf34781366d&redirect_uri=http://localhost:8080/cono/kakao_callback&response_type=code"><button class="btn btn-warning" name="kakao">카카오톡으로 가입</button></a>
				<button class="btn btn-success" name="naver">네이버로 가입</button>
				<button class="btn btn-primary" name="normal" 
				onclick="location.href='join'">기본 가입</button>	    
				<br>
				<!--  -->
			</div>
		</fieldset>
	</div>
</body>
</html>