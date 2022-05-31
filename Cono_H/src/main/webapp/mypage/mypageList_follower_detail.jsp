<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ArrayList<String>> articleList = (ArrayList<ArrayList<String>>)request.getAttribute("articleList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function askDeleteFollower() {
	let returnValue = confirm("팔로워를 차단하시겠습니까?")
	
	if(returnValue == true) {
		location.href='mypageDeleteFollower.mypage';
	}
}
</script>
</head>
<body>

	
	<h1>팔로워</h1>
	<hr>
	<section>
		<h3>총 n 개의 상점</h3>
		<input type="text" placeholder="상점 이름 검색">
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
				<td rowspan="2"><button onclick="askDeleteFollower()" value="<%=article.get(0)%>">차단</button></td>
			</tr>

			<tr><td><%=article.get(3) %></td></tr>
		</table>
		<%} %>
	</section>

		
</body>
</html>