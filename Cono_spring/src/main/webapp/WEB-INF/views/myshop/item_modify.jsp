<%@page import="com.itwillbs.cono.vo.ImgDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
if (session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/item_detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nav.css">
<!-- <script defer src="../js/store.js"></script> -->
<!-- <script defer src="../js/reviews.js"></script>상점 상품후기 수 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-colors-flat.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	let imgStatus = [];
	
	for(let i = 0; i < 6; i++) {
		imgStatus[i] = 'N';
	}
	
	<c:forEach var="i" begin="1" end="6">
	$(function() {
		// 이미지 클릭 시 파일 선택 창 열림
		$('#target_img${i}').click(function (e) {
			    e.preventDefault();
			    $('#file${i}').click();
			});
	});	
	
	// 파일 선택 시 이미지 src 변환
	function readInputFile${i}(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#target_img${i}').attr('src', e.target.result); 
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	// 이미지 초기화
	function deleteImg${i}() {
			document.getElementById('target_img${i}').src = "http://localhost:8080/cono/resources/upload/default_img.png";
			$("#file${i}").val("");
	}
	</c:forEach>
	
	// 이미지 유무 상태 체크
	function imgStatusCheck() {
		<c:forEach var="i" begin="1" end="6">
			if(document.getElementById('target_img${i}').src != "http://localhost:8080/cono/resources/upload/default_img.png") {
				imgStatus[${i}] = 'Y';
			}
			// 이미지 상태를 java로 넘기기 위해 하나의 String으로 합침
			document.fr.imgStatus.value += imgStatus[${i}] + "/";
			
		</c:forEach>
		
		
	}
	
</script>

<style>
div {
	margin: auto;
}

.w3-button {
	width: 150px;
}

img {
	width: 200px;
}

input[type=file] {
	display: none;
}
</style>
</head>
<body>

	<jsp:include page="../header_footer/header.jsp" />


	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		

	<h1>상품 정보 수정</h1>
	<div>

		<hr>
		<form name="fr" action="ItemModifyPro.shop" method="post"
			enctype="multipart/form-data" onsubmit="return imgStatusCheck()">

			<input type="hidden" name="item_idx"
				value="${itemDetail.get('item_idx')}"> <input type="hidden"
				name="imgStatus" value="">

		</form>

		<div id="storeBody">
			<div id="storeWrap">
				<div id="storeTop">
					<div id="profileLeftWrap">
						<div id="profileLeft">
							<div class="background1">
								<div class="backgroundImg"></div>
							</div>
							<!-- // (1) background -->


							상품 이미지 변경

							<button type="button">
								<img src="${pageContext.request.contextPath}/resources/img/cancle.png" alt="">
							</button>

							<div class="background2">
								<div class="profileLink">
									<!-- 프로필 기본 이미지 -> 프로필 사진 변경 -->
									<div id="preview">
										<img width="80" height="80" alt="상점 프로필 이미지"
											class="profileImage" src="">
									</div>
								</div>
								<div class="profileNickname"></div>




								<!-- 	<div id="middleWrap"> -->

								<!-- 			</div>middleWrap -->
								<!-- 			<!-- 상점 주인 : 소개글 -->


								<!-- 			<div class="introduce"> -->
								<!-- 				</div> -->




								<div class="introduceEdit">
									<button class="introduceEditBtn"
										onclick="location.href='ProductMyshopModifyForm.shop'">
										이미지수정</button>
								</div>



							</div>
						</div>
					</div>


					<div class="profileRight">

						<div class="w3-panel w3-leftbar w3-border-blue">상품명</div>

						<div class="w3-panel w3-border w3-hover-border-blue">
							<p>
								<input type="text" name="item_title"
									value="${itemDetail.get('item_title')}" />
							</p>
						</div>


						<div class="w3-panel w3-leftbar w3-border-blue">카테고리</div>

						<select name="category_big">
							<option
								<c:if test="${itemDetail.get('category_big') eq '1' }">selected="selected"</c:if>>1</option>
							<option
								<c:if test="${itemDetail.get('category_big') eq '2' }">selected="selected"</c:if>>2</option>
							<option
								<c:if test="${itemDetail.get('category_big') eq '3' }">selected="selected"</c:if>>3</option>
						</select> 
						
						<select name="category_small">
							<option
								<c:if test="${itemDetail.get('category_small') eq '1' }">selected="selected"</c:if>>1</option>
							<option
								<c:if test="${itemDetail.get('category_small') eq '2' }">selected="selected"</c:if>>2</option>
							<option
								<c:if test="${itemDetail.get('category_small') eq '3' }">selected="selected"</c:if>>3</option>
						</select>

						<div class="w3-panel w3-leftbar w3-border-blue">거래지역</div>

						<div class="w3-panel w3-border w3-hover-border-blue">
							<p>
								<input type="text" name="item_title" value="${itemDetail.get('item_region')} 우편 번호 API 사용 (원래 주소 출력)" />
							</p>
						</div>



						<div class="w3-panel w3-leftbar w3-border-blue">가격</div>


						<div class="w3-panel w3-border w3-hover-border-blue">
							<p>
								<input type="text" name="item_price"
									value="${itemDetail.get('item_price')}"   />
							</p>
						</div>

						<div class="w3-panel w3-leftbar w3-border-blue">수량</div>


						<div class="w3-panel w3-border w3-hover-border-blue">
							<p>
								<input type="text" name="item_quantity" value="${itemDetail.get('item_quantity')}" />
							</p>
						</div>
						<div class="w3-panel w3-leftbar w3-border-blue">상품 소개</div>

						<textarea class="form-control" id="exampleTextarea"
							name="item_content" cols="30" rows="4">${itemDetail.get('item_content')}</textarea>
						<br> <br> <br> <br> <br>

						<div class="w3-container">
							<input type="submit" class="w3-button w3-blue" value="수정">
						</div>

					</div>


				</div>
			</div>
		</div>
		
	</div>












	

	<jsp:include page="../header_footer/footer.jsp" />
</body>
</html>