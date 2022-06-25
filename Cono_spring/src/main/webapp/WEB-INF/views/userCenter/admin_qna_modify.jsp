<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String sId = (String)session.getAttribute("sId");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::QNA</title>
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
 	padding: 10px 40px; 
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

.qna_type {
 	position:relative; 
 	text-align: center;
 	margin-top: 30px; 
}

select {
	width:65px;
	height :30px;
	font-size: 13px;
	color:#999;
	border:2px solid #bbb;
 	border-radius:3px; 
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
		<jsp:include page="../header_footer/header.jsp" />
	</div>
   
   
	<div class ="body">
			<div class="hh"><h1>Qna Modify </h1></div>
			<form action="AdminQNAModifyPro.admin" method="post">
			<input type ="hidden" name ="qna_idx" value="<%=request.getParameter("qna_idx") %>">
			<input type ="hidden" name ="pageNum" value="<%=request.getParameter("pageNum") %>">
					<div class = "qna_type">
				<select name="qna_type">
						<option value="선택">선택</option>
						<option value="버그신고">버그신고</option>
						<option value="유저신고">유저신고</option>
					</select></div>
					<div class = "admin_id"><input type="text" id="textBox" name="member_id" value = "<%=sId %>" readonly="readonly" required="required"  placeholder="이름을 입력해주세요. "></div>
					<div class = "subject"><input type="text" id="textBox" name="qna_subject" required="required"  placeholder="제목을 입력해주세요. "></div>
					<div class = "content"><textarea rows="30" cols="100"  id="qna_content" name="qna_content" required="required" placeholder="문의 내용을 입력해주세요. "></textarea></div>

				<div class = "buttonArea"><input type="submit" value="수정" id="btn" ></div>
				</form>
				</div>
		

	<div>
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>