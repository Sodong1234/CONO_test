<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_qna_list.jsp</title>
</head>
<div>
	<jsp:include page="../HeaderFooter/top.jsp" />
</div>
<body>
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />
	<nav id="left_menu">
		<ul>
			<li><a href="AdminNoticeList.admin">Notice</a></li>
			<li><a href="admin_product.jsp">product</a></li>
			<li><a href="admin_member.jsp">member</a></li>
			<li><a href="AdminQNAList.admin">qna</a></li>
			<li><a href="admin_report.jsp">report</a></li>
		</ul>
	</nav>
	<hr>
	<article>
		<h1>admin_qna_list</h1>
		<table id="qna">
			<tr>
				<th class="qna_no">No.</th>
				<th class="qna_type">Classify</th>
				<th class="qna_title">Title</th>
				<th class="qna_write">Write</th>
				<th class="qna_date">Date</th>
				<th class="qna_status">status</th>

			</tr>

			<h1>~~~ qna 리스트 좌라락~~~</h1>
			<c:if test="${not empty qnaList && pageInfo.listCount > 0}">

				<c:forEach var="qna" items="${qnaList}">

					<tr>
						<td>${qna.getQna_idx() }</td>

						<td>
								${qna.qna_type }
						</td>
						<td id="subject"><a href="AdminQNAView.admin?qna_idx=${qna.getQna_idx() }&page=${pageNum}">${qna.getQna_subject() }</a></td>

						<td>${qna.getMember_id() }</td>

						<td>${qna.getQna_date() }</td>
						<td>${qna.getQna_status() }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div id="table_search">
			<input type="button" value="글쓰기" class="btn"
				onclick="location.href='AdminQNAWriteForm.admin'">

		</div>
	</article>

	<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 Prev 링크 동작
		=> 클릭 시 notice.jsp 로 이동하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button" value="이전"
					onclick="location.href='AdminQNAList.admin?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>

				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<!-- step="" 은 1씩 증가해서 생략 -->
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i }">
				${i }
			</c:when>
				<c:otherwise>

					<a href="AdminQNAList.admin?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 
		현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 다음 링크 동작
		-->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value="다음"
					onclick="location.href='AdminQNAList.admin?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>

				<input type="button" value="다음">&nbsp;
			</c:otherwise>
		</c:choose>
	</section>


	<div id="table_search">
		<form action="AdminQNASearch.admin" method="get">
			<select name="searchType">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
			</select> <input type="text" name="search" class="input_box"> <input
				type="submit" value="Search" class="btn">
		</form>

	</div>




	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>