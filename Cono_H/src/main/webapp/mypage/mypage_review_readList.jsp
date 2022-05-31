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
	
	
	<h1>내가 쓴 구매후기</h1>
	
	<section>
		<table border="1">
			<tr><td>번호</td><td>상품이미지</td><td>상품명</td><td>평점</td><td>후기 내용</td><td>작성일</td></tr>
				<tr><td>1</td><td>im1</td><td>코노</td><td>★★★★★</td><td>우리팀 너무 좋아서 팀장 좋아 죽어버렸~</td><td>0511</td></tr>
		</table>
	</section>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>