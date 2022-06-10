<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function dealCancel(item_idx, coin_use, safe_status, page){
		var dealConfirm = confirm("거래 취소 하시겠습니까?" + '\n' + "거래를 되돌릴 수 없습니다.");
		
		if(dealConfirm){
			location.href="AdminDealCancel.admin?item_idx=" + item_idx + "&coin_use=" + coin_use + "&safe_status=" + safe_status+ "&page=" + page;
		}
	}

</script>
</head>
<body>
	<!-- PageInfo 객체 값 변수에 저장 -->
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

	<h2>관리자 거래 관리 페이지</h2>

	현재 거래 수 : ${listCount }
	<table class="type04">
		<tr>
			<th>All<input type="checkbox" name="check_all" value="1"></th>
			<th>상품명</th>
			<th>상품번호</th>
			<th>판매자</th>
			<th>구매자</th>
			<th>보관중 코인</th>
			<th>거래 날짜</th>
			<th>거래상태</th>
			<th>거래취소</th>
		</tr>
		
		<c:if test="${not empty dealList and pageInfo.getListCount() > 0 }">
			<c:forEach var="product" items="${dealList }">
				<tr>
					<td><input type="checkbox" name="chk"></td>
					<td>${product[0] }</td>
					<td>${product[1] }</td>
					<td>${product[2] }</td>
					<td>${product[3] }</td>
					<td>${product[4] }</td>
					<td>${product[5] }</td>
					<td>${product[6] }</td>
					<td><input type="button" value="거래취소" onclick="dealCancel('${product[1] }', '${product[4] }', '${product[6] }','${pageInfo.getPageNum() }')"></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<!-- 페이징 처리 -->
	<section>
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='AdminDealList.admin?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="AdminDealList.admin?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value="다음" onclick="location.href='AdminDealList.admin?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>


<!-- 	<div> -->
<%-- 		<jsp:include page="../HeaderFooter/bottom.jsp" /> --%>
<!-- 	</div> -->
	
	
	</div>
</body>
</html>