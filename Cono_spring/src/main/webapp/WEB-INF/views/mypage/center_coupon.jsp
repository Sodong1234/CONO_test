<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp" />
		<jsp:include page="./mypage_sidebar.jsp" />
	</div>

	<!-- 	=============================== coupon start =============================== -->
	<section class="couponSection">
		<div class="title-style no-mt clf">
			<a href="#" class="txt fl">쿠폰함</a>
		</div>
		<div class="segment">
			<h2 class="segment__title">쿠폰코드를 등록해주세요.</h2>
			<form method="post" class="insertCoupon">
				<input type="text" placeholder="쿠폰코드 입력">
				<button type="submit" class="ui_btn--red">등록</button>
			</form>
		</div>
		<div class="blank"></div>
		<div class="container">
			<c:forEach var="coupon" items="${couponList }">
				<div class="coupon-list">
					<div class="coupon">
						<div class="coupon__dotted-line top"></div>
						<div class="coupon__dotted-line bottom"></div>
						<div class="coupon-contents">
							<div class="coupon-contents__header">
								<img src="${path }/resources/img/coupon.png" class="coupon-contents__thumbnail-img">
								<div class="coupon-contents__title">${coupon.coupon_title }</div>
							</div>
							<div class="coupon-contents__body">
								<div class="coupon-contents__discount-value">
									${coupon.coupon_price } <span style="font-size: 24px;">원</span>
								</div>
								<div class="coupon-contents__discount-condition">
									${coupon.coupon_content }
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<h2 class="title2-style">안내사항</h2>
		<div class="content-box">
			<p>할인쿠폰은 <span class="c-point">배송비를 제외한 상품 금액 기준</span>으로 적용됩니다.</p>
			<p><span class="c-point">장바구니에서 상품 별로 1개의 쿠폰만 적용 가능</span>합니다.</p>
			<p>Cono 쿠폰은 <span class="c-point">주문결제 단계에서 주문 건당 1개의 쿠폰만 적용 가능</span>합니다.</p>
			<p>쿠폰은 구매하신 상품 별 <span class="c-point">구매금액 비율로 최종 할인이 적용</span>됩니다.</p>
		</div>
	</section>

	<!-- 	=============================== coupon end =============================== -->
	<footer>
		<jsp:include page="../header_footer/bottom.jsp" />
	</footer>
</body>
</html>