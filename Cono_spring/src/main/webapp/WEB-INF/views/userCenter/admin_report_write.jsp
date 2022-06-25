<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::신고하기</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

// selectbox 항목 선택하지 않았을 때 돌아가기 

$(function() {

	$("form").submit(function() {
		
		
		if($("#report_type > option").eq(0).prop("selected")) {
			
			alert("신고 유형을 선택하세요.");
			$("#report_type > option").eq(0).focus();
			return false;
			
			
			}
		
	});
	
	$('#report_content').keyup(function(){
		  var content = $(this).val();
		  $('#cnt').html(content.length);
		  if (content.length > 500){
		    alert("최대 500자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 500));
		    $('#report_content .count span').html(500);
		  }
		});
		
	
});




</script>

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

.report_type {
 	position:relative; 
 	text-align: center;
 	margin-top: 30px; 
}

select {
	width:130px;
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

#report_content{
	border: 3px solid black;
	margin-top: 30px;
 	text-align: center; 
	padding-top: 15px;
}

</style>
</head>
<body>
	<div>
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
   
   
	<div class ="body">
			<div class="hh"><h1>Report Write </h1></div>
			<form action="AdminReportWritePro.admin" method="post">
				<input type="hidden" name="item_idx" value="<%=request.getParameter("item_idx")%>">
				<div class = "report_type">
					<select name="report_type" id="report_type" required="required">
						<option value="선택" selected="selected" disabled="disabled">선택</option>
						<option value="게시글신고">게시글신고</option>
						<option value="사용자신고">사용자신고</option>
					</select></div>
					<div class = "admin_id"><input type="text" id="textBox" name="member_id" value = "<%=sId %>" readonly="readonly" required="required" placeholder="이름을 입력해주세요. "></div>
					<div class = "subject"><input type="text" id="textBox" name="report_subject" required="required" placeholder="제목을 입력해주세요. "></div>
					<div class = "content">
					<textarea rows="20" cols="90"  id="report_content" name="report_content" required="required" placeholder="신고 내용을 입력해주세요. "></textarea>
					<div class="count"><span id="cnt">0</span>/500</div>
					</div>

				<div class = "buttonArea"><input type="submit" value="글쓰기" id="btn"></div>
				
			</form>
			</div>
		
	<div>
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>