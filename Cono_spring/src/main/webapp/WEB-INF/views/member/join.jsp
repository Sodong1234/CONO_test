<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp"></jsp:include>

		<div id="sub_img_member"></div>
		<nav id="sub_menu">
		</nav>
		<article>
			<h1>회원가입</h1>
			<form action="joinPost" method="post" id="join" name="fr">
				<fieldset>
					<legend>회원가입</legend>
					<label>아이디</label><br>
						<input type="text" name="member_id" id="id"  placeholder="아이디를 입력해주세요"><br>
					<label>비밀번호</label><br>
						<input type="password" name="member_pass" id="pass"  placeholder="영문 + 숫자 + 특수문자 8자 이상">
					<br>	
						<input type="password" name="pass" id="pass"  placeholder="비밀번호 확인"><br>
					<label>닉네임</label><br>
						<input type="text" name="member_nick" id="nick" placeholder="닉네임을 입력해주세요"><br> 
					<label>이메일</label><br>
						<input type="email" name="member_email" id="email" placeholder="이메일을 입력해주세요"><br>
					<label>생년월일</label><br>
						<input type="text" name="member_birth" id="birth" placeholder="닉네임을 입력해주세요"><br> 
					<label>전화번호</label><br>
						<input type="number" name="member_phone" id="phone" placeholder="전화번호입력"><input type="button" value="인증요청"><br>
						<input type="number" name="number" id=""  placeholder="인증번호"><input type="button" value="확인"><br>
					
				</fieldset>
				
					<input type="checkbox" name="1" value="모두동의" checked="checked">모두동의<br>
					<input type="checkbox" name="2" value="약관1" checked="checked">약관1<br>
					<input type="checkbox" name="3" value="약관2" checked="checked">약관2<br>
					<input type="checkbox" name="4" value="약관3" checked="checked">약관3<br>												

					<input type="submit" value="가입하기" class="submit"> 
			</form>
		</article>

		<div class="clear"></div>
		<jsp:include page="../header_footer/bottom.jsp"></jsp:include>
	</div>
</body>
</html>


