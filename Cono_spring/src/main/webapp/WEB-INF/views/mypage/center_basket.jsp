<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:장바구니</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
		<jsp:include page="./mypage_sidebar.jsp" />
	</div>

	<div class="CartshopList">
		<h3>장바구니</h3>
		<div class="CartshopItem">
			<div class="CartshopItem__header">
				<label class="Cartlabel">
					<div class="checkbox">
						<div class="input-checkbox">
							<input type="checkbox" class="bp">
						</div>
					</div>
					<span class="CartshopItem__title">xxx 님의 상점</span>
				</label>
			</div>
			<section class="CartshopItem__itemList">
				<ul>
					<div class="CartproductList">
						<div class="CartproductListItem">
							<div class="CartproductListItem__productInfo">
								<div class="CartproductListItem__Img">
<%-- 									<img class="CartproductListItem__productImg" src="${basket.img_real_name }"> --%>
									<img class="CartproductListItem__productImg" src="${path }/resources/img/test.jpg">
								<div class="CartproductListItem__productInfoTextGroup">
									<a href="#" class="CartproductListItem__productName">${basket.item_title }</a>
								</div>
								</div>
							</div>
							<div class="CartproductListItem__optionInfo">
								<div class="CartOptionList">
									<div class="CartOptionListItem">
										<div class="CartOptionListItem__Price">
<%-- 											<em class="ItemPrice">${basket.item_price }</em> --%>
											<em class="ItemPrice">300000원</em>
										</div>
									</div>
								</div>
								<div>
									<div class="ProductMessage">
										<form>
											<div class="TextEditor">
												<textarea maxlength="500" placeholder="주문 시 요청사항을 입력해주세요" class="ProductTextarea"></textarea>
												<em class="TextEditor__maxLength">500</em>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</ul>
			</section>
		</div>
		
		
		
		
		<div class="TotalPrice">
			<div class="CartCheckboxControl">
				<div class="checbox" style="display: inline-block;">
					<div class="input-checkbox" style="display: inline-block;">
						<input id="cart-product-all-check" type="checkbox" class="bp">
					</div>
					<label for="cart-product-all-check" style="cursor: pointer;">
						<span class="CartCheckboxControl__label">전체 선택 (
						<span class="CartCheckboxControl__label--bold" style="font-weight: blod;">${card.item_idx}</span>
						/ 총갯수 )</span>
					</label>
				</div>
			</div>
			<div class="CartAllPrice">
				<div class="CartCheckoutDesign">
					<div class="CartCheckoutDesign__item">
						<div class="CartCheckoutDesign__label">상품금액</div>
						<div class="CartCheckoutDesign__value">
							<span>${basket.item_price }</span>
							<span class="CartCheckoutDesign__priceUnit">원</span>
						</div>
					</div>
					<div class="CartCheckoutDesign__item--fixed">+</div>
					<div class="CartCheckoutDesign__item">
						<div class="CartCheckoutDesign__label">배송비</div>
						<div class="CartCheckoutDesign__value">
							<span>배송비총금액</span>
							<span class="CartCheckoutDesign__priceUnit">원</span>
						</div>
					</div>
					<div class="CartCheckoutDesign__item--fixed">=</div>
					<div class="CartCheckoutDesign__item">
						<div class="CartCheckoutDesign__label">결제 예정금액</div>
						<div class="CartCheckoutDesign__value--highlight">
							<span>상품+배송비총금액</span>
							<span class="CartCheckoutDesign__priceUnit">원</span>
						</div>
					</div>
				</div>
			</div>
			<div class="Cartpage_bottom" style="padding: 16px;">
				<button class="OrderButton">주문하기</button>
			</div>
		</div>
	</div>


	<div class="clear">
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>