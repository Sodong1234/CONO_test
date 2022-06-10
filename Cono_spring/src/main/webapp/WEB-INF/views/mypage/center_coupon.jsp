<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/style.css"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp" />
		<jsp:include page="./mypage_sidebar.jsp"/>
	</div>

	<!-- 	=============================== coupon start =============================== -->
	<div class="coupon">
		<h3>쿠폰</h3>
		<br>
		<div class="couponnumbercheck">
			쿠폰코드를 등록해주세요.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
				placeholder="쿠폰코드 입력">
			<button type="submit">등록</button>
		</div>
		<div class="havecoupon">
			<tr>
				<th colspan="3">사용가능한 쿠폰</th>
			</tr>
			<table border="1">
				<c:forEach var="coupon" items="${couponList }">
					<tr>
						<td>${coupon.coupon_title }</td>
						<td>${coupon.coupon_price }</td>
						<td>${coupon.coupon_content }</td>
					</tr>
					<br>
			</table>
			</c:forEach>
		</div>
		<br> <br>
		<h5 style="margin-top: 60px;">안내사항</h5>
		<br>
		<ul class="couponnotice">
			<li>할인쿠폰은 <span class="c-point">배송비를 제외한 상품 금액 기준</span>으로
				적용됩니다.
			</li>
			<li><span class="c-point">장바구니에서 상품 별로 1개의 쿠폰만 적용 가능</span>합니다.</li>
			<li>Cono 쿠폰은 <span class="c-point">주문결제 단계에서 주문 건당 1개의
					쿠폰만 적용 가능</span>합니다.
			</li>
			<li>쿠폰은 구매하신 상품 별 <span class="c-point">구매금액 비율로 최종 할인이
					적용</span>됩니다.
			</li>
		</ul>
	</div>
	<!-- 	=============================== coupon end =============================== -->
	<div id="wrap">
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</body>
</html>