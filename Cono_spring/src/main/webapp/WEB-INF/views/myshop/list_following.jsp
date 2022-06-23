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
<style type="text/css">
section {
	margin-left:370px;
	margin-right: 300px;
}

.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
}

hr.hr-13 {
  height: 10px;
  border: 0;
  box-shadow: 0 10px 10px -10px #8c8c8c inset;
  width: 1250px;
  margin-left: 370px;
  
}

@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{
 font-family: 'IBMPlexSansKR-Regular';
}


</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
	
	
		<h2 style="font-family: Cafe24Ohsquare; margin-left:370px;"> 팔로우/팔로잉 상점</h2>

		<hr class="hr-13">
		
	
	<section>
		<nav class="navstyle">
			<a href="follow" class="activefollow">팔로우 상점</a>
			<a href="following" class="activefollower">팔로워 상점</a>
		</nav>
		<c:forEach var="follow" items="${followingList }">
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
		</c:forEach>
	</section>

<!-- 푸터 -->
	<div class="clear">
 		<jsp:include page="../header_footer/footer.jsp" />
	</div>

</body>
</html> 