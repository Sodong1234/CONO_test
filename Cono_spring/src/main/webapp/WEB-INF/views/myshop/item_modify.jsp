<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button_mng.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">
<script src="${path }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	let imgStatus = ['N','N','N','N','N','N'];
	
	<c:forEach var="i" begin="1" end="6">
	$(function() {
		// 이미지 클릭 시 파일 선택 창 열림
		$('#target_img${i}').click(function (e) {
			    e.preventDefault();
			    $('#file${i}').click();
		});
		
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
			document.getElementById('target_img${i}').src = "${path}/resources/default_img.png";
			$("#file${i}").val("");
	}
	</c:forEach>
	
	// 이미지 유무 상태 체크
	function imgStatusCheck() {
		<c:forEach var="i" begin="1" end="6">
			if(document.getElementById('target_img${i}').src != "${path}/resources/default_img.png") {
				imgStatus[${i}] = 'Y';
			}
			// 이미지 상태를 java로 넘기기 위해 하나의 String으로 합침
			document.fr.imgStatus.value += imgStatus[${i}] + "/";
			
		</c:forEach>
	}
</script>
<style type="text/css">
	#item_modify_area {
		margin: 0 auto;
	}
	#item_modify_area ul li {
		float: left;
	}
	#item_img_area img {
		margin: 5px 40px;
	}
	#item_img_area {
		float: left;
	}
	.category_sub {
	    width: 10.5rem;
	    font-size: 18px;
	    padding-top: 8px;
	}

	#big, #small {
	    width: 10.5rem;
	    font-size: 18px;
	    padding-top: 8px;
	}
	.categoryStep {
    width: 200px;
    height: 50%;
	}
	.categoryStep select {
		width: 150px;
		text-align: center;
	}
	.categoryStep option:hover {
		background-color: rgb(244, 244, 250);
	}
	.categoryStep option:active {
		background-color: rgb(244, 244, 250);	
	}
	#category_list div{
		float: left;
	}
</style>
<meta charset="UTF-8">
<title>내 상품 수정</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/header.jsp"/>
	</div>

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
		
  <div id="storeWrap"><h2 style="font-family: Cafe24Ohsquare;">
	${myShop.get('shop_name') }의 상품 수정하기 ${myShop.get('member_date') }</h2> 
	
	
	<hr class="hr-13">
	<hr>
	
		<form name="fr" action="ItemModifyPro.shop" method="post"
			enctype="multipart/form-data" onsubmit="return imgStatusCheck()">
			<input type="hidden" name="item_idx"
				value="${itemDetail.get('item_idx')}"> 
				<input type="hidden" name="imgStatus" value="">
			<div class="form-group">
<!-- 						<div id="item_modify_area">				 -->
				<ul>
					<li>
							<ul>	
								<div id="item_img_area">
									<c:forEach var="i" begin="1" end="3">
										<li>
											<c:choose>
												<c:when test="${imgList.get(i-1).getImg_name() ne null}">
													<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }" style="width: 200px; height: 200px;">
													<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
									<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
													<div class="delete_img"><input type="button" id="delFile${i }" onclick="deleteImg${i}()" value="X">이미지삭제</div>
												</c:when>
												<c:when test="${imgList.get(i-1).getImg_name() eq null}">
													<img id="target_img${i }" alt="상점 이미지" src="resources/default_img.png">
													<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
									<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
													<div class="delete_img"><input type="button" id="delFile${i }" onclick="deleteImg${i}()" value="X">이미지삭제</div>
												</c:when>
											</c:choose>
										</li>
									</c:forEach>
									<c:forEach var="i" begin="4" end="6">
										<li>
											<c:choose>
												<c:when test="${imgList.get(i-1).getImg_name() ne null}">
													<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }" style="width: 200px; height: 200px;">
													<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
									<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
													<div class="delete_img"><input type="button" id="delFile${i }" onclick="deleteImg${i}()" value="X">이미지삭제</div>
												</c:when>
												<c:when test="${imgList.get(i-1).getImg_name() eq null}">
													<img id="target_img${i }" alt="상점 이미지" src="resources/default_img.png">
													<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" style="display: none;">
									<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
													<div class="delete_img"><input type="button" id="delFile${i }" onclick="deleteImg${i}()" value="X">이미지삭제</div>
												</c:when>
											</c:choose>
										</li>
									</c:forEach>
								</div>
							</ul>

					</li>
					<li>
						<label class="col-form-label mt-4" for="inputDefault">상품명</label>
		 				<input type="text" class="form-control"  id="inputDefault" name="item_title" value="${itemDetail.get('item_title')}" >
	 				</li>
	 				<li> 
		 				<label class="col-form-label mt-4" for="inputDefault">상품 소개</label>
		 				<input type="text" class="form-control"  id="inputDefault" name="item_content" value="${itemDetail.get('item_content')}" >
	 				</li>
	 				<li>
		 				<label class="col-form-label mt-4" for="inputDefault">가격</label>
		 				<input type="text" class="form-control"  id="inputDefault" name="item_price" value="${itemDetail.get('item_price')}" >
	 				</li>
	 				<li>
		 				<label class="col-form-label mt-4" for="inputDefault">수량</label>
		 				<input type="text" class="form-control"  id="inputDefault" name="item_quantity" value="${itemDetail.get('item_quantity')}" >
	 				</li>
	<!--  				  <label class="col-form-label mt-4" for="inputDefault">카테고리</label> -->
					<li>
		 				<label class="col-form-label mt-4" for="inputDefault">거래지역</label>
		 				<input type="text" class="form-control" id="inputDefault" name="item_region" value="${itemDetail.get('item_region')} " ><br><br>
					</li>	
					<li id="category_list">
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
					
				</ul>
										</div>
			</div>		

	
	
	
	
	
	
	

						<input type="submit" class="btn" value="수정" > 
						<input type="button" class="btn" value="취소" onclick="history.back()">
	</form>
				    </div>
		
<!-- </div>  -->

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>

</body>
</html>