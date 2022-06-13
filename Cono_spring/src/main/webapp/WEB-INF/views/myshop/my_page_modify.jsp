<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<script defer src="../js/store.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">
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
</script>
<meta charset="UTF-8">
<title>내 상점 수정</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	<!------ 상단 바 ------>

		<!-- 사이드 바 -->
		
				<aside class="side">
				<ul class="side-list">
					<li>
				  <a class="nav-link active" aria-current="page" href="ProductMyshop.shop">내 상점</a>
				  <a class="nav-link" href="ItemUploadForm.shop">상품 등록</a>
				  <a class="nav-link" href="ItemMng.shop">상품 관리</a>
				  <a class="nav-link" href="ItemReviewMng.shop">상품 후기 관리</a>
				  <a class="nav-link" href="ItemOrdMng.shop">상품 주문 관리</a>
				  <a class="nav-link" href="follow_shop.jsp">팔로우 상점</a>
				  </li>
			  </ul>
			</aside>
			
		<!-- 사이드 바 -->
	<hr>
	
	<form action="ProductMyshopModifyPro.shop" name="shopForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="shop_idx" value="${myShop.get('shop_idx') }">
			
	<div id="storeBody">
	<div id="storeWrap">
		<div id="storeTop">
			<div id="profileLeftWrap">
				<div id="profileLeft">
					<div class="background1">
						<div class="backgroundImg"></div>
					</div><!-- // (1) background -->
					<div class="background2">
						<div class="profileLink"> 
							<!-- 프로필 기본 이미지 -> 프로필 사진 변경 -->
							<div id="preview">
								<img width="80" height="80" alt="상점 프로필 이미지" class="profileImage" src="">
							</div>
						</div>
						<div class="profileNickname"></div>
						

				
				
				
	<div id="middleWrap">
	
			</div><!-- middleWrap -->
			<!-- 상점 주인 : 소개글 -->
			
			
			<div class="introduce">
				</div>
				
			<div class="introduceEdit"><button class="introduceEditBtn" onchange="readInputFile(this)">이미지 수정</button></div> 
<!-- 			<input type="button" id="delFile" value="x" onclick="deleteImg()"> -->
			
			
			
			
				
						</div>
					</div>
				</div>
			
				
				<div class="profileRight" >

					  
				<div class="w3-panel w3-leftbar w3-border-blue">
					 비밀번호 
					 </div>
					 
					 
					<div class="w3-panel w3-border w3-hover-border-blue">
					 	<p><input type="password" name="member_pass" required="required" ></p> 
					 </div>
					 
					 
					 
					<div class="w3-panel w3-leftbar w3-border-blue">
					 상점이름
					</div>
					
					
					<div class="w3-panel w3-border w3-hover-border-blue">
				  <p><input type="text" name="shop_name" value="${myShop.get('shop_name') }"  /></p>
					</div>
					
					
<!-- 					<div class="w3-panel w3-leftbar w3-border-blue"> -->
<!-- 						내 상점 소개 수정 -->
<!-- 					</div> -->
					
<!-- 					<div class="w3-panel w3-border w3-hover-border-blue"> -->
<%-- 					 <textarea id="board_content" name="shop_content" cols="30" rows="5" >${myShop.get('shop_content') }</textarea> --%>
<%-- 					 <p><input type="text" id="board_content" name="shop_content" value="${myShop.get('shop_content') }"></p> --%>
<!-- 					</div> -->
					
					 <div class="form-group">
				     <div class="w3-panel w3-leftbar w3-border-blue">내 상점 소개 수정</div>
				      <textarea class="form-control" id="exampleTextarea" rows="4" >${myShop.get('shop_content') }</textarea>
				    </div>
					
			
						<div class="w3-container">
				  <input type="submit" class="w3-button w3-blue" value="수정">
				  <input type="button" class="w3-button w3-blue" value="취소" onclick="history.back()">
					</div>
				
					 </div>
				
			
					</div>
					</div>
			</div>
		
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td style="width:100px;"> -->
<%-- 						<c:choose> --%>
<%-- 						<c:when test="${myShop.get('shop_img') eq null }"> --%>
<%-- 							<img alt="상점 이미지" id="img" style="width: 200px;" src="<spring:url value='/resources/default_img.png'/>" > --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${myShop.get('shop_img') ne null }"> --%>
<%-- 							<img alt="상점 이미지" id="img" style="width: 200px;" src="<spring:url value='/resources/upload/shopImg/${myShop.get("shop_img") }'/>"> --%>
<%-- 						</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 						<input type="file" id="file" name="upload" onchange="readInputFile(this)" style="display: none;"> -->
<!-- 						<input type="button" id="delFile" value="x" onclick="deleteImg()"><br> -->
<!-- 						<i class="glyphicon glyphicon-remove" style="color: red;" ></i> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="td_left"><label for="member_pass">비밀번호</label></td> -->
<!-- 					<td class="td_right"> -->
<!-- 						<input type="password" name="member_pass" required="required" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="td_left"><label for="shop_name">상점이름</label></td> -->
<!-- 					<td class="td_right"> -->
<%-- 						<input type="text" name="shop_name" value="${myShop.get('shop_name') }"  /> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="td_left"><label for="shop_content">내용</label></td> -->
<!-- 					<td class="td_right"> -->
<%-- 						<textarea id="board_content" name="shop_content" cols="40" rows="15" >${myShop.get('shop_content') }</textarea> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2"> -->
<!-- 						<input type="submit"  value="수정">  -->
<!-- 						<input type="button" value="취소" onclick="history.back()"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
	</form>

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>

</body>
</html>