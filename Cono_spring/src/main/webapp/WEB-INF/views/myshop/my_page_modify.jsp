<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
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
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	<form action="ProductMyshopModifyPro.shop" name="shopForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="shop_idx" value="${myShop.get('shop_idx') }">
			<table>
				<tr>
					<td style="width:100px;">
						<c:choose>
						<c:when test="${myShop.get('shop_img') eq null }">
							<img alt="상점 이미지" id="img" style="width: 200px;" src="<spring:url value='/resources/default_img.png'/>" >
						</c:when>
						<c:when test="${myShop.get('shop_img') ne null }">
							<img alt="상점 이미지" id="img" style="width: 200px;" src="<spring:url value='/resources/upload/shopImg/${myShop.get("shop_img") }'/>">
						</c:when>
						</c:choose>
						<input type="file" id="file" name="upload" onchange="readInputFile(this)" style="display: none;">
						<input type="button" id="delFile" value="x" onclick="deleteImg()"><br>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="member_pass">비밀번호</label></td>
					<td class="td_right">
						<input type="password" name="member_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_name">상점이름</label></td>
					<td class="td_right">
						<input type="text" name="shop_name" value="${myShop.get('shop_name') }"  />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_content">내용</label></td>
					<td class="td_right">
						<textarea id="board_content" name="shop_content" cols="40" rows="15" >${myShop.get('shop_content') }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정"> 
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
	</form>

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>

</body>
</html>