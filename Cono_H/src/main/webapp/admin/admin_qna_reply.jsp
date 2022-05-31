<%@page import="vo.AdminQNADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에 저장된 BoardDTO 객체("article") 가져오기
AdminQNADTO qna = (AdminQNADTO)request.getAttribute("qna");
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

	<!-- 게시판 답변 -->
	<section id="replyForm">
		<h1>게시판 답변</h1>
		<form action="AdminQNAReplyPro.admin" name="qnaReplyForm" method = "post" >
		<input type ="hidden" name="qna_idx" value="<%=qna.getQna_idx()%>">
		<input type ="hidden" name="page" value="<%=request.getParameter("page")%>">
		<input type ="hidden" name="qna_re_ref" value="<%=qna.getQna_re_ref()%>">
		<input type ="hidden" name="qna_re_lev" value="<%=qna.getQna_re_lev()%>">
		<input type ="hidden" name="qna_re_seq" value="<%=qna.getQna_re_seq()%>">
			<table>
				<tr>
					<td class="td_left"><label for="member_id">관리자</label></td>
					<td class="td_right"><input type="text" name="member_id"  required="required" /></td>
				</tr>
				<!-- 답글 작성 시 원본글의 제목, 내용은 표시 -->
				<tr>
					<td class="td_left"><label for="qna_subject">제목</label></td>
					<td class="td_right"><input type="text" name="qna_subject" value="Re:<%=qna.getQna_subject() %>"required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_content">내용</label></td>
					<td class="td_right">
						<textarea id="qna_content" name="qna_content" cols="40" rows="15" required="required">
						----- 원본 글 내용 ------
						<%=qna.getQna_content() %>
						</textarea>
					</td>
				</tr>
				
			</table>
			<section id="commandCell">
				<input type="submit" value="답글등록">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type ="button" value ="취소" onclick ="history.back()">  
			</section>
		</form>
	</section>
	
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
	
</body>
</html>