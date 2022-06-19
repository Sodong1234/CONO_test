<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#item_review_list {
/* 	background: #cdf0ea; */
	padding: 30px 30px 10px 30px;
	border-radius: 10px;
	border-collapse: collapse;
	line-height: 75px;
}
#review_list tr {
	background: #e1f3f0;
 	height: 20px; 
}
</style>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$("#prev_btn").on("click", function() {
// 			$.ajax({
// 				type: "GET",
// 				url: "shopReview",
// 				dataType: "text",
// 				data: {
// 					pageNum : ${pageInfo.pageNum - 1}
// 				}
// 			})
// 			.done(function(data) {
// 				$("#review_area").html(data);
// 			})
// 			.fail(function() {
// 				$("#review_area").html("요청 실패");
// 			});
// 		});
// 		$("#next_btn").on("click", function() {
// 			$.ajax({
// 				type: "GET",
// 				url: "shopReview",
// 				dataType: "text",
// 				data: {
// 					pageNum : ${pageInfo.pageNum + 1}
// 				}
// 			})
// 			.done(function(data) {
// 				$("#review_area").html(data);
// 			})
// 			.fail(function() {
// 				$("#review_area").html("요청 실패");
// 			});
// 		});
// 	});
	
</script>
</head>
<body>
	<div id="item_review_list">
		<table id="review_list" style="width: 100%;">
			<c:forEach items="${reviewList }" var="review">
				<tr>
					<td width="100px">${review.get('review_score') }</td>
					<td width="300px">${review.get('review_content') }</td>
					<td width="100px">${review.get('review_date') }</td>
					<td>${review.get('member_id') }</td>
				</tr>
				<tr>
				</tr>
			</c:forEach>
		</table>
	</div>
		
<!-- 		<!-- 페이징 처리 -->
<!-- 		<section class="paging"> -->
<!-- 			<!-- [이전] 링크 동작 -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${pageInfo.pageNum > 1}"> --%>
<%-- 					<input id="prev_btn" type="button" value=" < " onclick="location.href='shopReview?pageNum=${pageInfo.pageNum - 1}'"> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 					<input type="button" value=" < " disabled="disabled"> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
				
<!-- 			<!-- 페이지 번호 -->
<%-- 			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${pageInfo.pageNum eq i}"> --%>
<%-- 						${i } --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<a id="page_btn" href="shopReview?pageNum=${i }">${i }</a> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach> --%>
	
<!-- 			<!-- [다음] 링크 동작 -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${pageInfo.pageNum < pageInfo.maxPage}"> --%>
<%-- 					<input id="next_btn" type="button" value=" > " onclick="location.href='shopReview?pageNum=${pageInfo.pageNum + 1}'"> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<input type="button" value=" > " disabled="disabled"> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 		</section> -->
</body>
</html>