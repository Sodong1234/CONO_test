	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::관리자 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">

.values {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	text-align: center;
	margin-top:50px;
	margin-bottom: 60px;
	font-family: serfi;
}

.values .val-box {
	background: #e8e8e8;
	width: 290px;
	height:160px;
	padding: 16px;
	border-radius: 4px;
	justify-content: flex-start;
	text-align: center;
	align-items: center;
	box-shadow: 2px 2px 2px gray;
}

hr {
	box-shadow: 1px 1px 1px gray;
}

.values .val-box h3 {
	font-size: 18px;
	font-weight: 600;
	margin-top: 30px;
}

.values .val-box p {
	font-size: 22px;
}

.values a {
	color: inherit;
	text-decoration: none;
}

.values:hover .val-box:hover {
	color: #74B72E;
}

</style>
</head>
<body>
	<!-- 헤더 -->
   <div>
      <jsp:include page="../admin_css/sidebar.jsp"/>
   </div>
   
<div class="body">
	   
  		
  	  	<h2>Dashboard</h2>
  	  	
  	  	<div class="values">
  	  		<a href="./AdminMemberList">
	  			<div class="val-box">
					<h3>MEMBER</h3>
					<hr>
					<p>${memberCount} 명</p>
	  			</div>
  			</a>
  			<a href="./AdminMemberList">
	  			<div class="val-box">
					<h3>NEW USER</h3>
					<hr>
					<p>${newMemberCount} 명</p>
				</div>
			</a>
			<a href="./AdminDealList">
				<div class="val-box">
					<h3>진행중인 거래</h3>
					<hr>
					<p>${dealCount} 건</p>
				</div>
			</a>
			<a href="./AdminDealList">
				<div class="val-box">
					<h3>거래취소 요청</h3>
					<hr>
					<p>${dealCancel} 건</p>
	  			</div>
	  		</a>
  		</div> <!-- 첫번째 줄 -->
  		
		<div class="values" style="margin-top: 120px;">
			<a href="AdminQNAList">		
	  			<div class="val-box">
					<h3>답변대기</h3>
					<hr>
					<p>${qnaWaitCount} 건</p>
	  			</div>
	  		</a>
	  		<a href="AdminReportList">
	  			<div class="val-box">
					<h3>신고된 글</h3>
					<hr>
					<p>${reportCount} 건</p>
				</div>
			</a>
			<a href="">
				<div class="val-box">
					<h3>전체 상품</h3>
					<hr>
					<p>${allItemCount} 건</p>
				</div>
			</a>
			<a href="">
				<div class="val-box">
					<h3>오늘 등록된 상품</h3>
					<hr>
					<p>${newItemCount} 건</p>
	  			</div>
	  		</a>
  		</div>
  		
  		
  		
  		
  		
  		
  		
  		

</div>
</body>
</html>