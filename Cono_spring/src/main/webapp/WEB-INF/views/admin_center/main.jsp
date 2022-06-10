<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
   <div>
      <jsp:include page="../admin_css/sidebar.jsp"/>
   </div>
   
<div class="body">

  		<a href="AdminDealList">거래관리</a><br>
  		<a href="AdminMemberList">회원관리</a><br>
  		<a href="/userCenter/AdminNoticeList">공지사항 관리</a> <br>
  		<a href="../admin/AdminQNAList.admin">1:1 문의 관리</a> <br>
  		<a href="../admin/AdminReportList.admin">신고 관리</a><br>
  		
  	  	<h2>Dashboard</h2>
  		

</div>
</body>
</html>