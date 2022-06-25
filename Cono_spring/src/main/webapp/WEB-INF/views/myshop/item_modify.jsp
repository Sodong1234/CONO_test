<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
		
		switch ("${itemDetail.category_big}") {
		case "패션" : $('#big').val('패션').prop("selected",true); 
						 	for(let i = 0; i < categoryList['패션'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['패션'][i] + ">" + categoryList['패션'][i] + "</option>");
						 	}
		break;
		case "디지털_가전" :  $('#big').val('디지털_가전').prop("selected",true);
				 			for(let i = 0; i < categoryList['디지털_가전'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['디지털_가전'][i] + ">" + categoryList['디지털_가전'][i] + "</option>");
					 		}
				 			break;
		case "스포츠_레저" : $('#big').val('스포츠_레저').prop("selected",true);
							for(let i = 0; i < categoryList['스포츠_레저'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['스포츠_레저'][i] + ">" + categoryList['스포츠_레저'][i] + "</option>");
						 	}
							break;
		case "가구_인테리어" : $('#big').val('가구_인테리어').prop("selected",true); 
							for(let i = 0; i < categoryList['가구_인테리어'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['가구_인테리어'][i] + ">" + categoryList['가구_인테리어'][i] + "</option>");
						 	}
							break;
		case "생활_가공식품" : $('#big').val('생활_가공식품').prop("selected",true); 
							for(let i = 0; i < categoryList['생활_가공식품'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['생활_가공식품'][i] + ">" + categoryList['생활_가공식품'][i] + "</option>");
						 	}
							break;
		case "도서_티켓" : $('#big').val('도서_티켓').prop("selected",true); 
							for(let i = 0; i < categoryList['도서_티켓'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['도서_티켓'][i] + ">" + categoryList['도서_티켓'][i] + "</option>");
						 	}
							break;
		case "뷰티_미용" : $('#big').val('뷰티_미용').prop("selected",true); 
							for(let i = 0; i < categoryList['뷰티_미용'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['뷰티_미용'][i] + ">" + categoryList['뷰티_미용'][i] + "</option>");
						 	}
							break;
		case "반려" : $('#big').val('반려').prop("selected",true); 
							for(let i = 0; i < categoryList['반려'].length; i++){
								$("#category_area > select").append("<option value=" + categoryList['반려'][i] + ">" + categoryList['반려'][i] + "</option>");
						 	}
							break;
		}
		
		switch ("${itemDetail.category_small}") {
		case "여성패션" :$('#small').val('여성패션').prop("selected",true); break;
		case "남성패션" : $('#small').val('남성패션').prop("selected",true); break;
		case "모바일" :$('#small').val('모바일').prop("selected",true); break;
		case "가전제품" :$('#small').val('가전제품').prop("selected",true); break;
		case "카메라" :$('#small').val('카메라').prop("selected",true); break;
		case "캠핑" : $('#small').val('캠핑').prop("selected",true); break;
		case "헬스" : $('#small').val('헬스').prop("selected",true); break;
		case "가구" : $('#small').val('가구').prop("selected",true); break;
		case "인테리어" : $('#small').val('인테리어').prop("selected",true); break;
		case "생활용품" : $('#small').val('생활용품').prop("selected",true); break;
		case "식품" : $('#small').val('식품').prop("selected",true); break;
		case "도서" : $('#small').val('도서').prop("selected",true); break;
		case "상품권" :$('#small').val('상품권').prop("selected",true); break;
		case "티켓" : $('#small').val('티켓').prop("selected",true); break;
		case "스킨케어" : $('#small').val('스킨케어').prop("selected",true); break;
		case "메이크업" :$('#small').val('메이크업').prop("selected",true); break;
		case "강아지" : $('#small').val('강아지').prop("selected",true); break;
		case "고양이" : $('#small').val('고양이').prop("selected",true); break;
		case "기타" : $('#small').val('기타').prop("selected",true); break;
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
			document.getElementById('target_img${i}').src = "${pageContext.request.contextPath}/resources/default_img.png";
			$("#file${i}").val("");
		});
	});
	</c:forEach>
	
	// ---------------------------------------글자수 세기-------------------------------------------------
	$(function() {
	$('#product_subject').keyup(function(){
		  var content = $(this).val();
		  $('#cnt').html(content.length);
		  if (content.length > 20){
		    alert("최대 20자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 20));
		    $('#product_subject .count span').html(20);
		  }
		});
		
	});
	
	$(function() {
	$('#product_content').keyup(function(){
		  var content = $(this).val();
		  $('#cnt2').html(content.length);
		  if (content.length > 1000){
		    alert("최대 2000자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 1000));
		    $('#product_content .count span').html(1000);
		  }
		});
	});
	
// ---------------------------------------------------------------------------------------------------
	function submitBtn() {
		document.getElementById('btn').click();
	}
	
	function check() {
		if($("#big").val() == null || $("#big").val() == "" || $("#small").val() == null || $("#small").val() == "") {
			alert("카테고리 선택 필수");
			return false;
		}
		<c:forEach var="i" begin="1" end="6">
			if(document.getElementById('target_img${i}').src != "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/resources/default_img.png") {
				
// 				alert(imgStatus[${i}-1]);
// 				imgStatus[${i}-1] = 'Y';
				document.fr.imgStatus.value += "Y/";
				
			} else {
				document.fr.imgStatus.value += "N/";
			}
			// 이미지 상태를 java로 넘기기 위해 하나의 String으로 합침
// 			document.fr.imgStatus.value += imgStatus[${i}-1] + "/";
		</c:forEach>
			alert(document.fr.imgStatus.value);
		
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
	width: 200px;
	height: 200px;
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

hr.hr-13 {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8c8c inset;
	width: 1020px;
	margin-left: 0px;
}
#svg-wrapper
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
		<form name="fr" action="ItemModifyPro.shop" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}"> 
			<input type="hidden" name="imgStatus" value="">
			<div class="registWrap">
	
				<!--------- registBody : 본문  --------->
				<div class="registBody">
					<!-- /* owOgK */ -->
					<main id="registMain"> 
						<!-- /* fzZuLM */ -->
	
						<!-- section -->
						<section class="section"> 
							<h2>상품 정보 수정</h2>
								<hr class="hr-13">
							<ul>
								<li class="list" style="border: none;">
									<div class="category_sub">
										이미지
									</div>
									<div id="upload_img_area">
										<ul>
												<c:forEach var="i" begin="1" end="3">
													<li>
														<c:choose>
															<c:when test="${imgList.get(i-1).getImg_name() ne null}">
																<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }">
																<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
																<div class="delete_img"><input type="button" id="delFile${i }" value="X">이미지삭제</div>
															</c:when>
															<c:when test="${imgList.get(i-1).getImg_name() eq null}">
																<img id="target_img${i }" alt="상점 이미지" src="resources/default_img.png">
																<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
																<div class="delete_img"><input type="button" id="delFile${i }" value="X">이미지삭제</div>
															</c:when>
														</c:choose>
													</li>
												</c:forEach>
												<c:forEach var="i" begin="4" end="6">
													<li>
														<c:choose>
															<c:when test="${imgList.get(i-1).getImg_name() ne null}">
																<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }">
																<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
																<div class="delete_img"><input type="button" id="delFile${i }" value="X">이미지삭제</div>
															</c:when>
															<c:when test="${imgList.get(i-1).getImg_name() eq null}">
																<img id="target_img${i }" alt="상점 이미지" src="resources/default_img.png">
																<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
																<div class="delete_img"><input type="button" id="delFile${i }" value="X">이미지삭제</div>
															</c:when>
														</c:choose>
													</li>
												</c:forEach>
										</ul>
									</div>
									
								</li>
								<!-- 제목 -->
								<li class="list">
									<div class="subject_sub">
										제목
									</div>
									<div class="subject_con">
										<div class="contentArea">
											<div class="subjectBox">
												<input type="text" class="subjectInput" id="product_subject" name="item_title" value="${itemDetail.get('item_title')}" style="resize: "none"; maxlength="20">
											</div>
										</div>
										<div class="subjectDiv" id="subjectDiv">
										상품명을 2자 이상 입력해주세요. &nbsp;&nbsp;&nbsp;
										<div class="limit"><span id="cnt">0</span>/20</div>
										</div>
									</div>
								</li>
								
								<!-- 카테고리 -->
								<li class="list">
									<div class="category_sub">
										카테고리
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
										거래지역
									</div>
									<div class="location_con">
										<div class="contentArea">
											 <a href="#"  onclick="getAddressInfo()" class="btnLightBlue"></a><br>
										</div>
										<br>
										<input type="text" name="item_region" id="item_region" readonly="readonly" value="${itemDetail.get('item_region')}">
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
										가격
									</div>
									<div class="price_con">
										<div class="priceBox">
											<input type="text"  value="${itemDetail.get('item_price')}" 
												class="priceInput" id="product_price" name="item_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />원
										</div>
									</div>
								</li>
			
								<!-- 수량 -->
								<li class="list">
									<div class="quantity_sub">
										수량
									</div>
									<div class="quantity_con">
										<div class="quantityBox">
											<input type="text"  value="${itemDetail.get('item_quantity')}" 
												class="quantityInput" name="item_quantity" id="item_quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />개
										</div>
									</div>
								</li>
			
			
								<!-- 설명 -->
								<li class="list">
									<div class="instruction_sub">설명</div>
									<div class="instruction_con">
										<textarea  rows="6"
											class="instruction" id="product_content"
											name="item_content" style="resize: "none"; maxlength="2000">${itemDetail.get('item_content')} </textarea>
										<div class="text">
											<a target="_blank" href="/market/notice/fag"> </a>
												<div class="limit"><span id="cnt2">0</span>/1000</div>
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
<!-- 			<input type="submit" value="" id="btn" class="btn" name="수정"> -->
<!-- 			<div class ="btnArea" style="float:center; margin-left: 900px; margin-bottom: 50px;"> -->
				<div class="svg-wrapper" style="width: 100%; text-align: center;">
<!-- 		     		 <svg height="40" width="120" xmlns="http://www.w3.org/2000/svg"> -->
		<!--       			 <rect id="shape" height="40" width="120" /> -->
<!-- 		     	 	</svg> -->
		    		<input type="submit" class="btn" value="수정" > 
					<input type="button" class="btn" value="취소" onclick="history.back()">
		   	 	</div>
<!-- 			</div> -->
		</form>
	</div>
		<!-- registWrap -->

	<!--------- registBtm : 등록하기  --------->
	<div class="clear">
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>