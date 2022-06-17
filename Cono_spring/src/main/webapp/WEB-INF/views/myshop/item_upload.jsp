<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코노::상품등록</title>

<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<%-- <script defer src="${path}/resources/js/registForm.js"></script> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registForm_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registForm_btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">

<script type="text/javascript">

//	$(function() {
//	$(".img").change(function() {
//		alert($(".img").val().split(".")[1]);
//		/* 나중에 하자                       이게 뭐더라 */
//	});
//});

	$(function() {
		$("#big").on("change", function() {
			let big = $("#big").val()-1;	// 대분류 value값
			$.ajax({
				type:"GET",
				url:"${path}/resources/category.txt",
				dataType: "json"
			})
			.done(function(data) {
				$("#category_area").html("<select name='category_small' id='small' size='8'></select>");
				let keys = data[big];	// 대분류에 해당하는 소분류 배열
				for(let j = 0; j < Object.keys(keys).length; j++) {
					let value = Object.keys(keys)[j];	// 소분류 key값
					$("#category_area > select").append("<option value='Object.keys(keys)[j]'>" + keys[value] + "</option>");
				}
			})
			.fail(function() {
				$("#category_area").html("요청 실패");
			});
		});
	});
	
// ------------------------------------------ 주소 API -----------------------------------------------
	function getAddressInfo(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	      	
	            var value = "";
	            var jusoSangsae = "";
	            var str = data.jibunAddress;   // 풀주소 저장
//	             str = str.split(" ");          // 공백으로 짤라준다

	            // -> 공백으로 짜르는 이유는 해당 API에서 (서울특별시 강남동 강남구99-9) 이런식으로 띄어쓰기로 시 군 구 를 반환해주기 때문.
	            // -> 서울특별시 강남동 강남구99-9를 띄어쓰기로 파싱하면 {"서울특별시","강남동","강남구","99-9"} 이런으로 파싱된다                
	            if(data.userSelectedType == "J"){   // 사용자가 지번을 클릭했다면
//	             	value = data.address;
	            	value = data.jibunAddress; // 지번 주소 
	            	
	            	str = value.split(" ");
	            	value = str[2];	// 동 / 구 입력 
	            }else{ // 사용자가 도로명을 클릭했다면
	            	value = data.jibunAddress;	
	            	str = value.split(" ");
	            	value = str[2];
	            }
	            alert(value);
	            document.getElementById("item_region").value = value;
	        }
	    }).open();
	}
// ---------------------------------------------------------------------------------------------------
</script>

</head>
<div>
	<!-- 상단 부분 -->
	<jsp:include page="../header_footer/header.jsp" />
</div>

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		

<body>
	<div class="cono" style="width: 1140px; margin: auto;">
	<form action="ItemUploadPro.shop" method="post" enctype="multipart/form-data">
			<input type="hidden" name="member_id" value="<%=session.getAttribute("sId")%>">
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

<!-- 						<ul class="listBody"> </ul> -->
<!-- <!-- 							/* bEbvUk */ --> 
<!-- 							<li class="list"> </li> -->
<!-- 								<div class="image_sub"> -->
<!-- 									상품이미지<span>*</span><small>(0/6)</small> -->
<!-- 								</div> -->
<!-- 								<div class="image_con"> </div> -->
<!-- 									<ul class="registImages" id="imageList"> -->
<!-- 										<li class="imageList">이미지 등록 <input type="file" multiple="6" id="inputImage"> -->
<!-- 										</li> -->
<!-- 									</ul> -->

						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>

									<div class="imageDiv" id="imageDiv">상품 사진을 등록해주세요.</div>
									<div class="add_description">
										<b>* 상품 이미지는 상품 디테일 사진에 맞게 되어있음.</b><br> 
										이미지는 10mb 넘으면 안됨, 1대1 비율이어야함 <br>
										<!-- 									- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br> -->
										<!-- 									- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> -->
										<!-- 									- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br> -->
										<!-- 									최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M) -->
									</div>
									 </section>
								</main>
								</div>
<!-- 							</li> -->
							<!-- 상품이미지 -->
<!-- 						</ul> -->

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
												name="item_title">
<!-- 											<button type="button" class="subjectCancle"></button> -->
										</div>
										<div class="subjectSize">
<!-- 											<span>0</span>/40 -->
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
									<div class="categoryStep">
										<select name="category_big" id="big" size="8">
											<option value="1">패션</option>
											<option value="2">디지털/가전</option>
											<option value="3">스포츠/레저</option>
											<option value="4">가구/인테리어</option>
											<option value="5">생활/가공식품</option>
											<option value="6">도서/티켓</option>
											<option value="7">뷰티/미용</option>
											<option value="8">반려</option>
										</select>
									</div>
									<div class="categoryStep">
										<div id="category_area">
											<select name="category_small" id="small" size="8">
												<option value="11">여성패션</option>
												<option value="12">남성패션</option>
											</select>
										</div>
								</div>

							</li>
							<!-- 카테고리 -->


							<li class="list">
								<div class="location_sub">
									거래지역<span>*</span>
								</div>
								<div class="location_con">
									<div class="contentArea">
										<input type="button" value="지역선택" onclick="getAddressInfo()">
									</div>
									<input type="text" name="item_region" id="item_region" readonly="readonly">
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
											class="priceInput" id="product_price" name="item_price">원
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
											class="quantityInput" name="item_quantity" id="item_quantity">개
									</div>

								</div>
							</li>
							<!-- 수량 -->


							<li class="list">
								<div class="instruction_sub">설명</div>
								<div class="instruction_con">
									<textarea placeholder="상품 설명을 입력해주세요." rows="6"
										class="instruction" id="product_content"
										name="item_content" ></textarea>
									<div class="text">
										<a target="_blank" href="/market/notice/fag"> </a>
										<div class="limit">0/2000</div>
									</div>
								</div>
							</li>
							<!-- 설명 -->

							<!-- 						</li> -->
						</ul>



				<!-- registMain -->
			</div>
			<!-- main -->
		<input type="submit" value="등록하기">
	</form>
		</div>
		<!-- registWrap -->

	<!--------- registBtm : 등록하기  --------->
</body>
<!-- <footer class="registBtm"> -->
<!-- 	<div class="btmArea"> -->
		<!-- <button type="submit" class="registBtn" idC="registBtn"></button> -->
<!-- 		<button type="submit" class="registBtn" id="registBtn"></button> -->
<!-- 	</div> -->
<!-- </footer> -->
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</html>
