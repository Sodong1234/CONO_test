<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::비밀번호 확인</title>
</head>
<body>
		<div id="wrap">
			<jsp:include page="../header_footer/header.jsp"></jsp:include>
		<div class=conocontainer style="position: relative; left: 300px; top:50px;">
			  <div id="sub_img_member"></div>
			  <h3 style="margin-top: 150px;">개인정보 보호를 위하여 비밀번호를 재확인합니다.</h3><br><br><br>
			  		<form action="passCheck" method="post">
			  		비밀번호 : <input type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요." style="width: 202px;"><br>
			  		<input type="submit" value="확인">
			  		</form>
		</div>
		</div>
		
		<footer style="position: relative; top: 300px;">	
			<jsp:include page="../header_footer/footer.jsp"></jsp:include>
		</footer>
</body>
</html>


