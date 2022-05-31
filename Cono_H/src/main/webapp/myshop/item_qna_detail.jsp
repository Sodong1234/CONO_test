<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="upload_item.jsp">상품 등록</a></li>
			<li><a href="item_mng.jsp">상품 관리</a></li>
			<li><a href="item_qna_mng.jsp">상품 문의 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<div>
		<h1>문의 글 상세</h1>
		<table border="1">
			<tr>
				<th>글 번호</th>
				<td>1</td>
				<td colspan="2">문의 제목</td>
				<td>작성자</td>
				<td>2022.05.22</td>
			</tr>
			<tr>
				<th>문의유형</th>
				<td>배송</td>
				<th>상품 이름</th>
				<td>머시기머시기</td>
				<th>상품 번호</th>
				<td>22</td>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td colspan="5">문 의 내 용 ~~</td>
			</tr>
		</table>
	</div>
	
	<div>
		<h1>문의 답변 작성</h1>
		<!-- 답변 완료로 이동 -->
		<form action="item_qna_mng.jsp">
			<textarea placeholder="내용을 입력해주세요"></textarea>
			<input type="submit" value="등록하기">
		</form>
	</div>
</body>
</html>