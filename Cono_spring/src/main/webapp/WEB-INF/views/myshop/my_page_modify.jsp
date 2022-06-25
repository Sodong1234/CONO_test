<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button_mng.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function() {
		// 이미지 클릭 시 파일 선택 창 열림
		$('#img').click(function (e) {
		    e.preventDefault();
		    $('#file').click();
		});
	});
	
	// 파일 선택 시 이미지 src 변환
	function readInputFile(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result); 
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	// 이미지 초기화
	function deleteImg() {
		document.getElementById('img').src = "http://localhost:8080/cono/resources/default_img.png";
		$("#file").val("");
	}
	
	function check() {
		if(document.getElementById('img').src != "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/resources/default_img.png") {
			document.shopForm.imgStatus.value = "Y";
			
		} else {
			document.shopForm.imgStatus.value = "N";
		}
	}
	
	
	// 글자 수 체크
	$(function() {
		$('#board_content').keyup(function(){
			  var content = $(this).val();
			  $('#cnt').html(content.length);
			  if (content.length > 20){
			    alert("최대 50자까지 입력 가능합니다.");
			    $(this).val(content.substring(0, 50));
			    $('#board_content .count span').html(50);
			  }
			});
			
		});
</script>
<style type="text/css">

 input[type=button] {
       background-color: white;
       border: none;
       text-decoration: none;
       color: red;
       padding: 3px 3px;
       margin: 3px 3px;
       cursor: pointer;
    }

</style>
<meta charset="UTF-8">
<title>CONO::내상점수정</title>
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
	${myShop.get('shop_name') }의 상점 수정하기 [${myShop.get('member_date') }]</h2> 
	
	<hr class="hr-13">
	<hr>
	
		<form action="ProductMyshopModifyPro.shop" name="shopForm" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="shop_idx" value="${myShop.get('shop_idx') }">
			<input type="hidden" name="imgStatus" value="">
				<div class="form-group" style="width: 424px; margin-right: 70%; font-family:IBMPlexSansKR-Regular;" >
						<c:choose>
						<c:when test="${myShop.get('shop_img') eq null }">
							<img alt="상점 이미지" id="img" style="width: 300px;" src="<spring:url value='/resources/default_img.png'/>" >
						</c:when>
						<c:when test="${myShop.get('shop_img') ne null }">
							<img alt="상점 이미지" id="img" style="width: 300px;" src="<spring:url value='/resources/upload/shopImg/${myShop.get("shop_img") }'/>">
						</c:when>
						</c:choose>
						<input type="file" id="file" name="upload" onchange="readInputFile(this)" style="display: none;">
						<br>
						<input type="button" id="delFile${i }" onclick="deleteImg${i}()" value="X">이미지삭제</div>
						<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
      				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="member_pass" required="required">
						 <label class="col-form-label mt-4" for="inputDefault">상점이름</label>
 				 <input type="text" class="form-control" placeholder="Default input" id="inputDefault" name="shop_name" value="${myShop.get('shop_name') }" >
				      <label for="exampleTextarea" class="form-label mt-4">내 상점 소개</label>
				      <textarea class="form-control" id="board_content" rows="5" name="shop_content">${myShop.get('shop_content') }</textarea>
						<div class="limit" style="float: right;"><span id="cnt">0</span>/50</div>

						<input type="submit" class="btn" style="width: 165px" value="수정" > 
<!-- 						<input type="button" class="btn2" value="취소" onclick="history.back()"> -->
						<button class="btn" style="width: 165px" onclick="history.back()">취소</button>
	</form>
				    </div>

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>

</body>
</html>