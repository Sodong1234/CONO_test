<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
String sId = (String) session.getAttribute("sId");
String member_nick = (String) session.getAttribute("member_nick");

String search = request.getParameter("searchText");

if(request.getParameter("searchText") == null) {
	search = "";
}
%>
<script type="text/javascript">


	function userCenterList() {
		let userCenterList = document.getElementById("userCenterList");
		userCenterList.style.visibility = "visible";
	}
	// =========================양윤석==================================
	function confirmLogout() {
		var result = confirm("로그아웃 하시겠습니까?");
		if( result ){
			location.href = "logout";
		}
	}
	
	// =========================양윤석==================================
	//============== 가준 검색 ============
		// 필터와 함께 검색기능
	function search_item() {
		// 검색 내용 고정
		let searchText = document.getElementById("searchText").value;

// 		document.getElementById("searchText").value = ${searchText };
		// 검색
		location.href = ("search_item?searchText=" + searchText + "&filter1=0" + "&filter2=0");
	}
	// 샵 로그인 체크
	function myShop_loginCheck() {
		if("${sId}" == "") {
			alert("로그인이 필요합니다.");
		} else {
			location.href="ProductMyshop.shop";
		}
	}
	// 좋아요 들어가는거 로그인 체크
	function wish_loginCheck() {
		if("${sId}" == "") {
			alert("로그인이 필요합니다.");
		} else {
			location.href="wish";
		}
	}
	// 신고하기 로그인 체크
	function report_loginCheck() {
		if("${sId}" == "") {
			alert("로그인이 필요합니다.");
		} else {
			location.href="AdminReportList";
		}
	}
	// 문의하기 체크
	function qna_loginCheck() {
		if("${sId}" == "") {
			alert("로그인이 필요합니다.");
		} else {
			location. href="AdminQNAList";
		}
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
				<li class="test"><a href="#" onclick="confirmLogout()"><p>로그아웃</p></a></li>
				<!-- ==============================양윤석============================= -->
				<li class="test"><a href="message_list"><p>메세지</p></a></li>
				<c:if test="${sId eq 'admin'}">
					<li class="test"><a href="adminMain"><p>관리자 전용 마이페이지</p></a></li>
				</c:if>
				<li class="test"><a href="mypage"><p><%=member_nick%>님
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
					<li class="test2"><a onclick="qna_loginCheck()"><p>문의하기</p></a></li>
					<li class="test2">
					<a onclick="report_loginCheck()"><p>신고하기</p></a></li>
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
				placeholder="상품을 입력하세요" value="${searchText }">
			<button type="submit" class="searchButton" onclick="search_item()">
				<i class="fa fa-search"></i>
			</button>
			<div class="righttab">
				<a class="myShop" onclick="myShop_loginCheck()" style="color: black;"><i class="fa fa-shop fa-2x"></i></a> 
				<a class="wish" onclick="wish_loginCheck()" style="color: black;"><i class="fa fa-heart fa-2x"></i></a>
			</div>
		</div>
	</div>
</header>