<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	


<div class="detail__area">
<div class="detail__div">

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		
			
	<!-- ************************ 상단 상품정보 ************************ -->
	<div class="detail-info__area">
		<div class="detail-info__div">
			<div class="detail-info__image__div">
				<input id="prodno" type="hidden" data-no="78">
				<!-- 이미지 리스트 -->
				<div class="swiper-container detail-info__image__list">
					<div class="swiper-wrapper">
						<c:forEach items="${imgList }" var="item">
						<c:choose>
							<c:when test="${item.getImg_name() != null}">
								<img src="resources/upload/file/${item.getImg_name() }"><br>
							</c:when>
						</c:choose>
					</c:forEach>
					</div>
					<!-- 확대 버튼-->
					<!-- <button class="detail-info__image--enlg" onclick="javascript:viewPic('../image/product/product_test.png')"> -->
					<button class="detail-info__image--enlg">
						<i class="fas fa-search"></i> 확대하기
					</button>
					<div class="detail-info__image--prev swiper-button-next swiper-button-white" onclick="moveSlides(-1)">&#10094;</div>
					<div class="detail-info__image--next swiper-button-prev swiper-button-white" onclick="moveSlides(1)">&#10095;</div>
					<!-- 슬라이더 버튼 수 -->
					<div class="swiper-pagination">
						<div class="paginationBtn" style="text-align: center">
							<!-- productDetail.js -->
						</div>
					</div>
					
					<!-- 확대버튼 하는 중 -->
					<div class="prodDetailImgWrap1">
						<div class="prodDetailImgWrap2"> 
							<button type="button" class="detailImg_closeBtn">
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABACAYAAACjgtGkAAAAAXNSR0IArs4c6QAAAolJREFUeAHl20tSxCAQANCJW12ql3DtKTxE9GQ6h/AU7j2EutT12J1qUowhCZ/+AFLFgIEU9pvApjPDAcrpdLqH5gHqJ9TjMAzf0HZfIO4rCHKEegP1FeJ+u6Co36H9oIGRJtJQn80fDIwdDQ6DCxcmXEIftW6hdv2kBDBwV/ygxQyCf/wHlC2MBUjvKHsYQZBeUWIwVkF6Q4nF2ATpBSUFYxekdZRUjCiQVlFyMKJBWkPJxUgCaQWlBCMZpHaUUowskFpRODCyQWpD4cIoAqkFhROjGMQahRuDBcQKRQKDDUQbRQqDFUQLRRKDHUQaRRpDBEQKRQNDDIQbRQtDFIQLRRNDHKQURRtDBSQXxQJDDSQVxQpDFSQWxRJDHWQPxRrDBGQNBa9DcYlnzLXO6cVpROnjLJWptOa0DDwNfi75i9a+htYMA/8HMxBcnFCeoIsQWBDm2SWepyvKH+51COVl5+VCX0jo2nyDdMcMxDtA8enAJwMr9kcag65+Mfk2PAx8c2c6Myh08/dT1EFCGO7MgDH/oDV5aUcVZAvDbQ5rFDWQGIwaUFRAUjCsUcRBcjAsUURBSjCsUMRAODAsUERAODG0UdhBJDA0UVhBJDG0UNhANDA0UFhANDGkUYpBLDAkUYpALDGkULJBasCQQMkCqQmDGyUZpEYMTpQkkJoxuFCiQVrA4ECJAmkJoxRlF6RFjBKUTZCWMXJRVkF6wMhBCSaqesJAFEpzHKGLOSDMBY0QI6Y8FmUBQhNdFt7lRqYf+S7ubuiCh4IxIcpjCOVsy9CER7oBb3xxSSTod1H2YpxB9iZ2oUFBbMU6gWxN6AnCj2UtZneG3MFk3FddbhMfwvUDZwoaHH4B+xHVOFecBB4AAAAASUVORK5CYII=" width="34" height="32" alt="닫기 버튼 아이콘">
							</button>
							<div class="detailImgListWrap">
								<div class="dtailImg_prodName"></div>
								<!-- 이미지 리스트 -->
								<div class="detailImgList" > 
									<!-- productDetail.js -->
								</div>
								<div class="detailImg_buttonWrap">
									<!-- productDetail.js -->
								</div>
							</div> <!--//ImgListWrap  -->
						</div>
					</div>
				</div>
			</div><!-- //detail-info__image__div -->
			
			<div class="detail-info__text__div">
				<div class="detail-info__text__div2">
					<div class="detail-info__text__div3">
						<div class="detail-info__text-header">
							<!-- 상품명 --> 
								상품번호 : ${itemDetail.get('item_idx')} <br>
							<h2> 상품명 : ${itemDetail.get('item_title')}</h2>
							<div class="detail-info__text-title"></div>
							<div class="detail-info__text-price__div">
								<!-- 상품가격 --> 
							<h3>	가격 : ${itemDetail.get('item_price')} </h3>
								<div class="detail-info__price" id="product_price">
								</div>
							</div>
						</div>
						<table>
							<tr style="text-align:center;">
								    <td>수량</td>
								    <td class="bseq_ea"> 재고수량 :  ${itemDetail.get('item_quantity')}</td>
								    <td>
								        <button type ="button" onclick="fnCalCount('p',this);">+</button>
								        <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center; width: 50px;" />
								        <button type="button" onclick="fnCalCount('m', this);">-</button>
								    </td>
								</tr>
								</table>
									
						<div class="detail-info__text-body">
							<div class="detail-info__text-body-top">
								<!-- 찜, 조회수, 시간 -->
								<div class="detail-info__text-body-topL">
									<div class="detail-info--topL-item">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAjhJREFUWAnFl1uPKUEUhbdCxF2Iu7h78f9/ixdexANeSNxCkJnz1ZwSRncrM0OvhK6ufVmrdiu1O/DxD/INq9VKFouFbDYbOR6PEggEJBKJSDqdlkKhIKFQ6FvE1+3pdJL5fC7EHw4HIXU4HJZEIiHZbFZSqdRdXOBaAEHj8VjW6/Wdo5kIBoNSLBalVCppYcxDNJvNNPn5fDaud9dkMimNRkMvxhgvAna7nQyHQ2EVNmBV3W5Xu45GI10tmziq1+v1JBaLaXctANLBYKDLbZPE+MTjcT3cbrdmyurKY+n3+/pRKiImk8nT5MRB/Cw5cfyu4ARqv9/LcrnUN+/8ghNuxcBhI7xcC5xwK7aMX4BbsfX8AtzKa9++Whjcij8WvwC3Yk/6BbiV+TPxQwTcKpPJ+MGtOeFWHBB+PAY44VYctZxu7waccOuzIJ/Pv7UKrB5OoAUopfQ5/a4q0BPAeRHAgG4nl8vpyVd+wQGXwZeM/3f1el2i0aix/fmV3HBc40YAZel0Oq4933Xgs2M6IXKb0pv4GwFM0ny22+1Lv2ccf3Pl195qtW56QZPvTgAG9mez2fwTEZCTy6kjhstRAAba6FqtxvBXIAe53OAqgADeASqVilvsw3liyeEFTwEElstl/fFK4mSzjXsogOSshBcRW+BrWzkrARBXq1UrEZDjawtrAUYEpXXDs+TkeUoAAZTWScRPyMnn/JqLxQPm+U6nU+2FIDPnEeZourycOlofTF4LeODqav4EUxqvNxGf2nsAAAAASUVORK5CYII=" width="16" height="16" alt="상품 상태 아이콘">
										<!-- 찜 수 -->  
										<div id="zzim"> 찜 ${itemDetail.get('COUNT(w.member_id)')}</div>
									</div>
									<div class="detail-info--topL-item">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC" width="21" height="13" alt="상품 상태 아이콘">
										<!-- 상품 조회수 --> 
										<div id="view"> 조회수 ${itemDetail.get('item_readCnt')}</div>
									</div>
									<div class="detail-info--topL-item">
										<img class="timeIcon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAuRJREFUWAnFV01rE1EUzUwSMWATENpFRNyIi0YI+eiui4LoogWFgkvBH6Dgpip+dONKgivdC3XlpkWELkTQRVw1H4QwWQmhLrKwq1IwxHyM54zvDck4mc6bTO3AY97MO/eeM/e9d+c+LeLzqlQq8Wg0ujIajW6ZprkIs7SmaRfQN9HvsOG5pev6h+Fw+LVYLPb9uNaOAzUajYXBYPAcPHeATR2HF+OHEPMuFou9yGazP71spgowDONMt9t9BOMNtDkvJx5jRxgrJRKJl5lM5rcbzlVArVabR6i3YbDsZhTgXRlTs57P5w+ctv8IAPkiwr2LdskJnuUZU7KPtgoRrXE/EwL45SDeC5tcEgoRS+OR0OUg55xhPyly8tA3OcgleW0BYsEpzTnm9THaknTm874suCy4JYBbDU9c7UoXvugzwllRMvoL3hCcEUsA9zneB91qAfgjc4IzojPD4UuYZP7rRU5y60yvYPab4cIUmSK3ztweplcVX+TWEYqMilGYWHJzEabDdKroK60jO52aAHLbiUhReShwTIHJNcBiYqYLX/IxoIMOIxBYANLweRIXCoWb2FJrEPJdUUiHa8BQNLLh2EY7+IM+a7fbZ3O53G4ymbwKf08B+GWDPDrAtrR6vX4dNdwnD5yfoR9w9hCReE9ws9m82Ov1XqF728sYUbuhMR0CxEoljGz4DdPyQP6gqtXqXayxt1NEHOL9vFWQAPgawHtTgEqvEQm4Mrcg5An6VxDdL24OMPYGEbtvCeCvsd/vcwGF+UdkZRyFmHMuAo7i8fhlVsxWHhClc8kFOMur1BRy+izJct1ORCydMVCehdGnbVlwWXBbAOt2zNs6wrbv05EyjL7JMX5GsAXQG6tVgFZPQgR90vd4RUzOCQFCRAtAFpphTkeZPkE+cSZwFSBEHGCerqG/icbjVdCLtpv05fxy6dDahvLB7X5qh1OnGMfxnFUUj+dWLYHtJo/nBhaZ0vH8D6NELRJSWvu9AAAAAElFTkSuQmCC" width="16" height="16" alt="상품 상태 아이콘">
										<!-- 시간 -->
										상품 등록일 : ${itemDetail.get('item_date')}
										<c:set var="b_time" value="${product_logtime}" />
										<c:set var="time"
											value="${ b_time > (60 * 24) ? Math.round( b_time / (60 * 24) ) : ( b_time > 60 ? Math.round( b_time / 60 ) : b_time ) }" />
								
										<c:if test="${60 > b_time }">
											<c:set var="unit" value="분 전" />
										</c:if>
										<c:if test="${ b_time > 60 }">
											<c:set var="unit" value="시간 전" />
										</c:if>
										<c:if test="${ b_time > (60 * 24) }">
											<c:set var="unit" value="일 전" />
										</c:if>
										<div id="product_logtime"> ${time}${unit}</div> 
									</div>
								</div>
							</div>
							<div class="detail-info__text-body-bottom">
								<!-- 아이템 한개 -->
								</div>
								<div class="detail-info__text-body-bItem">
										판매상태 : ${itemDetail.get('item_status')}
								<div class="detail-info__text-body-bItem">
										<br>
									<div class="detail-info__text-body-bItem-title">상품소개</div>
									${itemDetail.get('item_content')} 상품소개입니다다아ㅏ아
									<div class="detail-info__location" id="product_location"></div>
									
									
										<br>
										<br>
										<br>
										
								<div>숨김 ${itemDetail.get('item_hide')}
								</div>
								
									
<!-- 									연락하기 버튼 -->
								<div class="storeInfo_callBtn">
									<button class="callBtn" onclick="location.href='ItemModifyForm.shop?item_idx=${itemDetail.get('item_idx')}'">수정하기</button>
									<button class="callBtn2" onclick="location.href='ItemDelete.shop?item_idx=${itemDetail.get('item_idx')}'">삭제하기</button>
									<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}">
								</div>
								</div>
							</div>
						</div>
					</div>
					<div class="detail-info__btn-list">
						<!-- 찜 메세지 -->
						
					</div> <!-- //버튼리스트 -->
				</div>
			</div>
		</div>
	</div><!-- //detail-info__area -->
						<!-- 지역, 카테고리, 상품태그 -->
						<div class="prodInfo_detailWrap1">
							<!-- 지역 -->
							<div class="prodInfo_detailWrap2">
								<div class="detailTitleWrap">
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII=" width="16" height="18" alt="거래지역 아이콘">
									거래지역
								${itemDetail.get('item_region')}
								</div>
								<div class="detailContentWrap">
									<div class="detailContent_location">
									</div>
								</div>
							</div>
							<!-- 카테고리 -->
							<div class="prodInfo_detailWrap2">
								<div class="detailTitleWrap">
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAkCAYAAADo6zjiAAAAAXNSR0IArs4c6QAAANJJREFUWAntWEEKxCAMjGJ70h/4Aq/+/wm99gX9gTcVujsLe1pQoWj2kJyERCeZkNCOut9WSqHruiilRDjPtH3fyVpL3nvato1Uzvk+z5NqrTNxf942xlAIgTQqXw2ObIAJbA3auQzYenbPW8UBW7cCVvgkAXYGTK/PMcZeSNN/HEfT//8M9CpoljfgZGdAEhAGZA90GZA9MLDMHoXIGLIz0J0C+R6QPfBoyAcus08BfwL4R+cyaAXaOceF/xEqNJQKiAWrDZjAVqslGrQcrH8lmhfQ0lJsYYep+gAAAABJRU5ErkJggg==" width="16" height="18" alt="카테고리 아이콘">
									카테고리
									${itemDetail.get('category_big')} > ${itemDetail.get('category_small')}
								</div>
								<div class="detailContentWrap">
									<a href="#">
										<span class="detailContent_cate">
										</span>
									</a>
								</div>
							</div>
							<!-- 상품태그 -->
							
								<div class="detailContentWrap_hash">
								</div>
							</div>
						</div>
					</div>
<!-- 				</div> -->
				
<!-- 			</div>//prodInfo_wrap1 -->
<!-- 		</div>//btmProdInfo_Wrap2 -->
			<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>

</div>
<!-- </div> -->


<script>
// 슬라이더 관련
var slideIndex = 0; // slide index
function currentSlide(n) {
	  slideIndex = n;
	  showSlides(slideIndex);
	}
	
function moveSlides(n) { // Next/previous controls
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}
function showSlides(n) {
    var slides = document.getElementsByClassName("swiper-slide");
    var dots = document.getElementsByClassName("dot");
    var size = slides.length;
    if ((n+1) > size) {
      slideIndex = 0; n = 0;
    }else if (n < 0) {
      slideIndex = (size-1);
      n = (size-1);
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
	
    slides[n].style.display = "block";
    dots[n].className += " active";
  }
  
  
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


