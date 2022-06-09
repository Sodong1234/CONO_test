<%@page import="com.itwillbs.cono.vo.AdminNoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<AdminNoticeDTO> noticeList = (ArrayList<AdminNoticeDTO>) request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 검색 페이지</title>
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


/*  paging  */

/*   .paging  {   */
/*   	margin-top: 30px;   */
/*    	text-align: center;    */
/*   	margin-left: 10px; */
/*   }   */


/*   .paging input:not(.btn){  */
/*     width: 30px;   */
/*    	height: 30px;    */
/*    	background-repeat:no-repeat;  */
/*    	border-radius:100px;   */
/*    	border-style: none;   */
/*     overflow: hidden;    */
/*     font-size: 13px; */
/*     font-weight: bold; */
/*   }  */
  
/*   .paging input:not(.btn):hover{ */
/*   	background-color: #999; */
/*   }  */
  
/*   .paging a:hover{ */
/*   	text-decoration: underline; */
/*   } */

/* 검색 창 */


/* .ssearch { */
/*  	position:relative;  */
/*  	float: right;  */
/*  	margin-right: 50px;  */
/*  	margin-top: 4px;  */
/* } */

 .hh{ 
 	position:relative;  
  	float: left;  
  	margin-left: 90px;  
  	margin-top: 4px; 
	color:#17191d; 
 }	

/* select { */
/* 	width:65px; */
/* 	height :30px; */
/* 	font-size: 13px; */
/* 	color:#999; */
/* 	border:2px solid #bbb; */
/*  	border-radius:3px;  */
/* } */


/* input[type=text] {  */
/*  	width:180px;  */
/*  	border:1px solid #bbb;  */
/*  	border-radius: 3px;  */
/*  	padding: 8px 12px;  	 */
/*  	font-size: 14px;  */
/*  }  */
/* #search_btn{ */
/* 	font-size: 13px; */
/*  	padding: 6px 7px;  */
/* 	background-color: black; */
/* 	color: white; */
/* 	border : 2px solid black; */
/* 	border-radius: 25px;  */
/*  	text-transform: uppercase;  */
/*  	letter-spacing:1px; */
/*   	font-family: sans-serif;   */
/* 	transition : all 0.4s; */
/* } */

/* #search_btn:focus{ */
/* 	outline: none; */
/* } */

/* #search_btn:hover{ */
/* 	background-color: white; */
/* 	color:black; */
/* } */

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
		<div class ="hh"><h1>NOTICE</h1></div>
		
		
		<div class="board_list_wrap">
		
			<div class="board_list">
				<div class="board_list_head">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
				</div>
				
				
		<%
		for (AdminNoticeDTO notice : noticeList) {
		%>
<div class="board_list_body">
					<div class="item">

		<div class="num"><%=notice.getNotice_idx()%></div>

			<div class="title"><a href="AdminNoticeView.admin?notice_idx=<%=notice.getNotice_idx()%>"><%=notice.getNotice_subject()%> </a></div>
			<div class="writer"><%=notice.getAdmin_id()%></div>

			<div class="date"><%=notice.getNotice_date()%></div>
		</div></div>
		<%
		}
		%>
	
</div>

<div class ="buttonArea"><input type="button" value="목록" class="btn"  onclick="location.href='AdminNoticeList.admin'"> </div>
</div>
</div>
	<div>
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>