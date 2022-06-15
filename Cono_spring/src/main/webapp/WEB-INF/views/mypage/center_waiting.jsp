<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<script type="text/javascript">
	
</script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	<hr>
	<div class="search_filter">
		<form id="filter_form" action="/search_item" method="get" >
			<input type="hidden" name="keyword">
			<input type="hidden" name="cateCode">
			<input type="hidden" name="type">
		</form>			
	</div>
	<c:forEach var="card" items="${waitingList }">
		<div class="products">
			<a href="itemDetail?item_idx=${card.item_idx}"> <img alt=""
				src="<spring:url value='/resources/upload/file/${card.img_name }'/>">
				<p class="name">${card.item_title }</p>
				<p class="region">${card.item_region }</p>
				<p class="price">${card.item_price }원</p>
			</a>
			<button value="${card.item_idx}">취소하기${card.item_idx}</button>
		</div>
	</c:forEach>

	<div>
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
crossorigin="anonymous"></script>
</body>
</html>