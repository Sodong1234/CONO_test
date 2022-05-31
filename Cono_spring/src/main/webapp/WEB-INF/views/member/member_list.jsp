<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th><th>이름</th><th>아이디</th><th>E-Mail</th><th>성별</th><th>가입일</th>
		</tr>
		<%-- JSTL 의 forEach 문을 사용하여 Model 객체에 저장된 List<MemberVO> 객체(memberList) 반복 --%>
		<%-- c:forEach var="변수명" items="${데이터저장객체명} --%>
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${member.idx }</td>
				<td>${member.name }</td>
				<td>${member.id }</td>
				<td>${member.email }</td>
				<td>${member.gender }</td>
				<td>${member.date }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

















