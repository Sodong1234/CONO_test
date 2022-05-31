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
	
	<h1>구매 후기 쓰기</h1>
	
	<section>
		<table border="1">
			<tr>
				<td rowspan="2">상품 이미지</td>
				<td>상품 이름</td>
			</tr>
			<tr>
				<td>판매자</td>
			</tr>
			<tr>
				<td colspan="2">별점 ★★★★★</td>
			</tr>
			<tr><td colspan="2">후기를 적어주세요~</td></tr>
			<tr><td colspan="2"><textarea rows="20" cols="50" placeholder="여기 후기 내용"></textarea> </td></tr>
		</table>
	</section>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>	
</body>
</html>