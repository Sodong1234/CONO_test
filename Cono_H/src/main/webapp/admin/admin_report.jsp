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
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>

	
	<nav id="left_menu">
			<ul>
				<li><a href="admin_notice_list.jsp">Notice</a></li>
				<li><a href="admin_product.jsp">product</a></li>
				<li><a href="admin_member.jsp">member</a></li>
				<li><a href="admin_qna_list.jsp">qna</a></li>
				<li><a href="admin_report.jsp">report</a></li>
			</ul>
		</nav>
	
	<article>
		<h2>신고 글 관리</h2>
		
		<div id="report_search">
			<form action="admin_report_search" method="get">
				<select name="searchType">
					<option>전체</option>
					<option>게시글 신고</option>
					<option>사용자 신고</option>
				</select>
			</form>
		</div>
		<table border="1">
			<tr>
				<th>N O</th>
				<th>게시글 제목</th>
				<th>분류</th>
				<th>신고 아이디</th>
				<th>신고 일시</th>
				<th>신고 이유</th>
				<th>되돌리기 / 삭제</th>
			</tr>
			<tr>
				<td>A222</td>
				<td><a href=""></a>신발 팔아요!</td>
				<td>게시글 신고</td>
				<td><a href=""></a>roro</td>
				<td>2022-05-11</td>
				<td>판매 금지 물품이에요.</td>
				<td>
					<input type="button" onclick="location.href='admin_report_reset.jsp'" value="되돌리기">
					<input type="button" onclick="location.href='admin_report_delete.jsp'" value="삭제">
				</td>
			</tr>
			<tr>
				<th colspan="7"><button onclick="location.href='../center/main.jsp'">메 인</button></th>
			</tr>
		</table>
		<!-- 페이징 처리 -->
		<div id="page_control">
			<a href="">Prev</a>
			<a href="">Next</a>
		</div>
	</article>
	
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>