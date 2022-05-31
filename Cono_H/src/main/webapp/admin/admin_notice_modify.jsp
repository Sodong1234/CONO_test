<%@page import="vo.AdminNoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
AdminNoticeDTO notice = (AdminNoticeDTO) request.getAttribute("notice");
%>
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
		<h1>Notice Modify Page</h1>
		<form action="AdminNoticeModifyPro.admin" method="post">
			<input type="hidden" name="notice_idx" value="<%=notice.getNotice_idx()%>"> 
			<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
			<table id="notice">

				<tr>
					<td>작성자(=코노 관리자)</td>
					<td><input type="text" name="admin_id" value="<%=notice.getAdmin_id()%>" required="required"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="notice_subject" value="<%=notice.getNotice_subject()%>" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="20" name="notice_content" required="required">
						<%=notice.getNotice_content()%>
						</textarea></td>
				</tr>

			</table>

			<div id="table_search">
				<input type="submit" value="수정" class="btn">
			</div>
		</form>
		<div class="clear"></div>
	</article>

	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>