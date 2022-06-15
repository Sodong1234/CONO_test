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
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	
	<h1>내가 쓴 구매후기</h1>
	
	<section>
		<table border="1">
			<tr><td>번호</td><td>상품이미지</td><td>상품명</td><td>평점</td><td>후기 내용</td><td>작성일</td></tr>
		</table>
	</section>
	
	<div class="clear">
 		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>