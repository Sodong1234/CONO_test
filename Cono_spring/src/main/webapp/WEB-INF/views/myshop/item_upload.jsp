<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registForm_btn.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modifyButton.css">
<script type="text/javascript">
// ---------------------------------- 카테고리 작업 --------------------------------------------------
	$(function() {
		
		let categoryList = {
				패션: ["여성패션","남성패션"],
				디지털_가전:["모바일","가전제품","카메라"],
				스포츠_레저:["캠핑","헬스"],
				가구_인테리어:["가구","인테리어"],
				생활_가공식품:["생활용품","식품"],
				도서_티켓:["도서","상품권","티켓"],
				뷰티_미용:["스킨케어","메이크업"],
				반려:["강아지 간식","고양이 간식", "기타"]
		}
		
		$("#big").on("change", function() {
			let big = $("#big").val();
			$("#category_area").html("<select name='category_small' id='small' size='8'></select>");
			for(let bigList in categoryList) {
				if(big == bigList) {
					for(let i = 0; i < categoryList[big].length; i++){
					$("#category_area > select").append("<option value=" + categoryList[big][i] + ">" + categoryList[big][i] + "</option>");
					}
				}
			}
		});
	});
	
	function check() {
		if($("#big").val() == null || $("#big").val() == "" || $("#small").val() == null || $("#small").val() == "") {
			alert("카테고리 선택 필수");
			return false;
		}
	}
// ---------------------------------------------------------------------------------------------------

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
	            document.getElementById("item_region").value = value;
	        }
	    }).open();
	}
// ------------------------------------------- 숫자만 입력 할 수 있게 하기 ----------------------------------------------

function checkNumber(event) {
  if(event.key === '.' 
     || event.key === '-'
     || event.key >= 0 && event.key <= 9) {
    return true;
  }
  
  return false;
}

// ------------------------------------------ 이미지 미리보기 ----------------------------------------
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
	
	</c:forEach>
	<c:forEach var="i" begin="1" end="6">
	// 이미지 초기화
	$(function() {
		$("#delFile${i}").click(function() {
			document.getElementById('target_img${i}').src = "${path}/resources/default_img.png";
			$("#file${i}").val("");
		});
	});
	</c:forEach>
// ---------------------------------------------------------------------------------------------------
	function submitBtn() {
		document.getElementById('btn').click();
	}
	
</script>
<style type="text/css">
	.section ul li {
		float: left;
	}
	#upload_img_area {
		margin: 0 auto;
	}
	#upload_img_area ul li {
		float: left;
	}	
	#upload_img_area img {
		margin: 5px 40px;
	}
    input[type=button] {
       background-color: white;
       border: none;
       text-decoration: none;
       color: red;
       padding: 3px 3px;
       margin: 3px 3px;
       cursor: pointer;
    }
    .delete_img {
    	margin: 5px 40px;
    }
</style>
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
	<div class="cono" style="width: 1200px; margin: auto; margin-left: 350px; margin-right: 350px;">
		<form action="ItemUploadPro.shop" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="member_id" value="<%=session.getAttribute("sId")%>">
			<div class="registWrap">
	
				<!--------- registBody : 본문  --------->
				<div class="registBody">
					<!-- /* owOgK */ -->
					<main id="registMain"> 
						<!-- /* fzZuLM */ -->
	
						<!-- section -->
						<section class="section"> 
							<h2>기본정보<span>*필수항목</span></h2>
							<ul>
								<li class="list" style="border: none;">
									<div class="category_sub">
										이미지<span>*</span>
									</div>
									<div id="upload_img_area">
										<ul>
											<li>
												<img alt="상점 이미지" id="target_img1" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file1" class="file1" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile1(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" id="delFile1" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile1" value="이미지삭제" src="${path }/resources/cancle.png"><br> --%>
												<div class="delete_img"><input type="button" id="delFile1" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
											<li>
												<img alt="상점 이미지" id="target_img2" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file2" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile2(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile2" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
												<div class="delete_img"><input type="button" id="delFile2" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
											<li>
												<img alt="상점 이미지" id="target_img3" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file3" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile3(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile3" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
												<div class="delete_img"><input type="button" id="delFile3" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
										</ul>
										<ul>
											<li>
												<img alt="상점 이미지" id="target_img4" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file4" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile4(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile4" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
												<div class="delete_img"><input type="button" id="delFile4" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
											<li>
												<img alt="상점 이미지" id="target_img5" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file5" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile5(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile5" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
												<div class="delete_img"><input type="button" id="delFile5" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
											<li>
												<img alt="상점 이미지" id="target_img6" src="resources/default_img.png" style="width: 200px; height: 200px;">
												<input type="file" id="file6" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile6(this)" style="display: none;">
<%-- 												<input type="image" style="width: 10px" border="0" id="delFile6" value="이미지삭제" src="<spring:url value='/resources/cancle.png'/>"><br> --%>
												<div class="delete_img"><input type="button" id="delFile6" value="X">이미지삭제</div>
<!-- 												<input type="file" class="img" accept=".gif, .jpg, .png" name="upload" style="display: none;"> -->
											</li>
										</ul>
									</div>
									
								</li>
								<li class="list">
									<div class="subject_sub"></div>
									<div class="imageDiv" id="imageDiv">상품 사진을 등록해주세요.<br>
										<b>* 상품 이미지는 상품 디테일 사진에 맞게 되어있음.</b><br>
										이미지는 10mb 넘으면 안됨, 1대1 비율이어야함 <br>
										<!-- 									- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br> -->
										<!-- 									- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> -->
										<!-- 									- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br> -->
										<!-- 									최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M) -->
									</div>
								</li>
								<!-- 제목 -->
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
											</div>
										</div>
										<div class="subjectDiv" id="subjectDiv">
										상품명을 2자 이상 입력해주세요.
										</div>
									</div>
								</li>
								
								<!-- 카테고리 -->
								<li class="list">
									<div class="category_sub">
										카테고리<span>*</span>
									</div>
									<div class="categoryStep">
										<select name="category_big" id="big" size="8">
											<option value="패션">패션</option>
											<option value="디지털_가전">디지털/가전</option>
											<option value="스포츠_레저">스포츠/레저</option>
											<option value="가구_인테리어">가구/인테리어</option>
											<option value="생활_가공식품">생활/가공식품</option>
											<option value="도서_티켓">도서/티켓</option>
											<option value="뷰티_미용">뷰티/미용</option>
											<option value="반려">반려</option>
										</select>
									</div>
									<div class="categoryStep">
										<div id="category_area">
											<select name="category_small" id="small" size="8">
												<option value="여성패션">여성패션</option>
												<option value="남성패션">남성패션</option>
											</select>
										</div>
									</div>
								</li>
								
								<!-- 거래 지역 -->
								<li class="list">
									<div class="location_sub">
										거래지역<span>*</span>
									</div>
									<div class="location_con">
										<div class="contentArea">
											 <a href="#"  onclick="getAddressInfo()" class="btnLightBlue"></a><br>
										</div>
										<br>
										<input type="text" name="item_region" id="item_region" readonly="readonly">
										<div class="locationDiv" id="locationDiv">거래지역을 선택해주세요.</div>
										<div class="add_description">
											<b> * 동·면·읍 까지 표시 됩니다.</b>
											<!-- 	<b>* 주소 검색 후 구매자에게 알려주고 싶은 주소 범위까지만 나타나도록 주소를 수정해주세요.</b><br> -->
											<!-- 	ex) 서울특별시 서초구 서초동 1303-34 → 서울특별시 서초구 서초동 -->
										</div>
										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; display: none">
										</div>
									</div>
								</li>
			
								<!-- 가격 -->
								<li class="list">
									<div class="price_sub">
										가격<span>*</span>
									</div>
									<div class="price_con">
										<div class="priceBox">
											<input type="text" placeholder="숫자만 입력해주세요."
												class="priceInput" id="product_price" name="item_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />원
										</div>
									</div>
								</li>
			
								<!-- 수량 -->
								<li class="list">
									<div class="quantity_sub">
										수량<span>*</span>
									</div>
									<div class="quantity_con">
										<div class="quantityBox">
											<input type="text" placeholder="숫자만 입력해주세요."
												class="quantityInput" name="item_quantity" id="item_quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />개
										</div>
									</div>
								</li>
			
			
								<!-- 설명 -->
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
							</ul>
						<!-- registMain -->
						
						 </section>
					</main>
				</div>
			</div>
				<!-- main -->
			<input type="submit" value="" id="btn" class="btn" name="등록">
		</form>
	</div>
	<div class ="btnArea" style="float:center; margin-left: 900px; margin-bottom: 50px;">
		<div class="svg-wrapper" >
     		 <svg height="40" width="120" xmlns="http://www.w3.org/2000/svg">
      			 <rect id="shape" height="40" width="120" />
     	 	</svg>
    		<div id="text">
     			 <a href="#" onclick="submitBtn()"><span class="spot"></span>등록하기</a>
     		</div>
   	 	</div>
	</div>
		<!-- registWrap -->

	<!--------- registBtm : 등록하기  --------->
	<div class="clear">
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>
