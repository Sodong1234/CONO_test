<%@page import="vo.AdminNoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<AdminNoticeDTO> noticeList = (ArrayList<AdminNoticeDTO>) request.getAttribute("noticeList");
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
	<h1>admin_notice_search page</h1>
	<table id="notice">
		<tr>
			<th class="admin_no">No.</th>
			<th class="admin_title">Title</th>
			<th class="admin_write">Write</th>
			<th class="admin_date">Date</th>

		</tr>
		<%
		for (AdminNoticeDTO notice : noticeList) {
		%>


		<tr>
			<td><%=notice.getNotice_idx()%></td>

			<td id="subject"><a href="AdminNoticeView.admin?notice_idx=<%=notice.getNotice_idx()%>"><%=notice.getNotice_subject()%> </a></td>
			<td><%=notice.getAdmin_id()%></td>

			<td><%=notice.getNotice_date()%></td>
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