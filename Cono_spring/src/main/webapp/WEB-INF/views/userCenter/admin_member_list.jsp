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
<title>CONO::회원관리</title>
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

	// 회원 탈퇴
	function confirmExit(member_id, page){
		var exitConfirm = confirm("아이디 정지를 진행하시겠습니까?" + '\n' + "정지된 아이디는 서비스를 사용하실 수 없습니다.");
		
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
		<h2><a href="./AdminMemberList">MEMBER</a> &nbsp; / &nbsp; <a href="./AdminExitMemberList">정지회원보기</a></h2>
		
		<p>현재 회원 수 : ${listCount }</p>
			
		<hr>
		
	<!-- 검색 기능 -->
		<div id="member_search">
			<form>
				<input type="hidden" name="pageNum" value="${pageNum}">
				<select name="searchType" class="ssearch">
					<option value="">선택</option>
					<option value="id" <c:if test="${searchType ne null and searchType eq 'id'}">selected</c:if>>아이디</option>
					<option value="nick" <c:if test="${searchType ne null and searchType eq 'nick'}">selected</c:if>>닉네임</option>
					<option value="shop" <c:if test="${searchType ne null and searchType eq 'shop'}">selected</c:if>>전화번호</option>
				</select>
				<input type="text" name="search" value="<c:if test="${search ne null}">${search }</c:if>" placeholder="검색어를 입력하세요">
				<input type="submit" id="search_btn" value="검색">
			</form>
		</div>
	
		<!-- 회원리스트 테이블 -->
		<table class="type04">
			<tr>
				<th width="100" >아이디</th>
				<th width="100" >닉네임</th>
				<th width="100" >shopName</th>
				<th width="150" >Coin Total</th>
				<th width="200" >Phone</th>	
				<th width="200" >E-Mail</th>
				<th width="150" >가입일</th>
				<th width="150" >회원상태</th>
				<th width="100" >관 리</th>
			</tr>
			<c:if test="${not empty memberList and pageInfo.getListCount() > 0}">
					<c:forEach var="member" items="${memberList }">
						<tr> 
							<td>${member.member_id }</td>
							<td>${member.member_nick }</td>
							<td>${member.shop_name }</td>
							<td>${member.coin_total }</td>
							<td>${member.member_phone }</td>
		 					<td>${member.member_email }</td>
							<td>${member.member_date }</td>
							<td>${member.member_status }</td>
							<td>
								<input type="button" id="search_btn" value="정지" onclick="confirmExit('${member.member_id }', '${pageInfo.pageNum }' )">
							</td> 
						</tr> 
					</c:forEach>
				</c:if>
		</table>


<!-- 페이징 처리 -->
	<section class="paging" style="margin-bottom: 60px">
		<!-- [이전] 링크 동작 -->
		<c:choose>
			<c:when test="${pageInfo.pageNum > 1 }">
				<input type="button" value=" < " onclick="location.href='AdminMemberList?pageNum=${pageInfo.pageNum - 1 }'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" < ">
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<c:choose>
			<c:when test="${pageInfo.pageNum eq i }">
				${i }
			</c:when>
			<c:otherwise>
				<a href="AdminMemberList?pageNum=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageInfo.pageNum < pageInfo.maxPage }">
				<input type="button" value=" > " onclick="location.href='AdminMemberList?pageNum=${pageInfo.pageNum + 1 }'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" > ">
			</c:otherwise>
		</c:choose>
	</section>
	
	
	
</div>	<!-- .body -->

</body>
</html>