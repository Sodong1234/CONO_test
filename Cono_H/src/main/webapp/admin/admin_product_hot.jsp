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

<ul type="disc">
		<li><a href="admin_product.jsp" >상품관리</a></li>
		<li><a href="admin_product_hot.jsp" >인기품목관리</a></li>
</ul>


<h1>인기물품관리</h1>

 인기물품정렬	<select name="hot">
							<option value="조회순">조회순</option>
							<option value="찜순">찜순</option>
							</select>		<br>


<h3>BEST</h3>

<a href="admin_product_detail.jsp"><img src="1.jpg" width = "200" height ="200"></a>&nbsp;&nbsp; <a href="admin_product_detail.jsp"><img src="2.jpg" width = "200" height ="200"></a>&nbsp;&nbsp; <a href="admin_product_detail.jsp"><img src="3.jpg" width = "200" height ="200" ></a>&nbsp;&nbsp;<a href="admin_product_detail.jsp"><img src="4.jpg" width = "200" height ="200" ></a>

						
						<h5>페이지 넘기는 곳</h5>
						
						
					---------------------------------------------------	
						 
						 
						 ~ 차트 들어갈 곳 ~ 나중에 API 써서 ~


					
           			---------------------------------------------------	
			
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>



</body>
</html>