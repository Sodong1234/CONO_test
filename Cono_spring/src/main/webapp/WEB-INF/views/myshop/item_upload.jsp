<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>myshop/upload_item.jsp</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$(".img").change(function() {
// 			alert($(".img").val().split(".")[1]);
// 			/* 나중에 하자                       이게 뭐더라 */
// 		});
// 	});
	
	$(function() {
		$("#big").on("change", function() {
			let big = $("#big").val();
			$.ajax({
				type:"GET",
				url:"${path}/resources/category.txt",
				dataType: "json"
			})
			.done(function(data) {
				$("#category_area").html("<select name='category_small'></select>");
// 				alert(data[1]["11"]);
// 				alert(Object.keys(data).length);
				for(let i = 1; i < Object.keys(data).length; i++) {
					alert(Object.keys(data)[1].length);
// 					for(let j = 1; j < Object.keys(data)[0]) // dfksjd;flsjf;lksajf;lksjfsdlkfjs;adlfjs;aldfjs;lkfjslk;
					$("#category_area > select").append("<option value=>" +  + "</option>");
				}

// 				$("#category_area > select").append(
						
// 						"<option value=>" + + "</option>" 
// 											      + "");
			})
			.fail(function() {
				$("#category_area").html("요청 실패");
			});
		});
	});
	
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
	            alert(value);
	            document.getElementById("item_region").value = value;
	        }
	    }).open();
	}
// ---------------------------------------------------------------------------------------------------
</script>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	<!------ 상단 바 ------>
	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="ItemOrdMng.shop">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	<!-- ---------------- -->
	
	<!-------- 본문 -------->
	<h3>상품 등록</h3>
	<div>
		<hr>
		<form action="ItemUploadPro.shop" method="post" enctype="multipart/form-data">
			<input type="hidden" name="member_id" value="<%=session.getAttribute("sId")%>">
			<table border="1">
				<tr>
					<th>상품 이미지</th>
					<td>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
						<input type="file" class="img" accept=".gif, .jpg, .png" name="upload"><br>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="item_title" placeholder="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="category_big" id="big">
							<option value="1">패션</option>
							<option value="2">디지털/가전</option>
							<option value="3">스포츠/레저</option>
							<option value="4">가구/인테리어</option>
							<option value="5">생활/가공식품</option>
							<option value="6">도서/티켓</option>
							<option value="7">뷰티/미용</option>
							<option value="8">반려</option>
						</select>
						<div id="category_area">
							<select name="category_small">
								<option></option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td><input type="text" name="item_region" id="item_region" readonly="readonly"><input type="button" value="지역선택" onclick="getAddressInfo()"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="item_price" placeholder="가격을 입력하세요."> 원</td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td><textarea name="item_content" placeholder="상품 소개를 입력하세요. (2000자)"></textarea></td>
				</tr>
				<tr>
					<th>상품 수량</th>
					<td><input type="text" name="item_quantity" id="item_quantity" placeholder="상품 개수를 입력하세요.">개</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록하기"></td>
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