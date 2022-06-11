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
	<section>
		<nav class="navstyle">
			<a class="activefollow">팔로우 상점</a>
			<a href="list_follower.jsp" class="activefollower">팔로워 상점</a>
		</nav>
<%-- 		<c:forEach var="follow" items="${followingList }"> --%>
			<div class="follow">
			<p><strong style="font-weight: bold;">${followingCount }명</strong>의 상점을 팔로우 중입니다. </p>
				<ul class="shop-list">
				<li class="following-shop-container">
					<div class="shop-profile-area">
						<div class="shop-thumbnail" style="background-image: ${following.shop_img }">
						</div>
						<div class="shop-profile" >
							<div class="text-area">
								<h2 class="shop-name">${following.shop_name }테스트</h2>
								<p class="shop-introduce">${following.shop_content }테스트</p>
							</div>
							<button onclick="deleteFollowing()" class="cancleFollowing" id="deleteFollowing">
								<i class="idus-icon-check" style="font-size: 12px;"></i>언팔로잉
							</button>
						</div>
					</div>
				</ul>
			</div>
<%-- 		</c:forEach> --%>
	</section>
	


</body>
</html>