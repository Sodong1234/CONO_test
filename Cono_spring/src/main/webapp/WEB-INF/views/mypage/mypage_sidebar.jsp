<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/style.css" rel="stylesheet" />
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<div class="plus2">
		<div class="inner-w layout-split">
			<aside class="my-info" style="position: relative; left: 100px; bottom: 60px;">
				<div class="profile-area">
					<div class="outline">
						<label> 
							<img data-profile="image" src="${path }/resources/img/coupon.png" class="img-bg profile-img">
							<input type="file" name="image" id="profile-image" class="profile-image-input" accept=".png, .jpg, .jpeg"> 
							<a href="#" data-modal-trigger="modal-link" data-modal-id="modal-profile"
							class="profile-modal-open" style="visibility: hidden"></a>
						</label>
					</div>
					<div class="area-txt">
						<a><span>아기손</span></a> <strong>양윤석</strong>
					</div>
				</div>
				<div style="background: #f5f5f5; text-align: center; display: none;"></div>
					<div class="my-menu">
						<em>My Menu</em>
						<nav class="sidenav">
							<b></b>
							<ul class="main-buttons">
								<li><a href="readReviewList">나의 후기</a></li>
								<li><a href="#">메시지</a></li>
								<li><a href="coin">코인</a></li>
								<li><a href="coupon">쿠폰</a></li>
								<li><a href="memberInfo_modify">회원 정보 수정</a></li>
								<li><a href="accountInfo">계좌 정보 관리</a></li>
								<li><a href="delete_id">회원 탈퇴</a></li>
							</ul>
						</nav>
					</div>
			</aside>
		</div>
	</div>
</body>
</html>