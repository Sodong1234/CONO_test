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
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>


	<nav id="left_menu">
			<ul>
				<li><a href="admin_notice_list.jsp">Notice</a></li>
				<li><a href="admin_product.jsp">product</a></li>
				<li><a href="admin_member.jsp">member</a></li>
				<li><a href="admin_qna_list.jsp">qna</a></li>
				<li><a href="admin_report.jsp">report</a></li>
			</ul>
		</nav>

<h1>상품관리 페이지</h1>

<ul type="disc">
		<li><a href="admin_product.jsp" >상품관리</a></li>
		<li><a href="admin_product_hot.jsp" >인기품목관리</a></li>
</ul>



<table border = "3" width ="700">

<caption>상품 관리 페이지 (관리자)</caption>



<thead>
<tr>
<th><input type="checkbox" name="ch" value="1" checked>전체선택</th>
<th>상품번호</th>
<th>상품정보</th>
<th>상품금액</th>
<th>거래진행상황</th>
<th>관리자용 수정/삭제</th>
</tr>
</thead>


<tbody>
<tr>
<td><input type="checkbox" name="ch" value="2"> 상품선택 </td>
<td><a href="admin_product_detail.jsp">1234</a></td>
<td><a href="admin_product_detail.jsp"><img src="1.jpg" width = "100" height ="100"></a></td>


<td><a href="admin_product_detail.jsp">10000원</a></td><td><a href="admin_product_detail.jsp">거래중</a></td>
<td><input type="button" value="수정" onclick="location.href='admin_product_modify.jsp'"><input type="button" value="삭제" onclick="location.href='admin_product_delete.jsp'"></td>
</tr> 

<tr>
<td><input type="checkbox" name="ch" value="3"> 상품선택 
<td><a href="admin_product_detail.jsp">12345</a></td>
<td><a href="admin_product_detail.jsp"><img src="2.jpg" width = "100" height ="100"></a></td>
<td><a href="admin_product_detail.jsp">20000원</a></td>
<td>거래완료</td><td><input type="button" value="수정" onclick="location.href='admin_product_modify.jsp'"><input type="button" value="삭제" onclick="location.href='admin_product_delete.jsp'"></td>
</tr>
</tbody>


</table>









	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>



</body>
</html>