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
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp" />
	</div>

<div class="plus">
	<div class="main1">
<!-- 	=============================== main (내 정보 section) start =============================== -->
		<table border="1">
			<tr>
				<th colspan="4" style="width: 850px; height: 60px;"><h4>내 정보</h4></th>
			</tr>
			<tr>
				<td style="height: 140px;"><a href="coin"><h4>Cono Coin</h4></a><br>${coin_total}</td>
				<td><a href="coupon"><h4>할인 쿠폰 수</h4></a><br>${couponCount}</td>
				<td><a href="reserved"><h4>예약중인 상품</h4></a><br>${reservedCount}</td>
				<td><a href="basket"><h4>장바구니</h4></a><br>${basketCount}</td>
			</tr>
		</table>
	</div>
<!-- 	=============================== main (내 정보 section) end =============================== -->
	
	
<!-- 	=============================== leftbar start =============================== -->
	<div id="wrap">
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
	<br>
<!-- 	=============================== main (주문 정보 section) end =============================== -->	
<!-- 	=============================== main (팔로우&팔로워 section) start =============================== -->
	<div class="tabmain2">
		<h4>팔로잉 & 팔로워</h4><br><br>
	    <input id="tab11" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	    <label for="tab11">팔로우중인 상점</label>
	
	    <input id="tab22" type="radio" name="tabs">
	    <label for="tab22">팔로워</label>
	
	    <section id="content11">
	        <p>x개의 상점을 팔로우 중입니다.</p>
	        <p>팔로우중인 상점 정보 출력</p>
	    </section>
	
	    <section id="content22">
	        <p>x명이 나의 상점을 팔로우 중입니다.</p>
	        <p>나를 팔로우하는 유저 정보 출력</p>
	    </section>
	</div>
</div>
<!-- 	=============================== main (팔로우&팔로워 section) end =============================== -->
	<div class="clear">
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>

</body>
</html>