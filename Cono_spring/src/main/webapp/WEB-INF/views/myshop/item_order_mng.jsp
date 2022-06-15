<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<meta charset="UTF-8">
<title>myshop/item_order_mng.jsp</title>
<style type="text/css">

 table {  
 

 text-align: center;
/*  width: 70%;  */
 margin: auto; 

  }   


h3 {

 text-align: center;
/*  width: 70%;  */
 margin: auto; 


}


</style>
</head>



<body>



	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		
	<hr>

	
	
	<hr>
	
	<!-- 
	판매 중('0')
	구매 진행 중 ('1') : ord 테이블 insert할 때
	구매 완료 ('2') : ord 테이블 delete할 때
	예약 중('3')
	 -->

<h3>구매 진행중 ▼</h3>
<table class="table table-hover" style="border:1px 0;border-color:bg-primary; width: 1090px;">
    <tr>
      <th scope="col">주문일시</th>
      <th scope="col">주문상품</th>
      <th scope="col">주문수량</th>
      <th scope="col">주문한 사람</th>
      <th scope="col">가격</th>
      <th scope="col">주문 요청사항</th>
    </tr>
  <tbody>
  <c:forEach items="${ordList }" var="ord">
	 <tr class="table-primary">
<!--       <th scope="row">Primary</th> -->
      <td>${ord.get('ord_date') }</td>
      <td onclick="location.href='ItemDetail.shop?item_idx=${item.get('item_idx') }'"${item.get("item_title") }>${ord.get('item_title') }</td>
      <td>${ord.get('ord_quantity') }</td>
      <td>${ord.get('member_id') }</td>
      <td>${ord.get('item_price') }</td>
      <td>${ord.get('ord_reqContent') }</td>
    </tr>
    </c:forEach>
    </tbody>
    
    </table>


	
<!-- 	<h3>구매 진행중</h3> -->
<!-- 	<div> -->
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<th>주문일시</th> -->
<!-- 				<th>주문상품</th> -->
<!-- 				<th>주문수량</th> -->
<!-- 				<th>주문한 사람</th> -->
<!-- 				<th>가격</th> -->
<!-- 				<th>주문 요청사항</th> -->
<!-- 			</tr> -->
<%-- 			<c:forEach items="${ordList }" var="ord"> --%>
<!-- 				<tr> -->
<%-- 					<td>${ord.get('ord_date') }</td> --%>
<%-- 					<td>${ord.get('item_title') }</td> --%>
<%-- 					<td>${ord.get('ord_quantity') }</td> --%>
<%-- 					<td>${ord.get('member_id') }</td> --%>
<%-- 					<td>${ord.get('item_price') }</td> --%>
<%-- 					<td>${ord.get('ord_reqContent') }</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->

<h3>구매 완료 ▼</h3>
<table class="table table-hover" style="border:1px 0;border-color:bg-primary; width: 1080px;"">
    <tr>
      <th scope="col">주문일시</th>
      <th scope="col">주문상품</th>
<!--       <th scope="col">주문수량</th> -->
      <th scope="col">주문한 사람</th>
      <th scope="col">가격</th>
      <th scope="col">주문 요청사항</th>
    </tr>
  <tbody>
  <c:forEach items="${finishOrdList }" var="ord">
	 <tr class="table-primary">
<!--       <th scope="row">Primary</th> -->
      <td>${ord.get('ord_date') }</td>
      <td>${ord.get('item_title') }</td>
<%--       <td>${ord.get('ord_quantity') }</td> --%>
      <td>${ord.get('member_id') }</td>
      <td>${ord.get('item_price') }</td>
      <td>${ord.get('ord_reqContent') }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
	
	<hr>
	
<!-- 	<h3>구매 완료</h3> -->
<!-- 	<div> -->
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<th>주문일시</th> -->
<!-- 				<th>주문상품</th> -->
<!-- 				<th>주문수량</th> -->
<!-- 				<th>주문한 사람</th> -->
<!-- 				<th>가격</th> -->
<!-- 				<th>주문 요청사항</th> -->
<!-- 			</tr> -->
<%-- 			<c:forEach items="${finishOrdList }" var="ord"> --%>
<!-- 				<tr> -->
<%-- 					<td>${ord.get('ord_date') }</td> --%>
<%-- 					<td>${ord.get('item_title') }</td> --%>
<%-- 					<td>${ord.get('ord_quantity') }</td> --%>
<%-- 					<td>${ord.get('member_id') }</td> --%>
<%-- 					<td>${ord.get('item_price') }</td> --%>
<%-- 					<td>${ord.get('ord_reqContent') }</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>