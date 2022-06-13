<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp" />
	</div>


	<section>
		<div class="title-style watch-list-title--favorite">
			<h2 class="txt">위시리스트</h2>
		</div>
		<div class="ui_grid mt10">
			<div class="ui_grid__cols--4">
				<c:forEach var="wish" items="${wishList}">
					<div class="ui_grid__item">
						<div class="base-card card--vertical product">
							<a href="#" style="text-decoration: none;">
								<div class="card-thumb-cover">
									<div class="product-thumb-img" style="background-image: ${wish.img_real_name}"></div>
								</div>
								<div class="product-info__name">${wish.item_title}</div>
								<div class="product-info__price">
									<span class="price-origin"> ${wish.item_price} <span
										style="font-size: 14px;">원</span>
									</span>
								</div>
								<div class="product-info__badge-group">
									<div class="badge badge-new">${wish.item_region}</div>
								</div>
							</a>
						</div>
				</c:forEach>
			</div>
		</div>
		</div>
	</section>


	<div id="wrap">
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>