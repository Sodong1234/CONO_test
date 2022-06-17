<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 세션 객체에 저장된 세션 아이디("sId") 가져와서 변수에 저장
String sId = (String)session.getAttribute("sId");	// String 형변환
%> 

	<c:if test = "${param.search ne null}">
	 	<c:set var ="searchType" value="${param.searchType }"/>
	 	<c:set var ="search" value="${param.search }"/>
 	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

.body_wrap{
	margin: 50px 60px 230px 60px;
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

  .paging  {  
  	margin-top: 60px;  
   	text-align: center;   
  	margin-left: 10px;
  
  }  


  .paging input:not(.btn){ 
    width: 30px;  
   	height: 30px;   
   	background-repeat:no-repeat; 
   	border-radius:100px;  
   	border-style: none;  
    overflow: hidden;   
    font-size: 13px;
    font-weight: bold;
  } 
  
  .paging input:not(.btn):hover{
  	background-color: #999;
  } 
  
  .paging a:hover{
  	text-decoration: underline;
  }

/* 검색 창 */


  .ssearch_form {  
/*      	text-align: right;      */
   	float: right;    
/* display: inline-block; */
  	margin-right: 50px;   
/*   	margin-top: 4px;   */
position: relative;
  }  

 .hh{ 
 	position:relative;  
 	float: left;  
  	margin-left: 90px;  
  	margin-top: -23px; 
 	color:#17191d; 
 	font-size: 50px;
 	width:100px;
 	
  }  


 select { 
 clear;
 	width:65px; 
 	height :30px; 
	font-size: 13px; 
 	color:#999; 
 	border:2px solid #bbb; 
  	border-radius:3px;  
 } 


.searchText { 
 	width:180px; 
 	border:1px solid #bbb; 
 	border-radius: 3px; 
 	padding: 8px 12px;  	
 	font-size: 14px; 
 } 
#search_btn{
	font-size: 13px;
 	padding: 6px 7px; 
	background-color: black;
	color: white;
	border : 2px solid black;
	border-radius: 25px; 
 	text-transform: uppercase; 
 	letter-spacing:1px;
  	font-family: sans-serif;  
	transition : all 0.4s;
}

#search_btn:focus{
	outline: none;
}

#search_btn:hover{
	background-color: white;
	color:black;
}

.btn{
 	background-image: url(./resources/img/2199097_edit_draw_pen_pencil_write_icon.png); 
	background-size: cover;
	float: right; 
	width: 40px;  
   	height: 40px;   
   	background-repeat:no-repeat;
   	border:0;
   	border-style: none; 
   	background-color: white;
   	margin:-10px;
}

</style>


</head>
<div>
	<jsp:include page="../header_footer/header.jsp" />
</div>

<body>
	
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />

	<hr>
	<div class ="body_wrap">
		<div class ="hh">NOTICE</div>
		
		<div class="ssearch">
		<form action="AdminNoticeList" method="post" class="ssearch_form">
		<input type = "hidden" name ="pageNum" value="${pageNum }">
			<select name="searchType">
				<option value="subject" <c:if test="${searchType ne null and searchType eq 'subject'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${searchType ne null and searchType eq 'content'}">selected</c:if>>내용</option>
			</select> 
			<input type="text" class ="searchText"name="search" value="<c:if test="${search ne null}">${search}</c:if>" placeholder="here"> 
			<input type="submit" value="Search" id="search_btn" >
		</form></div>
		
		
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="board_list_head">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
				</div>
				
				<c:if test="${not empty noticeList && pageInfo.listCount > 0}">
					<c:forEach var="notice" items="${noticeList}">
						<div class="board_list_body">
							<div class="item">
								<div class="num">${notice.getNotice_idx() }</div>
								<div class="title"><a href="AdminNoticeView.admin?notice_idx=${notice.getNotice_idx() }&pageNum=${pageNum}">${notice.getNotice_subject() }
								</a></div>
								<div class="writer">${notice.getAdmin_id() }</div>
								<div class="date">${notice.getNotice_date() }</div>
							</div><!-- 아이템 디브 -->
						</div><!-- 보드리스트 바디 디브 -->
					</c:forEach>
				</c:if>
			</div><!-- 보드리스트 디브 -->
			
		

	<div class ="paging">
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button"  value=" < " onclick="location.href='AdminNoticeList?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>

				<input type="button"  value=" < ">&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i }">
				${i }
			</c:when>
				<c:otherwise>
					<a href="AdminNoticeList?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button"  value=" > "  onclick="location.href='AdminNoticeList?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button"  value=" > " >&nbsp;
			</c:otherwise>
		</c:choose>
		<%if(sId.equals("admin")){ %>
		<input type="button" class="btn" onclick="location.href='AdminNoticeWrite.admin'" >
		<%} %>
		</div>
		</div>  <!-- 리스트랩 디브 -->
	
</div>
	<hr>

	<div>
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>


