<%@page import="vo.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String sId = (String)session.getAttribute("sId");
ArrayList<ArrayList<String>> articleList = (ArrayList<ArrayList<String>>)request.getAttribute("articleList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$("#deleteFollowing").on({
// 			click: function() {
// 				$.ajax({
// 					type:"POST",
// 					url:"mypageDeleteFollowing.mypage",
<%-- 					data:{"sId" : <%=sId%>} --%>
// 					dataType: "text",
// 					success:function() {
						
// 					}
// 				});
// 			}
// 		}
// 	});

function askDeleteFollowing() {
	let returnValue = confirm("팔로우를 취소하시겠습니까?");
	let shop_idx = document.getElementById("deleteFollowing").value;
	
	
	if(returnValue == true) {
		location.href='mypageDeleteFollowing.mypage?shop_idx=' + shop_idx + '&sId=' + <%=sId%>;
	}
}
</script>
</head>
<body>

	
	<h1>팔로잉</h1>
	<hr>
	<section>
		<h3>총 n 개의 상점</h3>
		<form action="" method="get">
			<input type="text" placeholder="상점 이름 검색"> 
			<button>검색</button>
		</form>
		
	</section>
		<section>
		<%for(ArrayList<String> article : articleList) { %>
		<table border="1">
			<tr>
			<!-- 	0 -> shop_idx / 1 -> shop_img  / 2-> shop_name / 3->shop_content -->
				<td rowspan="2"><%=article.get(1) %></td>
				<td><%=article.get(2) %></td>
				<td rowspan="2">img1</td>
				<td rowspan="2">img2</td>
				<td rowspan="2">img3</td>
				<td rowspan="2"><button onclick="askDeleteFollowing()" id="deleteFollowing" value="<%=article.get(0) %>">하트</button></td>
			</tr>

			<tr><td><%=article.get(3) %></td></tr>
		</table>
		<%} %>
	</section>
	
	
</body>
</html>