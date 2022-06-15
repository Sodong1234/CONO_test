<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}

String keyword = request.getParameter("keyword");
String sell_status = request.getParameter("sell_status");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_mng.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="js/jquery-3.6.0.js"></script>
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/css/item_mng.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
</head>

<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	
	<aside class="side">
		<ul class="side-list">
			<li>
			  <a class="nav-link active" aria-current="page" href="ProductMyshop.shop">내 상점</a>
			  <a class="nav-link" href="ItemUploadForm.shop">상품 등록</a>
			  <a class="nav-link" href="ItemMng.shop">상품 관리</a>
			  <a class="nav-link" href="ItemReviewMng.shop">상품 후기 관리</a>
			  <a class="nav-link" href="ItemOrdMng.shop">상품 주문 관리</a>
			  <a class="nav-link" href="follow">팔로우 상점</a>
			  </li>
		</ul>
	</aside>
			
	<div class="float-end">
			<div class="row mb-4 float-end" style="width:500px;margin-top:5px;" id="search_row">
				<form name="fr" action="ItemMng.shop" class="input-group">
					<input type="text" class="form-control" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>>
					<select class="form-select"  name="sell_status">
						<option value="" <%if(sell_status != null && sell_status.equals("")) { %> selected="selected" <%} %>>전체</option>
						<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>판매 중</option>
						<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 완료</option>
					</select>
						<button type="submit" class="btn btn-outline-primary">
							<i class="bi bi-search"></i>
						</button>
				</form>
			</div>
	<!-- 		<form action="ItemMng.shop" class="input-group"> -->
	<!-- 			<div class="col"> -->
	<%-- 				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>> --%>
	<!-- 			</div> -->
	<!-- 			<div class="col"> -->
	<!-- 				<select class="form-select" name="sell_status"> -->
	<%-- 					<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>전체</option> --%>
	<%-- 					<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 중</option> --%>
	<%-- 					<option value="2" <%if(sell_status != null && sell_status.equals("2")) { %> selected="selected" <%} %>>판매 완료</option> --%>
	<!-- 				</select> -->
	<!-- 			</div> -->
	<!-- 			<div class="col"> -->
	<!-- 				<input type="submit" class="btn btn-outline-secondary" id="search" value="검색"> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-6"></div> -->
	<!-- 		</form> -->
		</div>
<!-- 		<form action="ItemMng.shop"> -->
<%-- 			<input type="text" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>> --%>
<!-- 			<select name="sell_status"> -->
<%-- 				<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>전체</option> --%>
<%-- 				<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 중</option> --%>
<%-- 				<option value="2" <%if(sell_status != null && sell_status.equals("2")) { %> selected="selected" <%} %>>판매 완료</option> --%>
<!-- 			</select> -->
<!-- 			<input type="submit" id="search" value="검색"> -->
<!-- 		</form> -->
		<div class="clearfix"></div>
			<div class="row mb-4" id="list_row" style="width: 1020px;">
				<table class="table table-hover lh-lg text-center" style="border:1px 0;border-color:bg-primary"; >
					<tr class="border-top border-bottom border-primary pe-none">
						<th width="100px">상품번호</th>
						<th width="200px">상품이미지</th>
						<th width="200px">상품명</th>
						<th width="110px">가격</th>
						<th width="110px">상품 등록일</th>
						<th width="100px">판매 상태</th>
						<th width="100px">찜</th>
						<th width="100px">조회수</th>
						<th width="100px">숨김</th>
					</tr>
					
					<!--수정이 가능한 (판매자가 보는) 상품 상세 페이지로 이동 -->
					<c:forEach items="${itemList}" var="item">
						<tr class="align-middle">
							<td>${item.get("item_idx") }</td>
							<td>
								<c:choose>
									<c:when test="${item.get('img_name') ne null }">
										<img src="resources/upload/file/${item.get('img_name') }">
									</c:when>
									<c:when test="${item.get('img_name') eq null }">
										<img src="resources/default_img.png">
									</c:when>
								</c:choose>
							</td>
							<td onclick="location.href='ItemDetail.shop?item_idx=${item.get('item_idx') }'">${item.get("item_title") }</td>
							<td>${item.get("item_price") }</td>
							<td>${item.get("item_date") }</td>
							<td>${item.get("item_status") }</td>
							<td>${item.get("COUNT(w.member_id)") }</td>
							<td>${item.get("item_readCnt") }</td>
							<td><input type="checkbox" name="item_hide" class="item_hide" <c:if test="${item.get('item_hide') eq 'Y'}"> checked="checked"</c:if>
							     onchange="location.href='ItemHide.shop?item_idx=${item.get('item_idx') }&item_hide=${item.get('item_hide') }'"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
<!-- 		</div> -->
<!-- 	</div> -->
	<div>
		<c:choose>
			<c:when test="${pageInfo.pageNum > 1 }">
				<input type="button" value="이전" onclick="location.href='ItemMng.shop?pageNum=${pageInfo.pageNum - 1 }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<c:choose>
			<c:when test="${pageInfo.pageNum eq i }">
				${i }
			</c:when>
			<c:otherwise>
				<a href="ItemMng.shop?pageNum=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageInfo.pageNum < pageInfo.maxPage }">
				<input type="button" value="다음" onclick="location.href='ItemMng.shop?pageNum=${pageInfo.pageNum + 1 }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="clearfix"></div>
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>