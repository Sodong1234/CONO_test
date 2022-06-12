<%@page import="com.itwillbs.cono.vo.AdminQNADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
AdminQNADTO qna = (AdminQNADTO)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 답변 폼</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: inherit;
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

.hh{
	position:relative; 
 	float: center; 
 	margin-lefCt: 60px; 
 	margin-top: 4px;
 	margin-bottom: 10px;
	color:#17191d;;
	text-align: center;
 	
}



 
 .admin_id, .subject, .content{ 
 	text-align: center;
 } 

.buttonArea{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 25px;
}
#textBox {
	width: 300px;
	height: 30px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
	margin-top: 30px;
	margin-bottom: 10px;
 	text-align: center; 
 	
/* 	justify-content : center */
}

#qna_content{
	border: 3px solid black;
	margin-top: 30px;
 	text-align: center; 
	padding-top: 15px;
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
   
   
	<div class ="body">
			<div class="hh"><h1>Qna Reply </h1></div>
		<form action="AdminQNAReplyPro.admin" name="qnaReplyForm" method = "post" >
		
		<input type ="hidden" name="qna_idx" value="<%=qna.getQna_idx()%>">
		<input type ="hidden" name="page" value="<%=request.getParameter("page")%>">
		<input type ="hidden" name="qna_re_ref" value="<%=qna.getQna_re_ref()%>">
		<input type ="hidden" name="qna_re_lev" value="<%=qna.getQna_re_lev()%>">
		<input type ="hidden" name="qna_re_seq" value="<%=qna.getQna_re_seq()%>">
		
		
		
			<div class = "admin_id"><input type="text" id="textBox"  name="member_id"  required="required" placeholder="관리자 이름을 입력해주세요." /></div>
			<div class = "subject"><input type="text" id="textBox"  name="qna_subject" value="Re:<%=qna.getQna_subject() %>"required="required" /></div>
			<div class = "content"><textarea rows="30" cols="100"  id="qna_content" required="required">
			
						----- 원본 글 내용 ------
						<%=qna.getQna_content() %>
						</textarea></div>
			<div class = "buttonArea">
				<input type="submit" value="답글등록" id ="btn">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" id ="btn">&nbsp;&nbsp;
				<input type ="button" value ="취소" onclick ="history.back()" id ="btn">  
			</div>
				</form>
				</div>
	
	<div>
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
	
</body>
</html>