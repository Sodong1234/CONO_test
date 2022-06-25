<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::팔로잉</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">
section {
	width: 100%;
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

.image {
	border-radius: 50px;
	overflow: hidden;
}
#list_following_wrap {
	width: 1040px;
	margin: 0 430px;
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
	<div id="list_following_wrap">
		<h2 style="font-family: Cafe24Ohsquare;"> 팔로잉/팔로워 상점</h2>

		<hr class="hr-13"  >
	
		<section>
			<nav class="navstyle">
				<a href="follow" class="activefollow">팔로잉 상점</a>
				<a href="following" class="activefollower">팔로워 상점</a>
			</nav>
			<p><strong style="font-weight: bold;">${followerCount }명</strong>이 내 상점을 팔로우 중입니다. </p>
			<c:forEach var="follower" items="${followerList }">
				<div class="follow">
				<ul class="shop-list">
					<li class="following-shop-container">
						<div class="shop-profile-area">
						
							<div class="shop-thumbnail" style="background-image: ${follower.shop_img }">
								<img class="image" src="${path }/resources/upload/shopImg/${follower.shop_img }">
							</div>
							<div class="shop-profile" >
								<div class="text-area">
									<h2 class="shop-name">${follower.shop_name }</h2>
									<p class="shop-introduce">${follower.shop_content }</p>
								</div>
								<button class="cancleFollowing" id="deleteFollowing" onclick="location.href='deleteFollowerShop?follow_shop_idx=${follower.shop_idx}'">
									<i class="idus-icon-check" style="font-size: 12px;"></i>언팔로우
								</button>
							</div>
						</div>
				</ul>
				</div>
			</c:forEach>
		</section>
	</div>
<!-- 푸터 -->
	<div class="clear">
 		<jsp:include page="../header_footer/footer.jsp" />
	</div>	
</body>
</html> 