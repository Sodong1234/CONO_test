<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
// 	$(document).ready(function(){
// 		let 
// 	})
	$(function(){
		$("#deleteFollowing").on("click", function(){
			$.ajax({
				type: "GET",
				url : "deleteFollowing?shop_idx=" + document.getElementById("deleteFollowing").value,
				dataType: "text"
			});
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<h1>팔로잉하는 상점</h1>
	<section>
	<h3>총 ${followingCount } 개의 상점</h3>
<!-- 		s.shop_idx, s.shop_img, s.shop_name, s.shop_content -->
	</section>
	<section id="following">
		<c:forEach var="following" items="${followingList }">
			<table border="1">
				<tr>
					<td rowspan="2">${following.shop_idx }</td>
					<td rowspan="2">${following.shop_img }</td>
					<td rowspan="2">${following.shop_name }</td>
					<td rowspan="2">${following.shop_content }</td>
					<td rowspan="2"><button onclick="deleteFollowing()" id="deleteFollowing" value="${following.shop_idx }">팔로잉</button></td>
				</tr>
			</table>
		</c:forEach>
	</section>

	<h1>팔로워 상점</h1>
	<section>
	<h3>총 ${followerCount } 개의 상점</h3>
	</section>
	<section>
		<c:forEach var="follower" items="${followerList }">
			<table border="1">
				<tr>
					<td rowspan="2">${follower.shop_idx }</td>
					<td rowspan="2">${follower.shop_img }</td>
					<td rowspan="2">${follower.shop_name }</td>
					<td rowspan="2">${follower.shop_content }</td>
					<td rowspan="2"><button onclick="deleteFollowing()" id="deleteFollowing" value="">차단</button></td>
				</tr>
			</table>
		</c:forEach>
	</section>


</body>
</html>