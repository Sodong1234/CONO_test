<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/upload_item.jsp</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
	</div>
	<!------ 상단 바 ------>
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
	<!-- ---------------- -->
	
	<!-------- 본문 -------->
	<h1>상품 등록</h1>
	<div>
		<hr>
		<form action="item_mng.jsp">
			<table border="1">
				<tr>
					<th>상품 이미지</th>
					<td><!-- 파일 첨부 --></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="item_subject" placeholder="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
						<select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
						<select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td><!-- 우편번호 API 사용 --></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="item_price" placeholder="가격을 입력하세요."> 원</td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td><textarea placeholder="상품 소개를 입력하세요. (2000자)"></textarea></td>
				</tr>
				<tr>
					<th>결제 방식</th>
					<td>
						<select>
							<option>만나서 현금 결제</option>
							<option>계좌 입금</option>
							<option>코노페이</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록하기"></td>
				</tr>
			</table>
		</form>
	</div>
		<!---------------------->
</body>
</html>