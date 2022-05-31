<%@page import="vo.ImgDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] itemDetail = (String[])request.getAttribute("itemDetail");

ArrayList<ImgDTO> preImgList = (ArrayList<ImgDTO>)request.getAttribute("imgList");
String preImgName = "";
for(ImgDTO preImg : preImgList) {
	preImgName += preImg.getImg_name() + "/";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	<c:forEach var="i" begin="1" end="${imgList.size() }">
		$(function() {
			$('#target_img${i}').click(function (e) {
			    e.preventDefault();
			    $('#file${i}').click();
			});
		});
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
</script>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<h3>상품 정보 수정</h3>
	<div>
		<hr>
		<form name="fr" action="ItemModifyPro.shop" method="post" enctype="multipart/form-data">
			<input type="hidden" name="item_idx" value="${itemDetail[0] }">
			<input type="hidden" name="preImgName" value="<%=preImgName%>">
			
			<table border="1">
				<tr>
					<th>상품 이미지</th>
					<td>
						<c:set var="i" value="1"/>
						<c:forEach items="${imgList }" var="item">
							<img id="target_img${i }" src="upload/${item.getImg_real_name() }">
							<input type="file" id="file${i }" accept=".gif, .jpg, .png" name="item_img${i }" onchange="readInputFile${i }(this)" ><br>
							<c:set var="i" value="${i+1 }"/>
						</c:forEach>
						
						<c:forEach begin="${imgList.size() }" end="5" var="i">
							<input type="file" class="img" accept=".gif, .jpg, .png" name="item_img${i+1 }"><br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="item_title" value="${itemDetail[1] }"></td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td><textarea name="item_content">${itemDetail[2] }</textarea></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="item_price" value="${itemDetail[3] }"> 원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="item_quantity" value="${itemDetail[12] }"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
					<!-- 원래 선택된 카테고리 selected -->
						<select name="category_big">
							<option <%if(itemDetail[8].equals("1")) {%> selected="selected"<%} %>>1</option>
							<option <%if(itemDetail[8].equals("2")) {%> selected="selected"<%} %>>2</option>
							<option <%if(itemDetail[8].equals("3")) {%> selected="selected"<%} %>>3</option>
						</select>
						<select name="category_small">
							<option <%if(itemDetail[9].equals("1")) {%> selected="selected"<%} %>>1</option>
							<option <%if(itemDetail[9].equals("2")) {%> selected="selected"<%} %>>2</option>
							<option <%if(itemDetail[9].equals("3")) {%> selected="selected"<%} %>>3</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td><!-- 우편번호 API 사용 -->우편 번호 API 사용 (원래 주소 출력)</td>
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
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>