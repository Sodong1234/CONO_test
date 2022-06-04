<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// String[] itemDetail = (String[])request.getAttribute("itemDetail");

// ArrayList<ImgDTO> preImgList = (ArrayList<ImgDTO>)request.getAttribute("imgList");
// String preImgName = "";
// for(ImgDTO preImg : preImgList) {
// 	preImgName += preImg.getImg_name() + "/";
// }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
	img {
		width: 200px;
	}
</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>

	<h3>상품 정보 수정</h3>
	<div>
		<hr>
		<form name="fr" action="ItemModifyPro.shop" method="post" enctype="multipart/form-data" onsubmit="return imgStatusCheck()">
			<input type="hidden" name="item_idx" value="${itemDetail.get('item_idx')}">
<%-- 			<input type="hidden" name="preImgName" value="<%=preImgName%>"> --%>
			<input type="hidden" name="imgStatus" value="">
			
			<table border="1">
				<tr>
					<th>상품 이미지</th>
					<td>
						<c:forEach var="i" begin="1" end="6">
							<c:choose>
								<c:when test="${imgList.get(i-1).getImg_name() ne null}">
									<img id="target_img${i }" src="resources/upload/file/${imgList.get(i-1).getImg_name() }">
									<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" >
									<input type="button" id="delFile${i }" onclick="deleteImg${i}()"><br>
								</c:when>
								<c:when test="${imgList.get(i-1).getImg_name() eq null}">
									<img id="target_img${i }" src="resources/upload/default_img.png">
									<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="upload" onchange="readInputFile${i }(this)" >
									<input type="button" id="delFile${i }" onclick="deleteImg${i}()"><br>
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="item_title" value="${itemDetail.get('item_title')}"></td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td><textarea name="item_content">${itemDetail.get('item_content')}</textarea></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="item_price" value="${itemDetail.get('item_price')}"> 원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="item_quantity" value="${itemDetail.get('item_quantity')}"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
					<!-- 원래 선택된 카테고리 selected -->
						<select name="category_big">
							<option <c:if test="${itemDetail.get('category_big') eq '1' }">selected="selected"</c:if>>1</option>
							<option <c:if test="${itemDetail.get('category_big') eq '2' }">selected="selected"</c:if>>2</option>
							<option <c:if test="${itemDetail.get('category_big') eq '3' }">selected="selected"</c:if>>3</option>
						</select>
						<select name="category_small">
							<option <c:if test="${itemDetail.get('category_small') eq '1' }">selected="selected"</c:if>>1</option>
							<option <c:if test="${itemDetail.get('category_small') eq '2' }">selected="selected"</c:if>>2</option>
							<option <c:if test="${itemDetail.get('category_small') eq '3' }">selected="selected"</c:if>>3</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td><!-- 우편번호 API 사용 -->${itemDetail.get('item_region')} 우편 번호 API 사용 (원래 주소 출력)</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
		<!---------------------->
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>