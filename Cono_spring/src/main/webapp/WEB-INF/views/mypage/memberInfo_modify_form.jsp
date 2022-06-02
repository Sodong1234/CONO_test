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
	<form action="modify">
		<h1>회원정보수정</h1>
			<fieldset>
			<legend>회원 정보</legend>
			<label>아이디</label><br>
				<input type="email" name="id" id="id" readonly="readonly" value="idididid" ><br>
			<label>비밀번호</label><br>
				<input type="password" name="pass" id="pass" required="required" placeholder="영문 + 숫자 + 특수문자 8자 이상">
			<br>							
			<label>이메일</label><br>
				<input type="email" name="email" id="email" required="required" placeholder="이메일을 입력해주세요">
			<br>
			<label>이름</label><br> 
				<input type="text" name="name" id="name" required="required" placeholder="이름을 입력해주세요"><br> 
			<label>닉네임</label><br>
				<input type="text" name="nick" id="nick" required="required" placeholder="닉네임을 입력해주세요"><br> 
			<label>전화번호</label><br>
			<input type="number" name="number" id="number" required="required" placeholder="전화번호입력"><input type="button" value="인증요청"><br>
			<input type="number" name="number" id="number" required="required" placeholder="인증번호"><input type="button" value="확인"><br>
		</fieldset>
	</form>
	
	
	<div class="clear">
 		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
	
</body>
</html>