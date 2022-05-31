<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");

%>
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

<article>
			<h1>Qna Write</h1>
			<form action="AdminQNAWritePro.admin" method="post">
				<table id="notice">
					<tr>
						<td>
					
					<select name="qna_type">
						<option value="선택">선택</option>
						<option value="버그신고">버그신고</option>
						<option value="유저신고">유저신고</option>
					</select>
					</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="member_id" value = "<%=sId %>" readonly="readonly" required="required"></td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td><input type="text" name="qna_subject" required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="qna_content" required="required"></textarea></td>
					</tr>

				</table>

				<div id="table_search">
					<input type="submit" value="글쓰기" class="btn">
				</div>
			</form>
			<div class="clear"></div>
		</article>
		
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>