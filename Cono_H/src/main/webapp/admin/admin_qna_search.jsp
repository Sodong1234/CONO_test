<%@page import="vo.AdminQNADTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<AdminQNADTO> qnaList = (ArrayList<AdminQNADTO>) request.getAttribute("qnaList");
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
	<h1>admin_qna_search page</h1>
	<table id="notice">
		<tr>
			<th class="admin_no">No.</th>
			<th class="admin_title">Title</th>
			<th class="admin_write">Write</th>
			<th class="admin_date">Date</th>

		</tr>
		<%
		for (AdminQNADTO qna : qnaList) {
		%>


		<tr>
			<td><%=qna.getQna_idx()%></td>

			<td id="subject"><a href="AdminQNAView.admin?qna_idx=<%=qna.getQna_idx()%>"><%=qna.getQna_subject()%> </a></td>

			<td><%=qna.getMember_id()%></td>

			<td><%=qna.getQna_date()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>