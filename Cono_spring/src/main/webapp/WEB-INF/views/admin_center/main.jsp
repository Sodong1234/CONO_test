<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
  		<a href="../admin/admin_product.jsp">상품관리</a><br>
  		<a href="./AdminMemberList.admin">회원관리</a><br>
  		<a href="../admin/AdminNoticeList.admin">공지사항 관리</a> <br>
  		<a href="../admin/AdminQNAList.admin">1:1 문의 관리</a> <br>
  		<a href="../admin/AdminReportList.admin">신고 관리</a><br>
  		
	<div>
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>