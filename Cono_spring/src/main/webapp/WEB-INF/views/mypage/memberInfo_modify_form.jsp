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
	<form action="memberInfo_modify" method="post">
		<h1>회원정보수정</h1>
			<fieldset>
			<legend>회원 정보</legend>
			<label>닉네임</label><br>
				<input type="text" name="member_nick" id="id" required="required" value="${member.member_nick }" ><br>
			<label>비밀번호</label><br>
				<input type="password" name="member_pass" id="pass" required="required" value="${member.member_pass }" placeholder="영문 + 숫자 + 특수문자 8자 이상">
			<br>							
			<label>이메일</label><br>
				<input type="email" name="member_email" id="email" required="required" value="${member.member_email }" placeholder="이메일을 입력해주세요">
			<br>
			<label>전화번호</label><br>
			<input type="number" name="member_phone" id="number" required="required" value="${member.member_phone }" placeholder="전화번호입력"><input type="button" value="인증요청"><br>
			<input type="number" name="number" id="number" required="required" placeholder="인증번호"><input type="button" value="확인"><br>
			<input type="submit" value="수정">
		</fieldset>
	</form>
	
	
	<div class="clear">
 		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
	
</body>
</html>