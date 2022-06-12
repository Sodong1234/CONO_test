<%@page import="com.itwillbs.cono.vo.AdminQNADTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<AdminQNADTO> qnaList = (ArrayList<AdminQNADTO>) request.getAttribute("qnaList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 검색 페이지</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_list_wrap {
	padding: 50px;
}

.board_list_head, .board_list_body .item {
	font-size: 0;
	padding : 10px 0;
}

.board_list_head {
	border-top: 3px solid black;
	border-bottom: 1px solid #ccc;
}

.board_list_body .item {
	border-bottom: 1px solid #ccc;
}

.board_list_head>div, .board_list_body .item>div {
	display: inline-block;
	text-align: center;
	font-size: 14px;
}

.board_list_head>div{
	font-weight: 600;
}

.board_list .num {
	width : 10%;
}
.board_list .title {
	width : 55%;
}

.board_list_body div.title {
	text-align: left;
}

.board_list_body div.title a:hover {
	text-decoration: underline;
}

.board_list .writer {
	width : 10%;
}
.board_list .date {
	width : 15%;
}



 .hh{ 
 	position:relative;  
  	float: left;  
  	margin-left: 90px;  
  	margin-top: 4px; 
	color:#17191d; 
 }	


.buttonArea{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 25px;
}
.btn{
 font-size: 13px;
 	font-weight:bold;
 	padding: 6px 7px; 
	background-color: white;
	color: #9fa1a7;
	border : 2px solid #9fa1a7;
	border-radius: 2px; 
 	text-transform: uppercase; 
 	letter-spacing:1px;
  	font-family: sans-serif;  
	transition : all 0.4s;
}
.btn:focus{
	outline: none;
}

.btn:hover{
	background-color: #9fa1a7;
	color:white;
}
</style>

</head>
	<div>
		<jsp:include page="../header_footer/top.jsp" />
	</div>
	<!-- 헤더 -->
   <div>
      <jsp:include page="../admin_css/sidebar.jsp"/>
   </div>
<body>
	
	<div class ="body">
		<div class ="hh"><h1>QNA</h1></div>
		
	<div class="board_list_wrap">
		
			<div class="board_list">
				<div class="board_list_head">
			<div class="num">No.</div>
		<div class="title">Title</div>
			<div class="writer">Write</div>
			<div class="date">Date</div>
</div>
		<%
		for (AdminQNADTO qna : qnaList) {
		%>


		<div class="board_list_body">
					<div class="item">
			<div class="num"><%=qna.getQna_idx()%></div>

			<div class="title"><a href="AdminQNAView.admin?qna_idx=<%=qna.getQna_idx()%>"><%=qna.getQna_subject()%> </a></div>

			<div class="writer"><%=qna.getMember_id()%></div>

			<div class="date"><%=qna.getQna_date()%></div>
		</div></div>
		<%
		}
		%>
	</div>
<div class ="buttonArea"><input type="button" value="목록" class="btn"  onclick="location.href='AdminQNAList.admin'"> </div>
</div>
</div>
	<div>
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>