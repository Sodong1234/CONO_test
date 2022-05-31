<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"/>
		<article>
		  <h1>고객센터</h1>
		
		<h3><a href="../only_member/user_notice_list.jsp">공지사항</a></h3>
		<h3><a href="../only_member/user_chat_bot.jsp">자주하는질문</a></h3>
		<h3><a href="../only_member/user_report_list.jsp">신고하기</a></h3>
		
		</article>
		  
		<div class="clear"></div>  
 			<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>


