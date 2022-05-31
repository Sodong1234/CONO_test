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
		<jsp:include page="../HeaderFooter/top.jsp" />
	</div>
	<article>
		<h1>Notice Write</h1>
		<form action="AdminNoticeWritePro.admin" method="post">
			<table id="notice">

				<tr>
					<td>작성자(=코노 관리자)</td>
					<td><input type="text" name="admin_id" required="required"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="notice_subject"
						required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="20" name="notice_content"
							required="required"></textarea></td>
				</tr>

			</table>

			<div id="table_search">
				<input type="submit" value="글쓰기" class="btn">
			</div>
		</form>
		<div class="clear"></div>
	</article>

	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>