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
<link rel="stylesheet" type="text/css" href="//static.danawa.com/css/shop.navigation.css?v=20210714">
<link rel="stylesheet" type="text/css" href="//static.danawa.com/css/market_share.css?v=20210714">
<link rel="stylesheet" type="text/css" href="/mobile/www/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="//static.danawa.com/css/shop.virtualestimate.css" />
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

.search_option_item {
    position: relative;
    padding: 0 17px;
    
}

.search_cate_title {
    float: left;
    width: 112px;
    height: 27px;
    line-height: 27px;
    font-weight: bold;
}

.search_cate_contents {
    float: left;
}

.search_cate_list {
    width: 640px;
    height: 27px;
    overflow: hidden;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

#container_main li {
    list-style: none;
    text-align: left;
}
</style>
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
		function chk(value) {
			var filter1 = value;
			var filter2 = $("input[name='chkP']:checked").val();
			alert(filter1 + "---" + filter2);
			$.ajax({
				type: "GET",
				url: "search_filter",
				data: {
					filter1 : filter1,
					filter2 : filter2
					  },
			});
			
		}
		function chk2(value) {
			var filter1 = $("input[name='chk']:checked").val();
			var filter2 = value;
			alert(filter1 + "---" + filter2);
			$.ajax({
				type: "GET",
				url: "search_filter",
				data: {
					filter1 : filter1,
					filter2 : filter2
					  },
			});
		}
	
</script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	<!-- 	<div class="navbar"></div> -->
	<jsp:include page="../search/recentView.jsp" />
	<hr>
	<div class="search_option_item">
		<div class="search_cate_title">정렬</div>
		<div class="search_cate_contents">
			<ul class="search_cate_list">
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chk" id="filter1" value="5" checked="checked" onclick="chk(this.value)"> <span class="item_text">최신순</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chk" id="filter1" value="6" onclick="chk(this.value)"> <span class="item_text">높은 가격 순</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chk" id="filter1" value="7" onclick="chk(this.value)"> <span class="item_text">낮은 가격 순</span>
				</label></li>
			</ul>
		</div>
	</div>
	<div class="search_option_item">
		<div class="search_cate_title">가격대</div>
		<div class="search_cate_contents">
			<ul class="search_cate_list">
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chkP" id="filter2" value="0" onclick="chk2(this.value)" checked="checked"> <span class="item_text">전체</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chkP" id="filter2" value="1" onclick="chk2(this.value)" > <span class="item_text">3만원 이하</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chkP" id="filter2" value="2" onclick="chk2(this.value)" > <span class="item_text">3만원~5만원</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chkP" id="filter2" value="3" onclick="chk2(this.value)" > <span class="item_text">5만원~10만원</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="chkP" id="filter2" value="4" onclick="chk2(this.value)" > <span class="item_text">10만원 이상</span>
				</label></li>
			</ul>
		</div>
	</div>
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