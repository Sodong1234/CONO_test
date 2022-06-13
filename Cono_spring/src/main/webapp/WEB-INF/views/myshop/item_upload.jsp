<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코노::상품등록</title>

<script src="../js/jquery-3.6.0.js"></script>
<!-- <script defer src="../js/product/jquery.form.js"></script> -->

<script defer src="../js/registForm.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 우편번호API -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8095222083350c138bd6b2dbc5bfd79a&libraries=services"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/registForm.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/registForm_common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/registForm_btn.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nav.css">
</head>


<div>
	<!-- 상단 부분 -->
	<jsp:include page="../header_footer/top.jsp" />
</div>

<aside class="side">
	<ul class="side-list">
		<li><a class="nav-link active" aria-current="page"
			href="ProductMyshop.shop">내 상점</a> <a class="nav-link"
			href="ItemUploadForm.shop">상품 등록</a> <a class="nav-link"
			href="ItemMng.shop">상품 관리</a> <a class="nav-link"
			href="ItemReviewMng.shop">상품 주문 관리</a> <a class="nav-link"
			href="item_order_mng.jsp">상품 후기 관리</a> <a class="nav-link"
			href="follow_shop.jsp">팔로우 상점</a></li>
	</ul>
</aside>

<body style="width: 1040px; margin: auto;">
	<form id="registForm">
		<div class="registWrap">

			<!--------- registBody : 본문  --------->
			<div class="registBody">
				<!-- /* owOgK */ -->
				<main id="registMain">
					<!-- /* fzZuLM */ -->

					<!-- section -->
					<section class="section">
						<h2>
							기본정보<span>*필수항목</span>
						</h2>

						<ul class="listBody">
							<!-- /* bEbvUk */ -->
							<li class="list">
								<div class="image_sub">
									상품이미지<span>*</span><small>(0/6)</small>
								</div>
								<div class="image_con">
									<ul class="registImages" id="imageList">
										<li class="imageList">이미지 등록 <input type="file"
											multiple="" id="inputImage">
										</li>
									</ul>

									<div class="imageDiv" id="imageDiv">상품 사진을 등록해주세요.</div>
									<div class="add_description">
										<b>* 상품 이미지는 상품 디테일 사진에 맞게 되어있음.</b><br> 이미지는 10mb 넘으면
										안됨, 1대1 비율이어야함<br>
										<!-- 									- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br> -->
										<!-- 									- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> -->
										<!-- 									- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br> -->
										<!-- 									최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M) -->
									</div>
								</div>
							</li>
							<!-- 상품이미지 -->
						</ul>

						<ul>
							<li class="list">
								<div class="subject_sub">
									제목<span>*</span>
								</div>
								<div class="subject_con">
									<div class="contentArea">
										<div class="subjectBox">
											<input type="text" placeholder="상품 제목을 입력해주세요."
												class="subjectInput" id="product_subject"
												name="product_subject">
											<button type="button" class="subjectCancle"></button>
										</div>
										<div class="subjectSize">
											<span>0</span>/40
										</div>
									</div>
									<div class="subjectDiv" id="subjectDiv">상품명을 2자 이상
										입력해주세요.</div>
								</div>
							</li>
							<!-- 제목 -->


							<li class="list">
								<div class="category_sub">
									카테고리<span>*</span>
								</div>
								<div class="category_con">
									<div class="contentArea">
										<div class="categoryStep">
											<ul class="categories" id="large_categories">
												<li class="category"><button type="button" class="btn"
														id="100">패션</button></li>
												<li class="category"><button type="button" class="btn"
														id="200">디지털/가전</button></li>
												<li class="category"><button type="button" class="btn"
														id="300">스포츠/레저</button></li>
												<li class="category"><button type="button" class="btn"
														id="400">가구/인테리어</button></li>
												<li class="category"><button type="button" class="btn"
														id="500">생활/가공식품</button></li>
												<li class="category"><button type="button" class="btn"
														id="600">도서/티켓/문구</button></li>
												<li class="category"><button type="button" class="btn"
														id="700">뷰티/미용</button></li>
												<li class="category"><button type="button" class="btn"
														id="800">반려</button></li>
											</ul>
										</div>
										<div class="categoryStep">
											<ul class="categories" id="small_categories"></ul>
										</div>
									</div>
									<div class="categoryDiv" id="categoryDiv">카테고리를 선택해주세요.</div>

									<h3 class="selectedCategory">
										선택한 카테고리 : <b id="selectedCategory" name="cate_code"></b>
									</h3>
								</div>
							</li>
							<!-- 카테고리 -->


							<li class="list">
								<div class="location_sub">
									거래지역<span>*</span>
								</div>
								<div class="location_con">
									<div class="contentArea">
										<button type="button" id="searchAddr">주소 검색</button>
									</div>
									<input placeholder="선호 거래 지역을 검색해주세요." class="locationInput"
										id="product_location" name="product_location">
									<div class="locationDiv" id="locationDiv">거래지역을 선택해주세요.</div>
									<div class="add_description">

										<b> * 동·면·읍 까지 표시 됩니다.</b>
										<!-- 	<b>* 주소 검색 후 구매자에게 알려주고 싶은 주소 범위까지만 나타나도록 주소를 수정해주세요.</b><br> -->
										<!-- 	ex) 서울특별시 서초구 서초동 1303-34 → 서울특별시 서초구 서초동 -->
									</div>
									<div id="map"
										style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
								</div>
							</li>


							<li class="list">
								<div class="price_sub">
									가격<span>*</span>
								</div>
								<div class="price_con">
									<div class="priceBox">
										<input type="text" placeholder="숫자만 입력해주세요."
											class="priceInput" id="product_price" name="product_price">원
									</div>

								</div>
							</li>
							<!-- 가격 -->

							<li class="list">
								<div class="quantity_sub">
									수량<span>*</span>
								</div>
								<div class="quantity_con">
									<div class="quantityBox">
										<input type="text" placeholder="숫자만 입력해주세요."
											class="quantityInput" id="product_quantity"
											name="product_quantity">개
									</div>

								</div>
							</li>
							<!-- 수량 -->


							<li class="list">
								<div class="instruction_sub">설명</div>
								<div class="instruction_con">
									<textarea placeholder="상품 설명을 입력해주세요." rows="6"
										class="instruction" id="product_content"
										name="product_content"></textarea>
									<div class="text">
										<a target="_blank" href="/market/notice/fag"> </a>
										<div class="limit">0/2000</div>
									</div>
								</div>
							</li>
							<!-- 설명 -->

							<!-- 						</li> -->
						</ul>
					</section>



				</main>
				<!-- registMain -->
			</div>
			<!-- main -->
		</div>
		<!-- registWrap -->
	</form>

	<!--------- registBtm : 등록하기  --------->
</body>
<footer class="registBtm">
	<div class="btmArea">
		<!-- <button type="submit" class="registBtn" id="registBtn"></button> -->
		<button type="submit" class="registBtn" id="registBtn"></button>
	</div>
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp" />
	</div>
</footer>
</html>
