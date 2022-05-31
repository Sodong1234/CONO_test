<%@page import="vo.MemberDTO"%>
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
		  <h3>개인정보 보호를 위하여 비밀번호를 재확인합니다.</h3>
		  		<form action="MypagePassPro.mypage">
		  		비밀번호 : <input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요."><br>
		  		<input type="submit" value="확인">
		  		</form>
		<jsp:include page="../HeaderFooter/bottom.jsp"></jsp:include>
	</div>
</body>
</html>


