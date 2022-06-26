<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::결제하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#coupon_idx").on("change", function() {
			if($("#coupon_idx option:selected").text() === '쿠폰 선택') {
				$("#coupon_select_result").html('없음');	
			} else {
				$("#coupon_select_result").html($("#coupon_idx option:selected").text()+"원");
			}
			let coupon_price = $("#coupon_idx option:selected").text().split("/")[1];
			let total_price = ${itemDetail.item_price * param.ord_quantity } - coupon_price;
			if($("#coupon_idx option:selected").text() === '쿠폰 선택') {
				$("#totalPrice").html("<fmt:formatNumber value='${itemDetail.item_price * param.ord_quantity  }' pattern='#,###.##'/></span>원</span>");
			} else {
				$("#totalPrice").html("${itemDetail.item_price * param.ord_quantity  }원 - " + coupon_price + "원 = " + total_price + "원")
			} 
			
		});
	});
</script>

<style type="text/css">

h2{

	font-family: 'Cafe24Ohsquare';

}

@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{

font-family: 'IBMPlexSansKR-Regular';
font-size: large;

}
.item-box img {
	width: 300px;
	height: 300px;
}
.item-box {
	width: 100%; 
	text-align: center;
}
</style>
<!-- <link rel="stylesheet" -->
<%-- 	href="${path}/resources/css/style.css" --%>
<!-- 	type="text/css"> -->
</head>
<body>
<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	<div class="paymentBody">
		<div class="middle">
			<div class="ordTitle">
				<h2 class="title" style="font-family:'Cafe24Ohsquare';">주문 / 결제</h2>
			</div>
			<form action="PayItem" method="post">
				<input type="hidden" name="ord_quantity" value="${param.ord_quantity }">
				<input type="hidden" name="item_price" value="${itemDetail.item_price }">
				<input type="hidden" name="item_idx" value="${itemDetail.item_idx }">
				<div class="customer">
					<div class="customer__root" style="margin-top: 30px;">
						<h2 class="customer__h2" style="font-family:'IBMPlexSansKR-Regular';">구매자 정보</h2>
						<table class="customer__table">
							<tbody>
								<tr>
									<td class="customer__col customer__col--1" >아이디</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_id }</td>
								</tr>
								<tr>
									<td class="customer__col customer__col--1" >이메일</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_email }</td>
								</tr>
								<tr>
									<td class="customer__col customer__col--1" >휴대폰번호</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_phone }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="item" style="position: relative;">
					<div class="item-info__retail" style="margin-top: 8px;">
						<div class="retailGroupTitle">상품 정보</div>
						<div class="GroupBox">
							<div class="whenDelivery">
								<span class="whenDelivery-info"> 
									<span class="delivery-date"><strong> </strong></span>
								</span>
							</div>
							<div class="item-list">
								<div class="item-box">
<!-- 									<table class="item-box-table"> -->
<!-- 										<tr> -->
<!-- 											<td> -->
												<c:choose>
													<c:when test="${itemDetail.img_name ne null }">
														<img src="${path }/resources/upload/file/${itemDetail.img_name }">
													</c:when>
													<c:when test="${itemDetail.get('img_name') eq null }">
														<img src="resources/default_img.png">
													</c:when>
												</c:choose>
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 											</table> -->
										<ul style="text-align: center;">
											<li style="font-weight: bolder;"> 【 상품 이름 】 </li> 
											<pre style="font-size: medium;">${itemDetail.item_title }</pre>
																							
											
											<li style="font-weight: bolder;"> 【 수량 】 </li>
											<pre>${param.ord_quantity } 개	</pre>
											
											<li style="font-weight: bolder;">【 주문 요청 사항 】</li>
											<li><textarea name="ord_reqContent" rows="5" cols="40" placeholder="요구사항을 입력하세요."></textarea></li>
											
										</ul>
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 										</tr> -->
								
<!-- 									<div class="item-title"> -->
<!-- 										<p style="font-size: 16px; color: #111;"> -->
<%-- 											<span class="item-condition">${itemDetail.item_title }</span> --%>
<!-- 										</p> -->
<!-- 									</div> -->
<!-- 									<div class="item-title"> -->
<!-- 										<p style="font-size: 10px; color: #fff;"> -->
<%-- 											<span class="item-condition">${itemDetail.shop_name }</span> --%>
<!-- 										</p> -->
<!-- 									</div> -->
								</div>
							</div>
<!-- 							<div> -->
<!-- 								주문 요청 사항 -->
<!-- 								<textarea name="ord_reqContent" rows="" cols="">요구사항 적으세여</textarea> -->
<!-- 							</div>  -->
						</div>
					</div>
				</div>
				<br>
				<div class="order-section orderBox mb10 multiple-coupon">
					<h2 class="checkout__h2" style="font-family:'IBMPlexSansKR-Regular';'">결제 정보</h2>
					<table class="pay-price">
						<colgroup>
							<col width="144">
							<col>
						</colgroup>
						<tbody>
						<tr class="payType-wrap">
								<th class="wrap-title">보유 코인</th>
								<td class="inputWrap payType" style="padding: 0 15px;">
<%-- 															<strong>${balanceCoin }원</strong> --%>
															<strong><fmt:formatNumber value="${balanceCoin }" pattern="#,###.##"/>원</strong>
									</td>
								</tr>
						
							<tr class="payOrder-wrap">
								<th class="wrap-title" scope="row">상품 가격 <input
									type="hidden" value="총상품가격받아오기">
								</th>
								<td>
									<div class="payOrder">
										<strong class="price"> 
<%-- 										<span id="totalPriceDisp" class="use-calculation-for-totalprice"> ${itemDetail.item_price * param.ord_quantity  } </span>  --%>
										<span id="totalPriceDisp" class="use-calculation-for-totalprice"><fmt:formatNumber value="${itemDetail.item_price * param.ord_quantity  }" pattern="#,###.##"/></span>
										<span class="unit">원</span>
										</strong>
									</div>
								</td>
							</tr>
							<tr>
								<th class="wrap-title" scope="row">할인쿠폰</th>
								<td>
									<div class="payCoupon">
										<div style="display: inline-block;">
<!-- 											<strong>  -->
												<select name="coupon_idx" id="coupon_idx">
													<option value="0">쿠폰 선택</option>
													<c:forEach items="${coupons }" var="coupon">
														<option value="${coupon.coupon_idx }">${coupon.coupon_title } / ${coupon.coupon_price }</option>
													</c:forEach>
												</select><br>
	<!-- 											<SPAN CLASS="VALUE USE-CALCULATION-FOR-TOTALPRICE">쿠폰가격받아오기</SPAN> -->
												<b>선택된 쿠폰</b>
												<span id="coupon_select_result">없음</span>
<!-- 											</strong> -->
										</div>
									</div>
									<div class="coupon-selector coupon-selecter">
										<!-- 여기다가 쿠폰 뭐 어떻게 적용 가능 할텐데.. 나는 잘 모르게따 ㅜ -->
										<ul class="coupons" style="list-style: none;">
											<!-- 여기다가 쿠폰 리스트 만들면 될 것 같은데.. -->
										</ul>
									</div>
								</td>
							</tr>
							<tr>
							</tr>
							<tr>
								<th class="wrap-title">총 결제 금액</th>
								<td>
									<div class="payPrice">
										<span id="totalPrice"><span id="totalPriceDisp" class="use-calculation-for-totalprice"><fmt:formatNumber value="${itemDetail.item_price * param.ord_quantity  }" pattern="#,###.##"/></span>원</span>
									</div>
								</td>
							</tr>
							
							
							</tbody>
						</table>
					</div>
					<br>
					<br>
					<div class="orderBox wrap-order-agree">
						<div class="agreeBtn">
							<input type="image" src="${path }/resources/img/btn_payment.gif" width="260" height="60" alt="결제하기">
<%-- 							<img src="${path }/resources/img/btn_payment.gif" width="260" height="60" alt="결제하기"> --%>
							</div>
						</div>
					</form>
				</div>
			</div>



	<div class="clear">
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>