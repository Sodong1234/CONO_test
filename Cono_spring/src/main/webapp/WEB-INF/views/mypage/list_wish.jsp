<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:위시리스트</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
		<jsp:include page="./mypage_sidebar.jsp" />
		<jsp:include page="../search/recentView.jsp" />	
	</div>

	<div class="inner-w layout-split">
		<section style="position: relative; left: 400px; bottom: 1000px;">
			<div class="title-style watch-list-title--favorite">
				<h2 class="txt">위시리스트</h2>
				<br>
			</div>
			<div class="ui_grid mt10">
				<div class="ui_grid__cols--4">
				<c:choose>
					<c:when test="${wishList eq null }">
					회원님께서 찜한 상품이 존재하지 않습니다.
					</c:when>
					<c:when test="${wishList ne null }">
					<c:forEach var="wish" items="${wishList}">
						<div class="ui_grid__item">
							<div class="base-card card--vertical product">
								<a href="#" style="text-decoration: none;">
									<div class="card-thumb-cover">
										<!-- 									<div class="product-thumb-img" style="background-image: url('resources/upload/file/${wish.img_name}");"></div> -->
									<a href="itemDetail?item_idx=${wish.item_idx}">
										<img alt=""
											src="<spring:url value='/resources/upload/file/${wish.img_name}'/>">
									</a>
									</div>
									<div class="card-info product-info">
										<div class="product-info__name">${wish.item_title}</div>
										<div class="product-info__price">
<%-- 											<span class="price-origin"> ${wish.item_price}  --%>
											<span class="price-origin"><fmt:formatNumber value="${wish.item_price}" pattern="#,###.##"/>
											<span style="font-size: 14px;">원</span>
											</span>
										</div>
										<br>
										<div class="product-info__badge-group">
											<div class="badge badge-new">${wish.item_region}</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
					</c:when>
					</c:choose>
				</div>
			</div>
		</section>
	</div>

	<footer style="position: relative; bottom: 200px;">
		<jsp:include page="../header_footer/footer.jsp" />
	</footer>
</body>
</html>