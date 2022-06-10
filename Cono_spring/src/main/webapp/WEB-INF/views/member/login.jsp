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
		  	<h1>로그인</h1>

		  	<br>
		  	간편로그인<br>
		  	<input type="button" value="카카오톡으로 로그인" onclick="loginWithKakao()"><br>
		  	<input type="button" value="네이버로 로그인">
		  	<form action="login" method="post" id="login">
		  		<fieldset>
		  			<legend>일반 로그인</legend>
		  			<input type="text" name="member_id" placeholder="Username"><br>
		  			<input type="password" name="member_pass" placeholder="password"><br>
		  			<a href="./forget.jsp">아이디 또는 비밀번호를 잊어버리셨나요?</a>
		  		</fieldset>
		  			<input type="submit" value="로그인"><br>
		  			<input type="checkbox" name="1" value="저장" checked="checked">아이디 저장<br>
		  	</form>
	</div>
	
<!-- 	<div class="col-lg-12 text-center mt-3"> -->
<!-- 	    <button class="btn btn-block waves-effect waves-light btn-rounded btn-outline-info mb-3">로그인하기</button> -->
<%-- 	    <img alt="카카오로그인" src="${pageContext.request.contextPath}/resources/assets/img/kakao_login_medium_wide.png" onclick="loginWithKakao()"> --%>
<!-- 	</div> -->

	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	        Kakao.init('ba7288b045b93c0d30a7bd856da85d67');
	        Kakao.isInitialized();
	    });
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:8080/cono/' 
	        }); // 등록한 리다이렉트uri 입력
	    }
	</script>
</body>
</html>


