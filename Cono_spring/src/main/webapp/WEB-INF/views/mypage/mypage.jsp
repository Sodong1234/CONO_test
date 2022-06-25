<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:마이페이지</title>
<link href="${path}/resources/css/style.css" rel="stylesheet" />
<script src="${path}/resources/js/jquery-3.6.0.js"></script>

</head>
<body>
		<jsp:include page="../header_footer/header.jsp" />

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
					<strong class="label">Coin</strong>
					<c:choose>
						<c:when test="${coin_total eq null }">
							<a href="coin" class="value">0c</a>
						</c:when>
						<c:otherwise>
<%-- 							<a href="coin" class="value">${coin_total}c</a> --%>
							<a href="coin" class="value"><fmt:formatNumber value="${coin_total}" pattern="#,###.##"/>c</a>
							
						</c:otherwise>
					</c:choose>	
					<li>
					<strong class="label">구매 중</strong>
					<a href="waiting" class="value">${waitingCount }</a>
					</li>
					<li>
					<strong class="label">쿠폰</strong>
					<a href="coupon" class="value">${couponCount}</a>
					</li>
					<li>
					<strong class="label">찜 상품</strong>
<%-- 					<a href="basket" class="value">${basketCount}</a> --%>
					<a href="wish" class="value">${wishCount }</a>
					</li>	
				</ul>
			</section>
		</div>
	</div>
<!-- 	=============================== main (내 정보 section) end =============================== -->
<jsp:include page="../search/recentView.jsp" />	
<!-- 	=============================== leftbar start =============================== -->
		<div class="plus" style="bottom: 200px;">
			<jsp:include page="./mypage_sidebar.jsp" />
		</div>
<!-- 	=============================== leftbar end =============================== -->	
	
<!-- 	=============================== main (주문 정보 section) start =============================== -->

	<div class="tabmain">
		<h4>최근 상품 거래 내역</h4><br><br>
	    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	    <label for="tab1">거래 완료</label>
	
	    <input id="tab2" type="radio" name="tabs">
	    <label for="tab2">취소 / 환불</label>
	    
     		<!-- 	        				구매완료 내용 시작 -->
	<c:forEach var="item" items="${purchasedList }">
	
	    <section id="content1">
	        <div class="my-review__writable js_reviewWritableListContainer">
	        	<div class="my-review__writable__list-container">
	        		<ul class="writable_reviews" style="list-style: none;">

		        			<li class="my-review__writable__list">
		        				<div class="my-review__writable__image-wrap" style="display: inline-block;">
		        					<img class="my-review__writable__image" src="resources/upload/file/${item.img_name}" title="test" alt="test">
		        				</div>
									<div class="my-review__writable__content-wrap">
										<input type="button" value="상세정보" onclick="itemDetail?item_idx=${item.item_idx}">
										<div class="my-review__writable__content">판매자 : ${item.shop_name }</div>
			        					<div class="my-review__writable__content-title">제목 : ${item.item_title }</div>
			        					<div class="my-review__writable__content">내용 : ${item.item_content }</div>
			        					<div class="my-review__writable__date">구매날짜 : ${item.ord_date }</div>
<%-- 			        					<div class="my-review__writable__date">가격 : ${item.ord_quantity * item.item_price }코인</div> --%>
			        					<div class="my-review__writable__date">가격 : <fmt:formatNumber value="${item.ord_quantity * item.item_price }" pattern="\#,###.##"/>코인</div>
			        					
			        					<div class="my-review__writable__date">수량 : ${item.ord_quantity }개</div>
			        				</div>
			        				<div class="my-review__writable__btn-wrap">
			        				</div>
		        			</li>

	        		</ul>
	        	</div>
	        </div>
	    </section>
	    
	</c:forEach>
<!-- 	        				구매완료 내용 끝 -->
<!-- 							취소 시작  -->
	<c:forEach var="item" items="${canceledList}" >
	    <section id="content2">	
	    	<div class="cancel">
	    		<div class="cancel__list">
	    			<div class="cancel__list-date">
	    				<div class="cancel__list-cancelDate1">
	    					취소접수일 : 
	    				</div>
	    				<div class="cancel__list-cancelDate2">${item.ord_date }</div>
	    				<span class="and">|</span>
<!-- 	    				<div class="calcel__list-orderDate1"> -->
<!-- 	    					주문일 :  -->
<!-- 	    				</div> -->
<%-- 	    				<div class="cancel__list-orderDate2">${item.ord_date }</div> --%>
	    			</div>
	    			<div class="cancel__list-content">
	    				<div class="cancel__list-contentCheck">
	    					<div class="cancel__list-contentTitle">
	    						<div class="cancel__list-contentTitle2" style="display: table-cell;">
	    							<div class="cancel__list-contentTitle3">
	    								<img class="my-review__writable__image" src="resources/upload/file/${item.img_name}" title="test" alt="test">
	    								<div class="cancel__list-title">${item.item_title }</div>
	    								<div class="cancel__list-subContent">${item.item_content }</div>
	    								<input type="button" value="상세정보" onclick="itemDetail?item_idx=${item.item_idx}">
	    							</div>
	    							<div class="cancel__list-price">
	    								<div class="cancel__list-quantity">${item.ord_quantity }개</div>
	    								<div class="cancel__list-priceCheck">${item.ord_quantity * item.item_price } 코인</div>
	    							</div>
	    						</div>
	    					</div>
	    					<div class="cancel__list-status">
	    						<div class="cancel__list-status-cancel">
	    							<strong>취소완료</strong>
	    							<span class="cancel__list-status-when"><br>환불금액<br>
	    								<span class="cancel__list-status-how"><br>>${item.ord_quantity * item.item_price } 코인</span>
	    							</span>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </section>
	    
	</c:forEach>
<!-- 							취소 끝 -->
	</div>
<!-- 	=============================== main (주문 정보 section) end =============================== -->
	<footer style="position: relative; bottom: 600px;">	
		<jsp:include page="../header_footer/footer.jsp" />
	</footer>

</body>
</html>