<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.search ne null}">
	<c:set var="search" value="${param.search}"/>
	<c:set var="searchType" value="${param.searchType}"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<title>회원 관리</title>
<link rel="stylesheet" href="resources/css/admin_table.css" />
<style type="text/css">
	p {
		margin-top: 34px;
		margin-bottom: 8px;
	}
	a {
		color: inherit;
		text-decoration: none;
	}
	a:hover {
		color: #c7c3c3;
	}
</style>
<script type="text/javascript">

	//회원 되돌리기
	function confirmBack(member_id, page){
		var exitConfirm = confirm("회원 상태를 되돌리시겠습니까?");
		
		if(exitConfirm){
			location.href="./AdminMemberBack?member_id=" + member_id + "&page=" + page;
		} 
	}

	// 회원 탈퇴
	function confirmExit(member_id, page){
		var exitConfirm = confirm("탈퇴회원의 정보를 삭제하시겠습니까?" + '\n' + "탈퇴한 아이디는 복원하실 수 없습니다.");
		
		if(exitConfirm){
			location.href="./AdminMemberExit?member_id=" + member_id + "&page=" + page;
		} 
	}

</script>
</head>
<body>

	<!-- JSTL 사용해 PageInfo 객체 값을 변수에 저장 -->
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />

	<!-- 헤더 -->
	<div>
		<jsp:include page="../admin_css/sidebar.jsp"/>
	</div>
	
	<div class="body">
		<h2><a href="./AdminMemberList">MEMBER</a> &nbsp; / &nbsp; <a href="./AdminExitMemberList">탈퇴회원조회</a></h2>
		
		<p>탈퇴 회원 수 : ${listCount }</p>
			
		<hr>

		<!-- 회원리스트 테이블 -->
		<table class="type04" style="margin-top: 32px">
			<tr>
				<th width="100" >아이디</th>
				<th width="100" >닉네임</th>
				<th width="200" >Phone</th>	
				<th width="200" >E-Mail</th>
				<th width="150" >가입일</th>
				<th width="150" >회원상태</th>
				<th width="100" >관 리</th>
			</tr>
			<c:if test="${not empty exitList and pageInfo.getListCount() > 0}">
					<c:forEach var="member" items="${exitList }">
						<tr> 
							<td>${member.member_id }</td>
							<td>${member.member_nick }</td>
							<td>${member.member_phone }</td>
		 					<td>${member.member_email }</td>
							<td>${member.member_date }</td>
							<td>${member.member_status }</td>
							<td>
								<input type="button" id="search_btn" value="되돌리기" onclick="confirmBack('${member.member_id }', '${pageInfo.pageNum }' )">
								<input type="button" id="search_btn" value="정보삭제" onclick="confirmExit('${member.member_id }', '${pageInfo.pageNum }' )">
							</td> 
						</tr> 
					</c:forEach>
				</c:if>
		</table>


<!-- 페이징 처리 -->
	<section class="paging">
		<!-- [이전] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  value=" < " onclick="location.href='AdminMemberList?page=${pageNum - 1}<c:if test="${search ne null }">&search=${search }&searchType=${searchType }</c:if>'">
			</c:when>
			<c:otherwise>
				<input type="button"  value=" < " disabled="disabled">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="AdminMemberList?page=${i }<c:if test="${search ne null }">&search=${search }&searchType=${searchType }</c:if>">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value=" > " onclick="location.href='AdminMemberList?page=${pageNum + 1}<c:if test="${search ne null }">&search=${search }&searchType=${searchType }</c:if>'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" > " disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>
	
	
	
</div>	<!-- .body -->

</body>
</html>