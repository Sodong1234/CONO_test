<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	margin: 0;
	min-width: 992px;
	min-height: 100%;
	font-family: Helvetica;
}

.navbar {
	height: 60px;
	padding-left: 30px;
}

.logo {
	line-height: 60px;
	float: left;
}

.logo img {
	vertical-align: middle;
}

.navbar ul {
	float: right;
}

.navbar li {
	list-style-type: none;
	float: left;
	margin-right: 30px;
}

.navbar a {
	text-decoration: none;
	color: black;
	font-style: bold;
	font-size: 13px;
}

.hero_header {
	height: 450px;
	width: 100%;
}

body h1 {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 60px;
	font-size: 24px;
	font-style: bold;
	color: #545454;
}

.products {
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	width: 992px;
	text-align: center;
}

.products img {
	width: 225px;
	height: 225px;
	margin-right: 20px;
	margin-bottom: 20px;
}

.products a {
	text-decoration: none;
	color: black;
	float: left;
	font-size: 16px;
}



.clearfix {
	clear: both;
}

.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
	text-align: center;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin: 1px;
}

.region {
	color: gray;
	font-size: 10pt;
}

.name {
	font-weight: bold;
	font-size: 14pt;
}

.price {
	margin-top: 4px;
	margin-bottom: 80px;
	color: #5CFFD1;
	font-size: 13pt;
}

/* 필터정보 */
.search_filter {
    width: 85%;
    margin: auto;
	margin-top: 30px;
    margin-bottom: 50px;    
} 
.filter_button_wrap {
    width: 100%;
}

.filter_button_wrap button {
    width: 50%;
}

.filter_button{
	background-color: #04AA6D;
	border: 1px solid green;
	color: white;
	padding: 10px 24px;
	cursor: pointer;
	float: left;
} 
.filter_button_wrap:after {
    content: "";
    clear: both;
    display: table;
}  	
.filter_button_wrap button:not(:last-child) {
    border-right: none;
}

.filter_button:hover {
    background-color: #3e8e41;
}

.filter_active{
	background-color: #045d3c;
}

.filter_content{
	padding:20px 50px 20px 50px;
	border: 1px solid gray;
}

.filter_content a:not(:first-child){
	margin-left: 10px;
}

.filter_a{
	display: block;
}

.filter_b{
	display: none;
}
</style>
<script type="text/javascript">
// 무한스크롤 시도
// 	// 1. 스크롤 이벤트 최초 발생
// 	var lastScrollTop = 0;
// 	$(window).scroll(function(){
// 		var currentScrollTop = $(window).scrollTop();
		
// 		// 2. 현재 스크롤의 위치가 화면의 보이는 위치보다 크면
// 		if($(window.scrollTop() >= $(document).height() - $(window).height()){
// 			// 3. ajax 로 서버에 게시물 데이터 요청
// 			// 3. class 가 스크롤 마지막인 요소를 선택한 다음 그것의 속성 값을 받아온다.
// 			var lastitem_idx = $(".scrolling:last").attr("data-item_idx");
// 			$.ajax({
// 				type:'post',
// 				url:'/infiniteScrollDown',
// 				dataType : 'json',
// 				data : JSON.stringify({
// 					item_idx : lastitem_idx
// 				}),
// 				success : function(data) {
// 					var str = "";
// 					if(data != "") {
// 						$(data).each(
// 						function() {
// 							console.log(this);
// 							str += "<tr class =" + "'listToChange'" + ">"
// 								+		"<td class= " + "'scrolling'" + " data-idx='" + this.item_idx + "'>"
// 								+ 			this.item_idx
// 								+		"</td>"
// 								+		"<td>" + this.img_real_name + "</td>"
// 								+		"<td>" + this.item_title + "</td>"
// 								+		"<td>" + this.item_region + "</td>"
// 								+		"<td>" + this.item_price + "</td>"
// 								+		"<td>" + this.item_date + "</td>"
// 								+  "</tr>"
// 						});
// 						$(".listToChange").empty();
// 						$(".scrollLocation").after(str);
// 					}
// 					else {
// 						alert("불러올 데이터가 없습니다.");
// 					}
// 				}
				
// 			});		
			
// 		})
// 	});

// 종찬이형 디자인에 쓸거
<!-- 			<a href="">  -->
<%-- 			<img src="${card.img_real_name }"> --%>
<%-- 				<input hidden="${card.item_idx }"> --%>
<%-- 				<input hidden="${card.item_date }"> --%>
<%-- 				<p class="name">${card.item_title }</p> --%>
<%-- 				<p class="region">${card.item_region }</p> --%>
<%-- 				<p class="price">${card.item_price }</p> --%>
<!-- 			</a> -->
</script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<%-- 	<c:forEach var="card" items="${cardList }"> --%>
<!-- 		<div> -->
<%-- 			<table border="1" onclick="location.href='itemDetail?item_idx=${card.item_idx}'"> --%>
<!-- 				<tr> -->
<%-- 					<td class="scrolling" data-item_idx="${card.item_idx }">${card.item_idx }</td> --%>
<%-- 					<td>${card.img_real_name }</td> --%>
<%-- 					<td>${card.item_title }</td> --%>
<%-- 					<td>${card.item_region }</td> --%>
<%-- 					<td>${card.item_price }</td>	 --%>
<%-- 					<td>${card.item_date }</td>		 --%>
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
	<!-- 가격대(만원이하/만원삼만원/삼만원오만원/이상), 지역(지역검색 버튼1개), 
	카테고리(대분류 소분류) -->
	<div id="wrap">
		<!-- 헤더 -->
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	<!-- 	<div class="navbar"></div> -->
	<jsp:include page="../search/recentView.jsp" />
	<hr>
	<!-- 필터 추가 -->
	<h1>'${searchText }' 검색 내용입니다.</h1>
	<c:forEach var="card" items="${cardList }">
		<div class="products">
			<a href="itemDetail?item_idx=${card.item_idx}"> <img alt=""
				src="<spring:url value='/resources/upload/file/${card.img_name }'/>">
				<p class="name">${card.item_title }</p>
				<p class="region">${card.item_region }</p>
<%-- 				<p class="price">${card.item_price }원</p> --%>
				<p class="price"><fmt:formatNumber value="${card.item_price }" pattern="#,###.##"/>원</p>
				
			</a>
		</div>
	</c:forEach>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
crossorigin="anonymous"></script>
</body>
</html>