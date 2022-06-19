<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<link rel="stylesheet" href="https://www.w3schools.c


om/lib/w3-colors-flat.css">
<script src="resources/js/jquery-3.6.0.js">
	
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
				
		
	<c:forEach var="i" begin="1" end="6">
		<c:choose>
			<c:when test="${imgList.get(i-1).getImg_name() ne null}">
				<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }">
				<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)">
<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
				<input type="image" style="width: 10px" border="0" id="delFile${i }" value="이미지삭제" onclick="deleteImg${i}()" src="<spring:url value='/resources/cancle.png'/>" >&nbsp;이미지 삭제하기<br>
			</c:when>
			<c:when test="${imgList.get(i-1).getImg_name() eq null}">
				<img id="target_img${i }" alt="상점 이미지" src="resources/default_img.png">
				<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)">
<%-- 				<input type="button" id="delFile${i }" value="x" onclick="deleteImg${i}()"><br> --%>
				<input type="image" style="width: 10px" border="0" id="delFile${i }" value="이미지삭제" onclick="deleteImg${i}()" src="<spring:url value='/resources/cancle.png'/>" >&nbsp;이미지 삭제하기<br>
			</c:when>
		</c:choose>
	</c:forEach>
	
	
			<div class="form-group">
	
				  <label class="col-form-label mt-4" for="inputDefault">상품명</label>
 				 <input type="text" class="form-control"  id="inputDefault" name="item_title" value="${itemDetail.get('item_title')}" >
 				 
 				  <label class="col-form-label mt-4" for="inputDefault">상품 소개</label>
 				 <input type="text" class="form-control"  id="inputDefault" name="item_content" value="${itemDetail.get('item_content')}" >
 				 
 				  <label class="col-form-label mt-4" for="inputDefault">가격</label>
 				 <input type="text" class="form-control"  id="inputDefault" name="item_price" value="${itemDetail.get('item_price')}" >
 				 
 				  <label class="col-form-label mt-4" for="inputDefault">수량</label>
 				 <input type="text" class="form-control"  id="inputDefault" name="item_quantity" value="${itemDetail.get('item_quantity')}" >
 				 
<!--  				  <label class="col-form-label mt-4" for="inputDefault">카테고리</label> -->
 				   <label for="exampleSelect1" class="form-label mt-4">카테고리</label><br><br>
      					<select class="form-select" id="exampleSelect1" name="category_big">
      					
 				 
							<option <c:if test="${itemDetail.get('category_big') eq '1' }">selected="selected"</c:if>>1</option>
							<option <c:if test="${itemDetail.get('category_big') eq '2' }">selected="selected"</c:if>>2</option>
							<option <c:if test="${itemDetail.get('category_big') eq '3' }">selected="selected"</c:if>>3</option>
						</select>
						
						<select class="form-select" id="exampleSelect1" name="category_small">
							<option <c:if test="${itemDetail.get('category_small') eq '1' }">selected="selected"</c:if>>1</option>
							<option <c:if test="${itemDetail.get('category_small') eq '2' }">selected="selected"</c:if>>2</option>
							<option <c:if test="${itemDetail.get('category_small') eq '3' }">selected="selected"</c:if>>3</option>
						</select> <br>
						
						
						
						
						
 				 
 				  <label class="col-form-label mt-4" for="inputDefault">거래지역</label>
 				 <input type="text" class="form-control" id="inputDefault" name="item_region" value="${itemDetail.get('item_region')} " ><br><br>
	
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