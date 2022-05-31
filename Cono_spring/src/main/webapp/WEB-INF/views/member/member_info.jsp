<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 상세정보</h1>
	<table border="1">
		<%-- Model 객체로 전달받은 MemberVO 객체(member)에 접근하여 데이터 출력 --%>
		<tr>
			<td>이름</td>
			<td>${member.name }</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>${member.id }</td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${member.gender }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td>
		</tr>
	</table>
</body>
</html>