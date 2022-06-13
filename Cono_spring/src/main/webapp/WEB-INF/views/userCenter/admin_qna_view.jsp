<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String sId = (String) session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 상세페이지</title>
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
	padding: 14px;
	color: #363940;
}

.board_list_body {
	border-bottom: 1px solid #ccc;
	padding: 14px 14px 11px 20px;
	color: #363940;
}

h1 {
	position: relative;
	float: left;
	margin-left: 60px;
	margin-top: 4px;
	margin-bottom: 10px;
	color: #17191d;;
}

.title {
	width: 50%;
	float: left;
	height: 70px;
	font-size: 25px;
	/*  	padding:14px 0 11px 20px; */
	font-weight: 600;
	line-height: 50px;
	/* 	padding-left: 10px; */
}

.qna_type{
	width: 50%;
	height: 70px;
	float: right;
	font-size: 14px;
	font-weight: 200;
	color: #737881;
	line-height: 60px;
	text-align: right;
}


.writer {
	width: 50%;
	height: 30px;
	float: right;
	font-size: 14px;
	font-weight: 200;
	color: #737881;
	line-height: 60px;
	text-align: right;
}

.date {
	width: 50%;
	height: 30px;
	float: right;
	font-size: 14px;
	font-weight: 200;
	color: #737881;
	line-height: 60px;
	text-align: left;
}

#btn {
	font-size: 13px;
	font-weight: bold;
	padding: 6px 7px;
	background-color: white;
	color: #9fa1a7;
	border: 2px solid #9fa1a7;
	border-radius: 2px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-family: sans-serif;
	transition: all 0.4s;
}

#btn:focus {
	outline: none;
}

#btn:hover {
	background-color: #9fa1a7;
	color: white;
}

.btnArea {
	float: right;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../header_footer/top.jsp" />
	</div>


	<div class="body">
		<h1>QNA</h1>
		<div class="board_list_wrap">
			<div class="board_list_head">
				<%-- 						<td>${qna.getQna_idx() }</td> --%>

				<div class="qna_type">${qnaList.qna_type }</div>
				<div class="title">${qnaList.getQna_subject() }</div>
				<div class="writer">${sId }</div>
				<div class="date">${qnaList.getQna_date() }</div>
			</div>
			<div class="board_list_body">
				<div class="content">${qnaList.getQna_content()} 내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>

			</div>
			<div class="btnArea">
				<input type="button" value="목록" id="btn" onclick="location.href='AdminQNAList'"> 
				<input type="button" value="수정" id="btn" onclick="location.href='AdminQNAModifyForm.admin?qna_idx=${qnaList.getQna_idx() }&pageNum=${param.pageNum }'">
				<input type="button" value="삭제" id="btn" onclick="location.href='AdminQNADeletePro.admin?qna_idx=${qnaList.getQna_idx() }&pageNum=${param.pageNum }'">
				<input type="button" value="답변" id="btn" onclick="location.href='AdminQNAReplyForm.admin?qna_idx=${qnaList.getQna_idx() }&pageNum=${param.pageNum }'">
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>