<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<meta charset="UTF-8">
<title>myshop/item_order_mng.jsp</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<aside class="side">
				<ul class="side-list">
					<li>
				  <a class="nav-link active" aria-current="page" href="ProductMyshop.shop">내 상점</a>
				  <a class="nav-link" href="ItemUploadForm.shop">상품 등록</a>
				  <a class="nav-link" href="ItemMng.shop">상품 관리</a>
				  <a class="nav-link" href="ItemReviewMng.shop">상품 후기 관리</a>
				  <a class="nav-link" href="ItemOrdMng.shop">상품 주문 관리</a>
				  <a class="nav-link" href="follow_shop.jsp">팔로우 상점</a>
				  </li>
			  </ul>
			</aside>
	<hr>

	<h3>상품 주문 관리</h3>
	
	<hr>
	
	<!-- 
	판매 중('0')
	구매 진행 중 ('1') : ord 테이블 insert할 때
	구매 완료 ('2') : ord 테이블 delete할 때
	예약 중('3')
	 -->


<table class="table table-hover">
    <tr>
      <th scope="col">주문일시</th>
      <th scope="col">주문상품</th>
      <th scope="col">주문수량</th>
      <th scope="col">주문한 사람</th>
      <th scope="col">가격</th>
      <th scope="col">주문 요청사항</th>
    </tr>
  <tbody>
	 <tr class="table-primary">
      <th scope="row">Primary</th>
  <c:forEach items="${ordList }" var="ord"></c:forEach>
      <td>${ord.get('ord_date') }</td>
      <td>${ord.get('item_title') }</td>
      <td>${ord.get('ord_quantity') }</td>
      <td>${ord.get('member_id') }</td>
      <td>${ord.get('item_price') }</td>
      <td>${ord.get('ord_reqContent') }</td>
    </tr>
    </tbody>
    </table>


	
	<h3>구매 진행중</h3>
	<div>
		<table border="1">
			<tr>
				<th>주문일시</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문한 사람</th>
				<th>가격</th>
				<th>주문 요청사항</th>
			</tr>
			<c:forEach items="${ordList }" var="ord">
				<tr>
					<td>${ord.get('ord_date') }</td>
					<td>${ord.get('item_title') }</td>
					<td>${ord.get('ord_quantity') }</td>
					<td>${ord.get('member_id') }</td>
					<td>${ord.get('item_price') }</td>
					<td>${ord.get('ord_reqContent') }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<hr>
	
	<h3>구매 완료</h3>
	<div>
		<table border="1">
			<tr>
				<th>주문일시</th>
				<th>주문상품</th>
<!-- 				<th>주문수량</th> -->
				<th>주문한 사람</th>
				<th>가격</th>
				<th>주문 요청사항</th>
			</tr>
			<c:forEach items="${finishOrdList }" var="ord">
				<tr>
					<td>${ord.get('ord_date') }</td>
					<td>${ord.get('item_title') }</td>
<%-- 					<td>${ord.get('ord_quantity') }</td> --%>
					<td>${ord.get('member_id') }</td>
					<td>${ord.get('item_price') }</td>
					<td>${ord.get('ord_reqContent') }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>