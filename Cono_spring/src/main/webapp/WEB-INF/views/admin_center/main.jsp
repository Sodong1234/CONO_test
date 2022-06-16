<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
</head>
<body>
	<!-- 헤더 -->
   <div>
      <jsp:include page="../admin_css/sidebar.jsp"/>
   </div>
   
<div class="body">

 	   <a href="AdminNoticeList">공지관리</a>
	   <a href="./AdminMemberList">회원관리</a>
	   <a href="./AdminDealList">거래현황</a>
	   <a href="./AdminDealCancelList">거래취소</a>
	   <a href="AdminQNAList">1:1 문의</a>
	   <a href="AdminReportList">신고관리</a>
	   
	   
  		
  	  	<h2>Dashboard</h2>
  		

</div>
</body>
</html>