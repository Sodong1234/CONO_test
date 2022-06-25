<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::거래취소</title>
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
.cancel {
	line-height: 20px;
}
</style>
<script type="text/javascript">
	// 거래 취소
	function dealCancel(item_idx, coin_use, safe_status, page){
		var dealConfirm = confirm("거래 취소 하시겠습니까?" + '\n' + "거래를 되돌릴 수 없습니다.");
		
		if(dealConfirm){
			location.href="./AdminDealCancel?item_idx=" + item_idx + "&safe_coin=" + safe_coin + "&safe_status=" + safe_status + "&page=" + page;
		}
	}

</script>
</head>
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="../admin_css/sidebar.jsp"/>
	</div>
	
	<!-- PageInfo 객체 값 변수에 저장 -->
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />
	
<div class="body">

	<h2><a href="./AdminDealList">거래 현황</a> &nbsp; / &nbsp; <a href="./AdminDealCancelList" class="cancel">거래취소요청</a></h2>

	<p>거래 취소 요청 : ${listCount }</p>
	
	<hr>
	
	<table class="type04" style="margin-top: 32px">
		<tr>
			<th width="150">상품명</th>
			<th width="100" >상품번호</th>
			<th width="100" >취소요청일</th>
			<th width="200">사유</th>
			<th width="100">구매자</th>
			<th width="100">판매자</th>
			<th width="100" >거래코인</th>
			<th width="100">거래취소</th>
		</tr>
		
		<c:if test="${not empty dealList and pageInfo.listCount > 0 }">
			<c:forEach var="product" items="${cancelList}">
				<tr>
					<td><a href="" class="title">${product.item_title }</a></td>
					<td>${product.item_idx }</td>
					<th>${product.cancel_date }</th>
					<td>${product.cancel_content }</td>
					<td>${product.buyer}</td>
					<th>${product.seller }</th>
					<td>${product.safe_coin }</td>
					<td><input type="button" id="search_btn" value="거래취소" onclick="dealCancel('${product.item_idx }', '${product.safe_coin }', '${product.item_status }','${pageInfo.pageNum }')"></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<!-- 페이징 처리 -->
	<section class="paging">
		<!-- [이전] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value=" < " onclick="location.href='AdminDealList?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" < " disabled="disabled">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="AdminDealList?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value=" > " onclick="location.href='AdminDealList?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" > " disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>

	
	
	</div>
</body>
</html>