<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%
String sId = (String) session.getAttribute("sId");
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

	<section id="articleForm">
		<h2>qna 글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
				
					<tr>
						<td>${qna.getQna_idx() }</td>

						<td><select name="classify">
								<option value="${qna.qna_type}"><c:if test ="${qna.qna_type eq choice}">selected="selected" </c:if>${qna.qna_type}</option>
								<option name ="bugReport" value="bugReport"><c:if test ="${qna.qna_type eq bugReport}">selected="selected" </c:if>${qna.qna_type}</option>
								<option name="userReport" value="userReport"><c:if test ="${qna.qna_type eq userReport}">selected="selected" </c:if>${qna.qna_type}</option>
						</select></td>
					<th width="70">제 목</th>
					<td colspan="3">${qna.getQna_subject() }</td>
				</tr>
				<tr>
					<th width="70">작성자</th>
					<td>${sId }</td>
					<th width="70">작성일</th>
					<td>${qna.getQna_date() }</td>
				</tr>
			</table>
		</section>
		<section id="articleContentArea">${qna.getQna_content()}</section>
		
		<input type="button" value="목록" onclick="location.href='AdminQNAList.admin'"> 
		<input type="button" value="수정" class="btn" onclick="location.href='AdminQNAModifyForm.admin?qna_idx=${qna.getQna_idx() }'"> 
		<input type="button" value="삭제" class="btn" onclick="location.href='AdminQNADeletePro.admin?qna_idx=${qna.getQna_idx() }&page=${param.page }'"> 
		<input type="button" value="답변" class="btn" onclick="location.href='AdminQNAReplyForm.admin?qna_idx=${qna.getQna_idx() }&page=${param.page }'">
	</section>

	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>