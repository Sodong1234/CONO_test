<%@page import="com.itwillbs.cono.vo.AdminNoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
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

 .board_list_head, .board_list_body { 
 	font-size: 100%; 
   	margin-bottom: 20px;   
/*   	padding : 10px 0; */
 } 

.board_list_head {
	border-top: 3px solid black;
	border-bottom: 1px solid #ccc;
	height: 100px;
  	position: relative; 
  	padding : 14px; 
  	color:#363940;
}

.board_list_body {
	border-bottom: 1px solid #ccc;
	padding : 14px 14px 11px 20px; 
	color:#363940;
}

/* .board_list_head>div, .board_list_body>div { */
/* 	display: inline-block; */
/* 	font-size: 14px; */
/* } */


h1{
	position:relative; 
 	float: left; 
 	margin-left: 60px; 
 	margin-top: 4px;
 	margin-bottom: 10px;
	color:#17191d;;
 	
}
 .title{ 
 	width:100%;
 	float: left; 
 	height: 70px;
 	font-size: 25px;
/*  	padding:14px 0 11px 20px; */
	font-weight: 600;
	line-height: 50px; 
/* 	padding-left: 10px; */
 } 

 .writer{ 
 	width:50%;
 	height: 30px;
  	float : right;  
 	font-size: 14px;
 	font-weight: 200;
 	color: #737881;
	line-height: 60px; 
	text-align: right;	
 } 
 .date { 
 	width:50%;
 	height: 30px;
 	float : right; 
 	font-size: 14px;
 	font-weight: 200;
 	color: #737881;
  	line-height: 60px;  
	text-align: left;	
 } 
 
 #btn{
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

#btn:focus{
	outline: none;
}

#btn:hover{
	background-color: #9fa1a7;
	color:white;
}
 
.btnArea{
	float: right;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../header_footer/top.jsp" />
	</div>
	<!-- 헤더 -->
   <div>
      <jsp:include page="../admin_css/sidebar.jsp"/>
   </div>
	
	
	<div class="body">
		<h1>NOTICE</h1>
			<div class="board_list_wrap">
			<div class="board_list_head">
					<div class="title">제목 : ${notice.getNotice_subject() }</div>
					<div class="writer">${notice.getAdmin_id() }</div>
					
					<div class="date">${notice.getNotice_date() }</div>
					
			</div>		
			<div class="board_list_body">
		<div class= "content"> ${notice.getNotice_content()} 내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
		
		</div>
		
		<div class="btnArea">
		<input type="button" value="목록" id="btn"  onclick="location.href='AdminNoticeList.admin'"> 
		<input type="button" value="수정" id="btn"  onclick="location.href='AdminNoticeModifyForm.admin?notice_idx=${notice.getNotice_idx() }'">
		<input type="button" value="삭제" id="btn" onclick="location.href='AdminNoticeDeletePro.admin?notice_idx=${notice.getNotice_idx() }&page=${param.page }'">
		</div>
	</div>
	</div>
	
	
	
	
	<div>
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>