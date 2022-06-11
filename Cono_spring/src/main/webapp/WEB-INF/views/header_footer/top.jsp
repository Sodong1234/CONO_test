<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
String sId = (String) session.getAttribute("sId");
%>
<script type="text/javascript">
	function userCenterList() {
		// 		let state = document.getElementById("userCenterList").style.visibility;	
		// 		state = (state == "hidden") ? "visible" : "hidden";

		let userCenterList = document.getElementById("userCenterList");
		userCenterList.style.visibility = "visible";
	}
	// =========================양윤석==================================
	function confirmLogout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout";
		}
	}
	
	// =========================양윤석==================================
	//============== 가준 검색 ============
	function search_item() {
		let searchText = document.getElementById("searchText").value

		location.href = ("search_item?searchText=" + searchText);
	}
</script>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<head>
<script src="https://kit.fontawesome.com/332b6349c6.js"
	crossorigin="anonymous"></script>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
<link href="${path}/resources/css/style.css" rel="stylesheet" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="${path}/resources/css/font-awesome.min.css" rel="stylesheet" />
<link href="${path}/resources/css/elegant-icons.css" rel="stylesheet" />
<link href="${path}/resources/css/nice-select.css" rel="stylesheet" />
<link href="${path}/resources/css/jquery-ui.min.css" rel="stylesheet" />
<link href="${path}/resources/css/owl.carousel.min.css" rel="stylesheet" />
<link href="${path}/resources/css/slicknav.min.css" rel="stylesheet" />
</head>
<header>
	<div class="top">
		<div class="wrapper">
			<ul class="top-menu">
				<%
				if (sId == null) {
				%>
				<li class="test"><a href="joinHow"><p>회원가입</p></a></li>
				<li class="test"><a href="login"><p>로그인</p></a></li>
				<%
				} else {
				%>
				<!-- ==============================양윤석============================= -->
				<li class="test"><a href="logout" onclick="confirmLogout()"><p>로그아웃</p></a></li>
				<!-- ==============================양윤석============================= -->
				<li class="test"><a href="#"><p>알림</p></a></li>
				<li class="test"><a href="message"><p>메세지</p></a></li>
				<li class="test"><a href="ProductMyshop.shop"><p>판매자 전용
							마이페이지</p></a></li>
				<li class="test"><a href="admin_center_main"><p>관리자 전용 마이페이지</p></a></li>
				<li class="test"><a href="mypage"><p><%=sId%>님
						</p></a></li>
				<%
				}
				%>
				<!-- 				<span class="button"> -->
				<!-- 					<button id="userCenter" onclick="userCenterList()">고객센터</button> -->
				<!-- 				</span> -->
				<li class="test2"><a href="javascript:void(0)"
					onclick="userCenterList()"><p>고객센터</p></a></li>
				<ul id="userCenterList" style="visibility: hidden">
					<li class="test2"><a
						href="AdminNoticeList"><p>공지사항</p></a></li>
					<li class="test2"><a href="AdminQNAList"><p>문의하기</p></a></li>
					<li class="test2"><a
						href="AdminReportList"><p>신고하기</p></a></li>
				</ul>
			</ul>
		</div>
	</div>
	<div class="conocontainer">
		<div class="header__logo">
			<a href="home"><img src="${path}/resources/img/logo.png" alt=""></a>
		</div>

		<div class="search">
			<input type="text" class="searchTerm" id="searchText"
				placeholder="상품을 입력하세요">
			<button type="submit" class="searchButton" onclick="search_item()">
				<i class="fa fa-search"></i>
			</button>
			<div class="righttab">
				<a class="myShop" href="#"><i class="fa fa-shop fa-2x"></i></a> 
				<a class="wish" href="#"><i class="fa fa-heart fa-2x"></i></a>
			</div>
		</div>
	</div>
</header>