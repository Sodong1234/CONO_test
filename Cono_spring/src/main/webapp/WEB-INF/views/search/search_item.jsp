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
	border-radius: 10px;
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
	color: #6EB4B5;
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


/*  paging  */

  .paging  {  
  	margin-top: 1400px;  
  	padding-bottom:50px;
   	text-align: center;   
  	margin-left: 10px;
  
  }  


  .paging input:not(.btn){ 
    width: 30px;  
   	height: 30px;   
   	background-repeat:no-repeat; 
   	border-radius:100px;  
   	border-style: none;  
    overflow: hidden;   
    font-size: 13px;
    font-weight: bold;
  } 
  
  .paging input:not(.btn):hover{
  	background-color: #999;
  } 
  
  .paging a:hover{
  	text-decoration: underline;
  }

</style>
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$("input:radio[name='filter1'][value='${filter1}']").attr('checked', true);
		$("input:radio[name='filter2'][value='${filter2}']").attr('checked', true);
	});
	
	
	function filter1(value) {
		var searchText = document.getElementById("searchText").value;
		$("#search_data").html = searchText + "검색 내용입니다.";
		var filter1 = value;
		var filter2 = $("input[name='filter2']:checked").val();
		location.href="search_item?searchText="+ searchText+"&filter1="+filter1+"&filter2="+filter2;
		
	}
	function filter2(value) {
		var searchText = document.getElementById("searchText").value;
		$("#search_data").html = searchText + "검색 내용입니다.";
		var filter1 = $("input[name='filter1']:checked").val();
		var filter2 = value;
		
		location.href="search_item?searchText="+searchText+"&filter1="+filter1+"&filter2="+filter2;
	}
		
	
</script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />
	<div id="wrap">
		<!-- 헤더 -->
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	
	<!-- 메뉴바 -->
	<div id="menubar">
		<jsp:include page="../header_footer/menubar.jsp" />
	</div>


		
	
	<jsp:include page="../search/recentView.jsp" />
	<hr>
	
	<div class="search_option_item">
		<div class="search_cate_title">정렬</div>
		<div class="search_cate_contents">
			<ul class="search_cate_list">
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter1" id="filter1" value="0" checked="checked" onclick="filter1(this.value)"> <span class="item_text">최신순</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter1" id="filter1" value="1" onclick="filter1(this.value)"> <span class="item_text">높은 가격 순</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter1" id="filter1" value="2" onclick="filter1(this.value)"> <span class="item_text">낮은 가격 순</span>
				</label></li>
			</ul>
		</div>
	</div>
	<div class="search_option_item">
		<div class="search_cate_title">가격대</div>
		<div class="search_cate_contents">
			<ul class="search_cate_list">
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter2" id="filter2" value="0" onclick="filter2(this.value)" checked="checked"> <span class="item_text">전체</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter2" id="filter2" value="1" onclick="filter2(this.value)" > <span class="item_text">3만원 이하</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter2" id="filter2" value="2" onclick="filter2(this.value)" > <span class="item_text">3만원~5만원</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter2" id="filter2" value="3" onclick="filter2(this.value)" > <span class="item_text">5만원~10만원</span>
				</label></li>
				<li class="search_cate_item"><label class="item_checkbox"> <input type="radio" name="filter2" id="filter2" value="4" onclick="filter2(this.value)" > <span class="item_text">10만원 이상</span>
				</label></li>
			</ul>
		</div>
	</div>
	
	<h1 id="search_data">'${searchText }' 검색 내용입니다.</h1>
	 <input type = "hidden" name ="pageNum" value="${pageNum }">
	 <c:if test="${not empty cardList && pageInfo.listCount > 0}">	
	<c:forEach var="card" items="${cardList }">
		<div class="products">
			<a href="itemDetail?item_idx=${card.item_idx}"> <img alt=""
				src="<spring:url value='/resources/upload/file/${card.img_name }'/>">
				<p class="name" >${card.item_title }</p>
				<p class="region">${card.item_region }</p>
<%-- 				<p class="price">${card.item_price }원</p> --%>
				<p class="price" style="padding-left: 0px;">
	<fmt:formatNumber value="${card.item_price }" pattern="#,###.##"/>원</p>
				
			</a>
		</div>
	</c:forEach>
	</c:if>
	
	<div class ="paging">
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button"  value=" < " onclick="location.href='search_item?pageNum=${pageNum - 1}&searchText=${searchText }&filter1=${filter1 }&filter2=${filter2 }'">
			</c:when>
			<c:otherwise>

				<input type="button"  value=" < ">&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i }">
				${i }
			</c:when>
				<c:otherwise>
					<a href="search_item?pageNum=${i }&searchText=${searchText }&filter1=${filter1 }&filter2=${filter2 }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button"  value=" > "  onclick="location.href='search_item?pageNum=${pageNum + 1}&searchText=${searchText }&filter1=${filter1 }&filter2=${filter2 }'">
			</c:when>
			<c:otherwise>
				<input type="button"  value=" > " >&nbsp;
			</c:otherwise>
		</c:choose>
		</div>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
crossorigin="anonymous"></script>
</body>
</html>