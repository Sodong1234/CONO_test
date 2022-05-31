<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_notice.jsp</title>
</head>
	<div>
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
<hr>
<h3><a href="../only_member/user_notice_list.jsp">공지사항</a></h3>
		<h3><a href="../only_member/user_chat_bot.jsp">자주하는질문</a></h3>
		<h3><a href="../only_member/user_report_list.jsp">신고하기</a></h3>
<body>
		
		<hr>
		<article>
			<h1>user_notice 여기는 유저가 읽기만 할수 있는공간이라 글쓰기 버튼이 없습니다</h1>
			<table id="notice">
				<tr>
			 		<th class="admin_no">No.</th> 
					<th class="admin_title">Title</th>
					<th class="admin_write">Write</th>
					<th class="admin_date">Date</th>
					
				</tr>
				
				<h1> ~~~공지사항 리스트 좌라락~~~</h1>
			
					<tr><td> 1 <td> <a href ="admin_notice_view.jsp">코노협회에서는~~~ </a></td><td>코노관리자</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노협회에서는~~~</td><td>코노관리자</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노협회에서는~~~</td><td>코노관리자</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노협회에서는~~~</td><td>코노관리자</td><td>2022-05-11</td></tr>
					<tr><td> 1 <td> 코노협회에서는~~~</td><td>코노관리자</td><td>2022-05-11</td></tr>
			
			</table>
			
			</article>
			<div id="table_search">
				<form action="admin_notice_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
				
			</div>

			


		<hr>
		
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>


