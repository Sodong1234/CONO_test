<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 아이디 저장
String sId = (String)session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="selectbox.css" /> -->
<!-- <link rel="stylesheet" href="search.css" /> -->
<!-- <link rel="stylesheet" href="table.css" /> -->

<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Rubik&display=swap');

body{
   margin: 0;
}

.sidebar{
   position: fixed;
   width: 230px;
   top:0;
   left: 0;
   bottom: 0;
   background: #111;
   padding-top: 50px;
}


.sidebar h1{
   display: block;
   padding: 10px 20px;
   color: #fff;
   text-decoration: none;
   font-family: "Rubik";
   letter-spacing: 2px;
   font-weight: 400;
   margin: 0;
   font-size: 25px;
   text-transform: uppercase;
   cursor:pointer;
}

.sidebar h1:hover{
	color: #fff;
	margin-left: 20px;
	transition: 0.4s;
}

.sidebar a{
   display: block;
   padding: 10px 20px;
   color: #bbb;
   text-decoration: none;
   font-family: "Rubik";
   letter-spacing: 2px;
}

.sidebar a:hover{
   color: #fff;
   margin-left: 20px;
   transition: 0.4s;
}

.nav {
	letter-spacing: 2px;
	border-bottom: 2px solid #000000;
}

.nav a{
	margin-right:15px;
	text-decoration: none;
	color: inherit;
	cursor:pointer;
}

.nav a:hover{
	color: gray;
}

.body {
    margin-left: 300px;
    margin-right: 60px;
}

	
</style>

<script type="text/javascript">
	
	//로그아웃
	function confirmLogout() {
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "logout";
		}
	}

</script>
</head>
<body>
<!-- 사이드바 -->
	<div class="sidebar">
	   <h1 onclick="location.href='./main'">Cono</h1>
	   <a href="">대시보드</a>
	   <a href="./AdminMemberList">회원관리</a>
	   <a href="./AdminDealList">거래현황</a>
	   <a href="./AdminDealCancelList">거래취소</a>
	   <a href="AdminQNAList.admin">1:1 문의</a>
	   <a href="AdminNoticeList.admin">공지관리</a>
	   <a href="AdminReportList.admin">신고관리</a>
	</div>
	
<!-- 네비게이션	 -->
	<section id="nav">
		<div class="nav" align="right">
			<h5>
			<a onclick="location.href='./main'">홈 </a>
			<a href="">관리자님 </a>
			<a onclick="confirmLogout()">로그아웃</a></h5>
		</div>
	</section>
	

</body>
</html>