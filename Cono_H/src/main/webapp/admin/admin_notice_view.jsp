<%@page import="vo.AdminNoticeDTO"%>
<%@page import="java.util.ArrayList"%>
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

	<section id="articleForm">
		<h2>글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
				<tr>
					<th width="70">제 목</th>
					<td colspan="3">${notice.getNotice_subject() }</td>
				</tr>
				<tr>
					<th width="70">작성자</th>
					<td>${notice.getAdmin_id() }</td>
					<th width="70">작성일</th>
					<td>${notice.getNotice_date() }</td>
				</tr>
			</table>
		</section>
		<section id="articleContentArea">
			${notice.getNotice_content()}</section>
		<input type="button" value="목록" onclick="location.href='AdminNoticeList.admin'"> 
		<input type="button" value="수정" class="btn" onclick="location.href='AdminNoticeModifyForm.admin?notice_idx=${notice.getNotice_idx() }'">
		<input type="button" value="삭제" class="btn" onclick="location.href='AdminNoticeDeletePro.admin?notice_idx=${notice.getNotice_idx() }&page=${param.page }'">
	</section>

	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>