<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<div>
	<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
		<h3><a href="../only_member/user_notice_list.jsp">공지사항</a></h3>
		<h3><a href="../only_member/user_chat_bot.jsp">자주하는질문</a></h3>
		<h3><a href="../only_member/user_report_list.jsp">신고하기</a></h3>
		<hr>
		<article>
			<h1>user_report</h1>
			<table id="notice">
				<tr>
			 		<th class="user_no">No.</th> 
					<th class="user_title">Title</th>
					<th class="user_write">Write</th>
					<th class="user_date">Date</th>
					
				</tr>
				
				<h1> ~~~신고 리스트 좌라락~~~</h1>
			
					<tr><td> 1 <td> <a href ="user_report_view.jsp">화이팅~~~ </a></td><td>화이팅</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 악성유저가 판을친다</td><td>화이팅</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노짱~</td><td>화이팅~~</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노짱~</td><td>화이팅</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노짱~~~~</td><td>화이팅</td><td>2022-05-11</td></tr>
			
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='user_report_write.jsp'">
				
			</div>
			</article>
			<div id="table_search">
				<form action="user_report_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
				
			</div>
<div class="clear"></div>  
 			<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>