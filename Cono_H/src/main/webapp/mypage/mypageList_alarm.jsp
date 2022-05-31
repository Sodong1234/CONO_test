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
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<h1>알림</h1>
	
	<section>
		<table border="1">
			<tr><td rowspan="2">로고</td><td width="200">제목</td><td>시간</td></tr>
			<tr><td width="200">내용</td><td></td></tr>
		</table>	
		<table border="1">
			<tr><td rowspan="2">로고</td><td width="200">제목</td><td>시간</td></tr>
			<tr><td width="200">내용</td><td></td></tr>
		</table>
		<table border="1">
			<tr><td rowspan="2">로고</td><td width="200">제목</td><td>시간</td></tr>
			<tr><td width="200">내용</td><td></td></tr>
		</table>
	</section>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>	
</body>
</html>