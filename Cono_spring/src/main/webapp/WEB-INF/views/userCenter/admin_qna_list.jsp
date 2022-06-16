<%@page import="com.itwillbs.cono.vo.AdminQNADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
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
  width : 5%;
 }

.board_list .qna_type{
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


input[type=text] { 
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


	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />
	
	<hr>
	<div class ="body_wrap">
		<div class ="hh">QNA</div>
		<div class="ssearch">
		<form action="AdminQNASearch.admin" method="get" class="ssearch_form">
			<select name="searchType">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
			</select> 
			<input type="text" name="search" placeholder="here" > 
			<input type="submit" value="Search" id="search_btn" >
		</form></div>
		
		
		<div class="board_list_wrap">
		
			<div class="board_list">
				<div class="board_list_head">
				<div class ="num"> no.</div>
				<div class="qna_type">Classify</div>
				<div class="title">Title</div>
				<div class="write">Write</div>
				<div class="date">Date</div>
				<div class="qna_status">status</div>

		</div>
			<c:if test="${not empty qnaList && pageInfo.listCount > 0}">
				<c:forEach var="qna" items="${qnaList}">

					
<%-- 						<td>${qna.getQna_idx() }</td> --%>
						<div class="board_list_body">
							<div class="item">
      
						<div class = "num">${qna.num }</div>
								<div class="qna_type">${qna.qna_type }</div>
								
								
						<c:if test="${qna.qna_secret == true }">
							<c:choose>
       						 <c:when test="${qna.member_id eq sId || sId eq 'admin'}">
       						 <div class="title"><a href="AdminQNAView.admin?qna_idx=${qna.qna_idx }&pageNum=${pageInfo.pageNum}">${qna.qna_subject }</a></div>
						</c:when>
						  <c:otherwise>
						  	<div class="title">비밀글은 작성자와 관리자만 볼 수 있습니다.</div>
						  </c:otherwise>
      					  </c:choose>
							</c:if>
							<c:if test="${qna.qna_secret == false }">
							 <div class="title"><a href="AdminQNAView.admin?qna_idx=${qna.qna_idx }&pageNum=${pageInfo.pageNum}">${qna.qna_subject }</a></div>
							</c:if>
							
							<c:choose>
							<c:when test="${qna.qna_re_lev > 0 }">
								<div class="write"> admin </div>
							
							</c:when>
							<c:otherwise>
								<div class="write">${qna.member_id }</div>
							
							</c:otherwise>
							</c:choose>
							
							
						
							

						<div class="date">${qna.qna_date }</div>
						<div class="qna_status">${qna.qna_status }</div>
					</div> <!-- 아이템 디브 -->
						</div> <!-- 보드리스트 바디 디브 -->
				</c:forEach>
			</c:if>
			
			</div><!-- 보드리스트 디브 -->
			


	<div class ="paging">
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button" value=" < " onclick="location.href='AdminQNAList.admin?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>

				<input type="button" value=" < ">
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i }">
				${i }
			</c:when>
				<c:otherwise>

					<a href="AdminQNAList.admin?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value=" > "
					onclick="location.href='AdminQNAList.admin?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>

				<input type="button" value=" > ">&nbsp;
			</c:otherwise>
		</c:choose>
		
		<input type="button" value="" class="btn" onclick="location.href='AdminQNAWriteForm.admin'">
</div> <!-- 페이지디브 -->
</div><!--  리스트랩 디브 -->
	</div> <!-- 바디 디브 -->




	<div>
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>