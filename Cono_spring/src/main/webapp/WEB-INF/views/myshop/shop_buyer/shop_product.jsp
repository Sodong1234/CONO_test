<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::판매자의상점</title>
<style>
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

/*  .footer {  */
/*  	position: absolute;  */
/*  	left: 0;  */
/*  	bottom: 0; */
/*  	width: 100%;  */
/*  	padding: 15px 0;  */
/*  	text-align: center;  */

/* }  */

.product p {
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
</head>
<body>
	<div id="wrap">
		<c:forEach var="item" items="${itemList }">
			<div class="products">
				<a href="itemDetail?item_idx=${item.item_idx}"> 
				    <img alt="" src="<spring:url value='/resources/upload/file/${item.img_name }'/>">
					<p class="name">${item.item_title }</p>
					<p class="region">${item.item_region }</p>
<%-- 					<p class="price">${item.item_price }c</p> --%>
					<p class="price"><fmt:formatNumber value="${item.item_price }" pattern="#,###.##"/>c</p>
				</a>
			</div>
		</c:forEach>
	</div>
	
</body>
</html>