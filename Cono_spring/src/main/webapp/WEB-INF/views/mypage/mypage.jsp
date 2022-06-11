<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/style.css" rel="stylesheet" />
<script src="${path}/resources/js/jquery-3.6.0.js"></script>

</head>
<body>
		<jsp:include page="../header_footer/top.jsp" />

<img alt="" src="${path }/resources/upload/test.jpg">
<img alt="" src="${path }/resources/upload/file/${card.img_name }'/>">
<img alt="" src="${path }/resources/upload/file/${card.img_name }'/>">

<!-- 	=============================== main (내 정보 section) start =============================== -->
	<div class="main__content">
		<div class="main__content-inner">
			<section class="main1">
				<div class="title-style-bar">
					<h1 class="txt">내 정보</h1>
					<span class="subtxt" style="box-sizing: border-box;"></span>
				</div>
				<ul class="main__content-list">
					<li>
					<strong class="label">Cono Coin</strong>
					<a href="coin" class="value">${coin_total}c</a>
					</li>
					<li>
					<strong class="label">예약 상품 수</strong>
					<a href="reserved" class="value">${reservedCount}</a>
					</li>
					<li>
					<strong class="label">쿠폰 수</strong>
					<a href="coupon" class="value">${couponCount}</a>
					</li>
					<li>
					<strong class="label">장바구니 상품 수</strong>
					<a href="basket" class="value">${basketCount}</a>
					</li>	
				</ul>
			</section>
		</div>
	</div>
<!-- 	=============================== main (내 정보 section) end =============================== -->
	
	
<!-- 	=============================== leftbar start =============================== -->
		<div class="plus" style="bottom: 200px;">
			<jsp:include page="./mypage_sidebar.jsp" />
		</div>
<!-- 	=============================== leftbar end =============================== -->	
	
<!-- 	=============================== main (주문 정보 section) start =============================== -->

	<div class="tabmain">
		<h4>최근 주문 내역</h4><br><br>
	    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	    <label for="tab1">거래중</label>
	
	    <input id="tab2" type="radio" name="tabs">
	    <label for="tab2">거래 완료</label>
	
	    <input id="tab3" type="radio" name="tabs">
	    <label for="tab3">취소 / 환불</label>
	
	    <section id="content1">
	        <p>배송중인 상품이 존재하지 않습니다.</p>
	    </section>
	
	    <section id="content2">
	        <p>배송 완료된 상품이 존재하지 않습니다.</p>
	    </section>
	
	    <section id="content3">
	        <p>취소 / 환불 된 상품이 존재하지 않습니다.</p>
	    </section>
	</div>
<!-- 	=============================== main (주문 정보 section) end =============================== -->
	<footer style="position: relative; bottom: 600px;">	
		<jsp:include page="../header_footer/bottom.jsp" />
	</footer>

</body>
</html>