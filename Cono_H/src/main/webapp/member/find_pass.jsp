<%@page import="vo.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDTO member = (MemberDTO)request.getAttribute("dtoPass");

%>    
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
		  	<h3>회원님의 비밀번호는 <%=member.getMember_pass() %> 입니다.</h3>
		  <input type="button" value="로그인" onclick="location.href='login.jsp'">
		  	
		<jsp:include page="../HeaderFooter/bottom.jsp"></jsp:include>
	</div>
</body>
</html>


