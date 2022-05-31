<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String sId = (String)session.getAttribute("sId");
// AdminNoticeDTO notice = (AdminNoticeDTO) request.getAttribute("notice");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<article>
	<div>
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
			<h1>Qna Modify Page</h1>
			<form action="AdminQNAModifyPro.admin" method="post">
			<input type ="hidden" name ="qna_idx" value="<%=request.getParameter("qna_idx") %>">
				<table id="notice">
					<tr>
					<td>
				<select name="qna_type">
						<option value="choice">선택</option>
						<option value="bugReport">버그신고</option>
						<option value="userReport">유저신고</option>
					</select>
					</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="name" value="<%=sId %>" readonly="readonly" required="required"></td>
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
					<input type="submit" value="수정" class="btn">
				</div>
			</form>
			<div class="clear"></div>
		</article>
		
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>