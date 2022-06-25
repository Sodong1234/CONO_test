<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::상품삭제</title>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<style>
.delete {
	position: fixed;
	text-align: center;
	margin-top: 42px;
	position: absolute;
	left: 48%;
	transform: translateX(-50%);
/*   border: 1px solid red; */
}

/* btn */

.id { 
    width:260px; 
    height:48px;
    border:1px solid #bbb; 
    border-radius: 3px; 
    padding: 8px 6px;     
    font-size: 15px; 
    margin-top:14px;
    margin-bottom: 14px;
 } 
 
.passwd { 
    width:260px; 
    height:48px;
    border:1px solid #bbb; 
    border-radius: 3px; 
    padding: 8px 6px;     
    font-size: 15px; 
 } 
 
input[type=submit]{
   width:100px;
   height:50px;
   font: bold;
   font-size: 16px;
   padding: 10px 9px; 
   background-color: navy;
   color: white;
   border : 2px solid navy;
   border-radius: 16px; 
   text-transform: uppercase; 
   letter-spacing:1px;
   font-family: sans-serif;  
   transition : all 0.4s;
   
   margin-top: 20px;
}
.btn:focus{
   outline: none;
}

.btn:hover{
   background-color: skyblue;
   font:bold;
   color:navy;
}

.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
}
@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}



</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp"/>
	</div>

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		
		<div class="delete">
		
		<h2 style="font-family:'Cafe24Ohsquare';">상품을 삭제하시겠습니까?!</h2>

		<form action="ItemDeletePro.shop" method="post">
			<input type="hidden" name="item_idx" value="<%=request.getParameter("item_idx")%>">
			
			<div>
				<input type="text" name="member_id" class="id" placeholder="아이디를 입력하세요"/>
			</div>
			
			
			<div>
				<input type="password" name="member_pass" class="passwd" placeholder="패스워드를 입력하세요"><br>
			</div>
			
			<div>
				<input type="submit" class="btn" value="삭제하기" onclick="confirm('상품을 삭제 하시겠습니까?')">
			</div>
		
		</form>
		
		</div>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>