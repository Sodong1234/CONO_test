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


		<hr>
		<article>
			<h1>user_qna</h1>
			<table id="qna">
				<tr>
			 		<th class="qna_no">No.</th> 
			 		<th class="qna_classify">Classify</th>
					<th class="qna_title">Title</th>
					<th class="qna_write">Write</th>
					<th class="qna_date">Date</th>
					
				</tr>
				
				<h1> ~~~ qna 리스트 좌라락~~~</h1>
			
					<tr><td> 1 </td><td>처리해줘</td><td> <a href ="user_qna_view.jsp"> 판매자잠수탐 </a></td><td>구매자</td><td>2022-05-11</td></tr>
					<tr><td> 1 </td><td>처리해줘</td><td> 돈안줌 </td><td>판매자</td><td>2022-05-11</td></tr>
					<tr><td> 1 </td><td>버그요청</td><td> 상품등록이 안돼요~~ </td><td>판매자</td><td>2022-05-11</td></tr>
					<tr><td> 1 </td><td>에러문의</td><td> 어쩌구저쩌구~~~</td><td>구매자</td><td>2022-05-11</td></tr>
					<tr><td> 1 </td><td>에러문의</td><td> 잠온다~~~</td><td>판매자</td><td>2022-05-11</td></tr>
			
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='user_qna_write.jsp'">
				
			</div>
			</article>
			<div id="table_search">
				<form action="qna_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
				
			</div>

			


	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>