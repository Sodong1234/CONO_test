<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modifyButton.css">
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#purchase_item_quantity").html("<select name='ord_quantity'></select>");
		for(let i = 1; i <= ${itemDetail.get('item_quantity')}; i++) {
			$("#purchase_item_quantity > select").append("<option value=" + i + ">" + i + "</option>");
		}
		$("#buy_now_btn").on("click", function(e) {
			if(${itemDetail.get('item_quantity')} != '0') {
				$("#btn").click();
			} else {
				alert("구매할 수 없는 상품입니다.");
				e.preventDefault();
			}
		});
		// -------------------------- 이미지 슬라이드 --------------------------
		var imgs;
		var img_count;
		var img_position = 1;
		
		imgs = $(".swiper-wrapper ul");
		img_count = imgs.children().length;
		
		$("#previous").click(function() {
			back();
		});
		$("#next").click(function() {
			next();
		});
		
		function back() {
			if(img_position > 1) {
				imgs.animate({
					left:'+=400px'
				});
				img_position--;
			}
		}
		function next() {
			if(img_position < img_count) {
				imgs.animate({
					left:'-=400px'
				});
				img_position++;
			}
		}
		// ---------------------------------------------------------------------------
	});
	
	
</script>

<style type="text/css">
.btnMessage{
 	background-image: url(./resources/img/7550143_massage_chatting_texting_chat_email_icon.png); 
 	background-size: cover;
 	width: 44px;   
    height: 43px;    
   	background-repeat:no-repeat;
   	border:0;
   	border-style: none; 
   	background-color: white;
	margin-left: 10p
 	}
.btnShop{
	background-image: url(./resources/img/shop.png); 
 	background-size: cover;
 	width: 43px;   
    height: 43px;    
   	background-repeat:no-repeat;
   	border:0;
   	border-style: none; 
   	background-color: white;
/*    	margin:-10px; */
}
.swiper-wrapper {
	width: 400px;
	height: 400px;
	overflow: hidden;
	position: relative;
	margin: 0 auto;
}
.swiper-wrapper ul {
	width: 5000px;
	position: absolute;
	top: 0;
	left: 0;
	font-size: 0;
}
.swiper-wrapper ul li {
	display: inline-block;
}
.swiper-wrapper img {
	width: 400px;
	height: 400px;
}
#previous {
	position: absolute;
	cursor: pointer;
	z-index: 1;
}
#next {
	position: absolute;
	cursor: pointer;
	z-index: 1;
}
</style>
<div>
	<!-- 상단 부분 -->
	<jsp:include page="../header_footer/header.jsp" />
</div>


<div class="detail__area">
	<div class="detail__div">

		<!------ 사이드바 ------>
		<!-- 	<div> -->
		<%-- 		<jsp:include page="./myshop_sidebar.jsp"/> --%>
		<!-- 	</div> -->


		<!-- ************************ 상단 상품정보 ************************ -->
		<div class="detail-info__area">
			<div class="detail-info__div">
				<div class="detail-info__image__div">
					<input id="prodno" type="hidden" data-no="78">
					<!-- 이미지 리스트 -->
					<div class="swiper-container detail-info__image__list">
<%-- 						<span> 상품번호 : ${itemDetail.get('item_idx')} </span> --%>
					<div id="previous" class="detail-info__image--prev swiper-button-next swiper-button-white">&#10094;</div>
						<div class="swiper-wrapper">
							<ul>
								<c:forEach items="${imgList }" var="item">
									<c:choose>
										<c:when test="${item.getImg_name() != null}">
											<li>			
												<img src="resources/upload/file/${item.getImg_name() }">
											</li>
										</c:when>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<div id="next" class="detail-info__image--next swiper-button-prev swiper-button-white">&#10095;</div>
						<!-- 슬라이더 버튼 수 -->
						<div class="swiper-pagination">
							<div class="paginationBtn" style="text-align: center">
								<!-- productDetail.js -->
							</div>
						</div>

						<!-- 확대버튼 하는 중 -->
						<div class="prodDetailImgWrap1">
							<div class="prodDetailImgWrap2">
<!-- 								<button type="button" class="detailImg_closeBtn"> -->
<!-- 									<img -->
<!-- 										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABACAYAAACjgtGkAAAAAXNSR0IArs4c6QAAAolJREFUeAHl20tSxCAQANCJW12ql3DtKTxE9GQ6h/AU7j2EutT12J1qUowhCZ/+AFLFgIEU9pvApjPDAcrpdLqH5gHqJ9TjMAzf0HZfIO4rCHKEegP1FeJ+u6Co36H9oIGRJtJQn80fDIwdDQ6DCxcmXEIftW6hdv2kBDBwV/ygxQyCf/wHlC2MBUjvKHsYQZBeUWIwVkF6Q4nF2ATpBSUFYxekdZRUjCiQVlFyMKJBWkPJxUgCaQWlBCMZpHaUUowskFpRODCyQWpD4cIoAqkFhROjGMQahRuDBcQKRQKDDUQbRQqDFUQLRRKDHUQaRRpDBEQKRQNDDIQbRQtDFIQLRRNDHKQURRtDBSQXxQJDDSQVxQpDFSQWxRJDHWQPxRrDBGQNBa9DcYlnzLXO6cVpROnjLJWptOa0DDwNfi75i9a+htYMA/8HMxBcnFCeoIsQWBDm2SWepyvKH+51COVl5+VCX0jo2nyDdMcMxDtA8enAJwMr9kcag65+Mfk2PAx8c2c6Myh08/dT1EFCGO7MgDH/oDV5aUcVZAvDbQ5rFDWQGIwaUFRAUjCsUcRBcjAsUURBSjCsUMRAODAsUERAODG0UdhBJDA0UVhBJDG0UNhANDA0UFhANDGkUYpBLDAkUYpALDGkULJBasCQQMkCqQmDGyUZpEYMTpQkkJoxuFCiQVrA4ECJAmkJoxRlF6RFjBKUTZCWMXJRVkF6wMhBCSaqesJAFEpzHKGLOSDMBY0QI6Y8FmUBQhNdFt7lRqYf+S7ubuiCh4IxIcpjCOVsy9CER7oBb3xxSSTod1H2YpxB9iZ2oUFBbMU6gWxN6AnCj2UtZneG3MFk3FddbhMfwvUDZwoaHH4B+xHVOFecBB4AAAAASUVORK5CYII=" -->
<!-- 										width="34" height="32" alt="닫기 버튼 아이콘"> -->
<!-- 								</button> -->
								<div class="detailImgListWrap">
									<div class="dtailImg_prodName"></div>
									<!-- 이미지 리스트 -->
									<div class="detailImgList">
										<!-- productDetail.js -->
									</div>
									<div class="detailImg_buttonWrap">
										<!-- productDetail.js -->
									</div>
								</div>
								<!--//ImgListWrap  -->
							</div>
						</div>
					</div>
				</div>
				<!-- //detail-info__image__div -->

				<div class="detail-info__text__div">
					<div class="detail-info__text__div2">
						<div class="detail-info__text__div3">
							<div class="detail-info__text-header">
								<!-- 상품명 -->
								<div class="detail-info__text-title"></div>
								<div class="detail-info__text-price__div"></div>
								<!-- 상품가격 -->
								<div class="detail-info__price" id="product_price" style="font-family:'Cafe24Ohsquare'; ">
									${itemDetail.get('item_title')}
									<!-- 찜 표시 -->
									<c:choose>
										<c:when test="${wish eq null }">
											<button
												onclick="location.href='increaseWish?item_idx=${itemDetail.get('item_idx')}'">
												<svg xmlns="http://www.w3.org/2000/svg" width="30"
													height="30" fill="currentColor" class="bi bi-suit-heart"
													viewBox="0 0 16 16">
		 							 <path
														d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
											</button>
										</c:when>
										<c:when test="${wish ne null }">
											<button
												onclick="location.href='deleteWish?item_idx=${itemDetail.get('item_idx')}'">
												<svg xmlns="http://www.w3.org/2000/svg" width="30"
													height="30" fill="red" class="bi bi-bag-heart-fill"
													viewBox="0 0 16 16">
							  <path
														d="M11.5 4v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5ZM8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1Zm0 6.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
							</svg>
											</button>
										</c:when>
									</c:choose>
								</div>
<%-- 								<h3 style="font-family:'Cafe24Ohsquare';">가격 : ${itemDetail.get('item_price')}</h3> --%>
								<h3 style="font-family:'Cafe24Ohsquare';"> <fmt:formatNumber value="${itemDetail.get('item_price')}" pattern="\#,###.##"/></h3>
								<table>
								<tr style="text-align: center;">
									<td>현재 수량 :&nbsp;</td>
									<td class="bseq_ea">${itemDetail.get('item_quantity')}</td>
<!-- 									<td> -->
<!-- 										<button type="button" onclick="fnCalCount('m', this);">-</button> -->
<!-- 										<input type="text" name="pop_out" value="0" -->
<!-- 										readonly="readonly" style="text-align: center; width: 50px;" /> -->
<!-- 										<button type="button" onclick="fnCalCount('p',this);">+</button> -->
<!-- 									</td> -->
								</tr>
							</table>
									<form action="PurchaseItem" method="post">
								<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}"> 
								<input type="hidden" name="img_name" value="${item.getImg_name() }">
								<input type="hidden" name="item_price" value="${itemDetail.get('item_price')}">
								<table>
									<tr>
										<td >구매수량&nbsp;</td>
										<td id="purchase_item_quantity"></td>
										<td><input type="submit" id="btn" value="" class="btn"></td>
									</tr>
<!-- 									<tr> -->
<!-- 									</tr> -->
								</table>
							</form>
							</div>
							
							<br>
							
							<div style="font-weight: bold;" > 판매자 : ${itemDetail.get('shop_name') } </div> 
							
							
							<br>
							
<!-- 							<form action="Myshop.shop" method="post"> -->
							
<%-- 								<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}"> --%>
								 
								<input type="button" class = "btnShop" value="" onclick="location.href='Myshop.shop?item_idx=${itemDetail.item_idx}'"> &nbsp;&nbsp;&nbsp;
								<input type="button" class="btnMessage" value="" onclick="location.href='addMessageList?shop_idx=${itemDetail.shop_idx}&item_idx=${itemDetail.item_idx}'">
<!-- 								</form> -->
				
						
							
						
							
							<div class="detail-info__text-body">
								<div class="detail-info__text-body-top">
									<!-- 찜, 조회수, 시간 -->
									<div class="detail-info__text-body-topL">
										<div class="detail-info--topL-item">
											<img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAjhJREFUWAnFl1uPKUEUhbdCxF2Iu7h78f9/ixdexANeSNxCkJnz1ZwSRncrM0OvhK6ufVmrdiu1O/DxD/INq9VKFouFbDYbOR6PEggEJBKJSDqdlkKhIKFQ6FvE1+3pdJL5fC7EHw4HIXU4HJZEIiHZbFZSqdRdXOBaAEHj8VjW6/Wdo5kIBoNSLBalVCppYcxDNJvNNPn5fDaud9dkMimNRkMvxhgvAna7nQyHQ2EVNmBV3W5Xu45GI10tmziq1+v1JBaLaXctANLBYKDLbZPE+MTjcT3cbrdmyurKY+n3+/pRKiImk8nT5MRB/Cw5cfyu4ARqv9/LcrnUN+/8ghNuxcBhI7xcC5xwK7aMX4BbsfX8AtzKa9++Whjcij8WvwC3Yk/6BbiV+TPxQwTcKpPJ+MGtOeFWHBB+PAY44VYctZxu7waccOuzIJ/Pv7UKrB5OoAUopfQ5/a4q0BPAeRHAgG4nl8vpyVd+wQGXwZeM/3f1el2i0aix/fmV3HBc40YAZel0Oq4933Xgs2M6IXKb0pv4GwFM0ny22+1Lv2ccf3Pl195qtW56QZPvTgAG9mez2fwTEZCTy6kjhstRAAba6FqtxvBXIAe53OAqgADeASqVilvsw3liyeEFTwEElstl/fFK4mSzjXsogOSshBcRW+BrWzkrARBXq1UrEZDjawtrAUYEpXXDs+TkeUoAAZTWScRPyMnn/JqLxQPm+U6nU+2FIDPnEeZourycOlofTF4LeODqav4EUxqvNxGf2nsAAAAASUVORK5CYII="
												width="16" height="16" alt="상품 상태 아이콘">
											<!-- 찜 수 -->
											<div id="zzim">찜 ${itemDetail.get('wish')}</div>
										</div>
										<div class="detail-info--topL-item">
											<img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC"
												width="21" height="13" alt="상품 상태 아이콘">
											<!-- 상품 조회수 -->
											<div id="view">조회수 ${itemDetail.get('item_readCnt')}</div>
										</div>
										<div class="detail-info--topL-item">
											<img class="timeIcon"
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAuRJREFUWAnFV01rE1EUzUwSMWATENpFRNyIi0YI+eiui4LoogWFgkvBH6Dgpip+dONKgivdC3XlpkWELkTQRVw1H4QwWQmhLrKwq1IwxHyM54zvDck4mc6bTO3AY97MO/eeM/e9d+c+LeLzqlQq8Wg0ujIajW6ZprkIs7SmaRfQN9HvsOG5pev6h+Fw+LVYLPb9uNaOAzUajYXBYPAcPHeATR2HF+OHEPMuFou9yGazP71spgowDONMt9t9BOMNtDkvJx5jRxgrJRKJl5lM5rcbzlVArVabR6i3YbDsZhTgXRlTs57P5w+ctv8IAPkiwr2LdskJnuUZU7KPtgoRrXE/EwL45SDeC5tcEgoRS+OR0OUg55xhPyly8tA3OcgleW0BYsEpzTnm9THaknTm874suCy4JYBbDU9c7UoXvugzwllRMvoL3hCcEUsA9zneB91qAfgjc4IzojPD4UuYZP7rRU5y60yvYPab4cIUmSK3ztweplcVX+TWEYqMilGYWHJzEabDdKroK60jO52aAHLbiUhReShwTIHJNcBiYqYLX/IxoIMOIxBYANLweRIXCoWb2FJrEPJdUUiHa8BQNLLh2EY7+IM+a7fbZ3O53G4ymbwKf08B+GWDPDrAtrR6vX4dNdwnD5yfoR9w9hCReE9ws9m82Ov1XqF728sYUbuhMR0CxEoljGz4DdPyQP6gqtXqXayxt1NEHOL9vFWQAPgawHtTgEqvEQm4Mrcg5An6VxDdL24OMPYGEbtvCeCvsd/vcwGF+UdkZRyFmHMuAo7i8fhlVsxWHhClc8kFOMur1BRy+izJct1ORCydMVCehdGnbVlwWXBbAOt2zNs6wrbv05EyjL7JMX5GsAXQG6tVgFZPQgR90vd4RUzOCQFCRAtAFpphTkeZPkE+cSZwFSBEHGCerqG/icbjVdCLtpv05fxy6dDahvLB7X5qh1OnGMfxnFUUj+dWLYHtJo/nBhaZ0vH8D6NELRJSWvu9AAAAAElFTkSuQmCC"
												width="16" height="16" alt="상품 상태 아이콘">
											<!-- 시간 -->
											${itemDetail.get('item_date')}
											<div id="product_logtime">${time}${unit}</div>

										</div>
										<div class="detail-info--topL-item">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-bag-check-fill"
												viewBox="0 0 16 16">
									  <path fill-rule="evenodd"
													d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zm-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
									</svg>
											&nbsp;
											<c:choose>
												<c:when test="${itemDetail.get('item_status') eq '0'}">
													판매중
												</c:when>
												<c:when test="${itemDetail.get('item_status') eq '1'}">
													판매완료
												</c:when>
											</c:choose>

										</div>
									</div>
								</div>


								<div class="detail-info__text-body-bottom">
									<!-- 아이템 한개 -->
								</div>
								<div class="detail-info__text-body-bItem">
									<br>
									<div class="detail-info__text-body-bItem">
										<br>
										<div class="detail-info__text-body-bItem-title">상품소개</div>
										${itemDetail.get('item_content')}
										<div class="detail-info__location" id="product_location"></div>


										
										<div class="storeInfo_callBtn">
											<input type="hidden" name="item_idx"
												value="${itemDetail.get('item_idx')}">
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="detail-info__btn-list">
							<!-- 버튼 -->
							
							<div class="center">
								<a href="#" id="buy_now_btn">
									<span data-attr="buy">buy</span><span data-attr="now">now</span>
								</a>
								<br>
							</div>
						</div>
						<!-- //버튼리스트 -->
					</div>
				</div>
			</div>
		</div>
		<!-- //detail-info__area -->

<!-- 		<div class="btnArea" -->
<!-- 			style="float: left;"> -->
			<div class="svg-wrapper" style="margin-top: -40px;">
				<svg height="40" width="120" xmlns="http://www.w3.org/2000/svg">
      			 <rect id="shape" height="40" width="120" />
     	 	</svg>
				<div id="text1">
					<input type="button" value="신고하기" class="btn"
						onclick="location.href='AdminReportWriteForm.admin?item_idx=${itemDetail.get('item_idx')}'">
				</div>
			</div>
<!-- 		</div> -->
		<%-- 	숨김 체크박스 만들기 ? ${itemDetail.get('item_hide')} --%>
		<!-- 지역, 카테고리, 상품태그 -->
		<div class="prodInfo_detailWrap1">
			<!-- 지역 -->
			<div class="prodInfo_detailWrap2">
				<div class="detailTitleWrap">
					<img
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
						width="16" height="18" alt="거래지역 아이콘"> 거래지역<br>
					${itemDetail.get('item_region')}
				</div>
				<div class="detailContentWrap">
					<div class="detailContent_location"></div>
				</div>
			</div>
			<!-- 카테고리 -->
			<div class="prodInfo_detailWrap2">
				<div class="detailTitleWrap">
					<img
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAkCAYAAADo6zjiAAAAAXNSR0IArs4c6QAAANJJREFUWAntWEEKxCAMjGJ70h/4Aq/+/wm99gX9gTcVujsLe1pQoWj2kJyERCeZkNCOut9WSqHruiilRDjPtH3fyVpL3nvato1Uzvk+z5NqrTNxf942xlAIgTQqXw2ObIAJbA3auQzYenbPW8UBW7cCVvgkAXYGTK/PMcZeSNN/HEfT//8M9CpoljfgZGdAEhAGZA90GZA9MLDMHoXIGLIz0J0C+R6QPfBoyAcus08BfwL4R+cyaAXaOceF/xEqNJQKiAWrDZjAVqslGrQcrH8lmhfQ0lJsYYep+gAAAABJRU5ErkJggg=="
						width="16" height="18" alt="카테고리 아이콘"> 카테고리<br>
					${itemDetail.get('category_big')} >
					${itemDetail.get('category_small')}
				</div>
				
				
												
			</div>
			<!-- 상품태그 -->

			
		</div>
	</div>
</div>
<!-- 				</div> -->

<!-- 			</div>//prodInfo_wrap1 -->
<!-- 		</div>//btmProdInfo_Wrap2 -->
<div>
	<!-- 하단 부분 -->
	<jsp:include page="../header_footer/footer.jsp" />
</div>

<!-- </div> -->
<!-- </div> -->




<script>


  // 수량버튼 관련
function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}
  
</script>


