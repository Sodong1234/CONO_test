<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_review_mng.jsp</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<hr>
	
	<div>
		<h3>상품 후기 관리</h3>
		<span>평점 평균</span>
		<table>
		<!-- 막대 표현 어떻게 할지 고민..!! -->
			<tr>
				<td>5점</td>
				<td>------------(막대기..)</td>
			</tr>
			<tr>
				<td>4점</td>
				<td>---------(막대기..)</td>
			</tr>
			<tr>
				<td>3점</td>
				<td>--------(막대기..)</td>
			</tr>
			<tr>
				<td>2점</td>
				<td>-------(막대기..)</td>
			</tr>
			<tr>
				<td>1점</td>
				<td>--(막대기..)</td>
			</tr>
		</table>
		<div style="width:100px;height:100px;border:1px solid black" onclick="location.href='item_detail.jsp'">상품 이미지(전체 후기일 경우 빈칸)<br>누르면 상품 상세로 이동</div>
	</div>
	
	<div>
		<table>
			<!-- 페이징 처리 처럼 옆으로 누르면 넘어가는 방식(한 칸씩 이동..! 부드럽게) -->
			<!-- URL 파라미터로 구분(상품 번호?) -->
			<tr>
				<td><<</td>
				<td onclick="location.href='item_review_mng.jsp'">상품 1 이미지</td>
				<td onclick="location.href='item_review_mng.jsp'">상품 2 이미지</td>
				<td onclick="location.href='item_review_mng.jsp'">상품 3 이미지</td>
				<td onclick="location.href='item_review_mng.jsp'">상품 4 이미지</td>
				<td onclick="location.href='item_review_mng.jsp'">상품 5 이미지</td>
				<td>>></td>
			</tr>
		</table>
	</div>
	
	<hr>
	
	<div>
		<!-- URL 파라미터로 구분(sort) -->
		추천순&nbsp;최신순&nbsp;평점순
		<table>
			<tr>
				<td>
					★★★★☆<br>
					제목<br>
					내용<br>
				</td>
				<td>
					작성자 / 코노페이
				</td>
			</tr>
			<tr>
				<td>
					★★★★☆<br>
					제목<br>
					내용<br>
				</td>
				<td>
					작성자 / 계좌 입금
				</td>
			</tr>
		</table>
	</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>