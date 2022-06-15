<%@page import="java.util.ArrayList"%>
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
<script type="text/javascript">
	$(function() {
		$("#coupon_idx").on("change", function() {
			$("#coupon_select_result").html($("#coupon_idx option:selected").text()+"원");
			let coupon_price = $("#coupon_idx option:selected").text().split("/")[1];
			let total_price = ${itemDetail.item_price * param.ord_quantity } - coupon_price;
			$("#totalPrice").html("${itemDetail.item_price * param.ord_quantity  }원 - " + coupon_price + "원 = " + total_price + "원")
			
			
		});
	});
</script>
<link rel="stylesheet"
	href="${path}/resources/css/style.css"
	type="text/css">
</head>
<body>
	<div class="paymentBody">
		<div class="middle">
			<div class="ordTitle">
				<h3 class="title">주문/결제</h3>
			</div>
			<form action="PayItem" method="post">
				<input type="hidden" name="ord_quantity" value="${param.ord_quantity }">
				<input type="hidden" name="item_price" value="${itemDetail.item_price }">
				<input type="hidden" name="item_idx" value="${itemDetail.item_idx }">
				<div class="customer">
					<div class="customer__root" style="margin-top: 30px;">
						<h2 class="customer__h2">구매자정보</h2>
						<table class="customer__table">
							<tbody>
								<tr>
									<td class="customer__col customer__col--1">이름</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_id }</td>
								</tr>
								<tr>
									<td class="customer__col customer__col--1">이메일</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_email }</td>
								</tr>
								<tr>
									<td class="customer__col customer__col--1">휴대전화번호</td>
									<td class="customer__col customer__col--2">${buyerInfo.member_phone }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
	<!-- 			<div class="deliveryAddress"> -->
	<!-- 				<h2 class="delivery-address__caption-header">받는사람정보</h2> -->
	<!-- 				<table class="delivery-address"> -->
	<!-- 					<tbody> -->
	<!-- 						<tr> -->
	<!-- 							<th class="delivery-address__th">이름</th> -->
	<!-- 							<td -->
	<!-- 								class="delivery-address__td delivery-address__td--name delivery-address__td-rocket-fresh-mvp2"> -->
	<!-- 								<span class="delivery-address__name">이름받아오기</span> -->
	<!-- 							</td> -->
	<!-- 						</tr> -->
	<!-- 						<tr> -->
	<!-- 							<th class="delivery-address__th">배송주소</th> -->
	<!-- 							<td class="delivery-address__td">주소받아오기</td> -->
	<!-- 						</tr> -->
	<!-- 						<tr> -->
	<!-- 							<th class="delivery-address__th delivery-address__th--no-line">연락처</th> -->
	<!-- 							<td class="delivery-address__td delivery-address__td--no-line">연락처받아오기</td> -->
	<!-- 						</tr> -->
	<!-- 					</tbody> -->
	<!-- 				</table> -->
	<!-- 			</div> -->
				<div class="item" style="position: relative;">
					<div class="item-info__retail" style="margin-top: 8px;">
						<div class="retailGroupTitle">상품정보</div>
						<div class="GroupBox">
							<div class="whenDelivery">
								<span class="whenDelivery-info"> 
									<span class="delivery-date"><strong> ${itemDetail.shop_name }</strong></span>
								</span>
							</div>
							<div class="item-list">
								<div class="item-box">
									<div class="item-title">
										<p style="font-size: 16px; color: #111;">
											<span class="item-condition"></span> ${itemDetail.item_title }
										</p>
									</div>
								</div>
							</div>
							<div>
								주문 요청 사항
								<textarea name="ord_reqContent" rows="" cols="">요구사항 적으세여</textarea>
							</div> 
						</div>
					</div>
				</div>
				<div class="order-section orderBox mb10 multiple-coupon">
					<h2 class="checkout__h2">결제정보</h2>
					<table class="pay-price">
						<colgroup>
							<col width="144">
							<col>
						</colgroup>
						<tbody>
							<tr class="payOrder-wrap">
								<th class="wrap-title" scope="row">총상품가격 <input
									type="hidden" value="총상품가격받아오기">
								</th>
								<td>
									<div class="payOrder">
										<strong class="price"> <span id="totalPriceDisp"
											class="use-calculation-for-totalprice"> ${itemDetail.item_price * param.ord_quantity  } </span> <span
											class="unit">원</span>
										</strong>
									</div>
								</td>
							</tr>
							<tr>
								<th class="wrap-title" scope="row">할인쿠폰</th>
								<td>
									<div class="payCoupon">
										<div class="price" style="display: inline-block;">
											<strong> 
												<select name="coupon_idx" id="coupon_idx">
													<option value="0"></option>
													<c:forEach items="${coupons }" var="coupon">
														<option value="${coupon.coupon_idx }">${coupon.coupon_title } / ${coupon.coupon_price }</option>
													</c:forEach>
												</select>
	<!-- 											<SPAN CLASS="VALUE USE-CALCULATION-FOR-TOTALPRICE">쿠폰가격받아오기</SPAN> -->
												선택된 쿠폰
												<span class="unit" id="coupon_select_result"></span>
											</strong>
										</div>
	<!-- 									<div class="selected-coupon"> -->
	<!-- 										<span class="message" style="padding-right: 10px;">적용 -->
	<!-- 											가능한 할인 쿠폰이 없습니다.</span> -->
	<!-- 									</div> -->
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
	<!-- 							<th class="wrap-title" scope="row">배송비</th> -->
	<!-- 							<td class="delivery-total-price"> -->
	<!-- 								<div class="payDelivery"> -->
	<!-- 									<strong class="price"> <span -->
	<!-- 										class="delivery-total-price-value use-calculation-for-totalprice">배송비 -->
	<!-- 											받아오기</span> <span class="unit">원</span> -->
	<!-- 									</strong> -->
	<!-- 								</div> -->
	<!-- 							</td> -->
							</tr>
							<tr>
								<th class="wrap-title">총결제금액</th>
								<td>
									<div class="payPrice">
										<strong class="price">
										<span class="unit" id="totalPrice"></span>
										</strong>
									</div>
								</td>
							</tr>
							<tr class="payType-wrap">
								<th class="wrap-title">결제방법</th>
								<td class="inputWrap payType" style="padding: 0 15px;">
									<div class="pay-box">
										<div class="pay-type-selector"></div>
										<div class="type-selector-list-wrapper">
											<ul class="type-selector-list">
												<li class="type-selector-li"><input
													class="type-selector-radio" type="radio" name="payType"
													value="CONO_COIN"> <label class="CONOCOIN"
													for="payType8" style="font-weight: normal;"> <span
														class="type-selector-label__text">CONO COIN</span> <!-- 코노코인 창 어케띄우지 -->
												</label></li>
											</ul>
										</div>
									</div>
									<div class="pay-box-contents">
										<div class="CONOCOIN" style="display: block;">
											<h3 class="title" style="display: none; position: relative;">CONO
												COIN</h3>
											<!-- 스크립트? -->
											<div class="CONOCOIN_content">
												<ul class="pay-type-sections">
													<li class="pay-type-section">
														<div class="line-title" style="letter-spacing: -1px;">잔액</div>
														<div class="line-data">
															<strong>${balanceCoin }원</strong>
														</div>
													</li>
												</ul>
												<button type="button">코인 충전</button>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="orderBox wrap-order-agree">
					<div class="agreeBtn">
						<input type="submit" value="결제하기">
						<img src="${path }/resources/img/btn_payment.gif" width="260" height="60" alt="결제하기">
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