<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
if (session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
String[] myShopCountInfo = (String[]) request.getAttribute("myShopCountInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sass/my_page.scss">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-colors-flat.css">
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function() {
		
		function initBackGroud(a){
			
			let lis = $('#under_nav_bar').children().children();
			for(var i = 0; i < lis.length; i++){
				if(lis[i] == a){
					$(a).css("background","lightblue")					
				} else {
					$(lis[i]).css("background","none")
				}
			}
		}
		
		$("#product").click(function() {
			
			initBackGroud(this);
			
			$.ajax({
				type: "GET",
				url: "shopProduct",
				dataType: "text",
				data: {
					shop_idx : ${shopInfo.get('shop_idx') }
				} 
			})
			.done(function(data) {
				$("#shop_resultArea").html(data);
			})
			.fail(function() {
				$("#shop_resultArea").html("요청 실패");
			})
		})
	
		$("#review").on("click", function() {
			initBackGroud(this);
			$.ajax({
				type: "GET",
				url: "shopReview",
				dataType: "text",
				data: {
					shop_idx : ${shopInfo.get('shop_idx') }
				}
			})
			.done(function(data) {
				$("#shop_resultArea").html(data);
			})
			.fail(function() {
				$("#shop_resultArea").html("요청 실패");
			})
		})
		
		$("#follower").on("click", function() {
			initBackGroud(this);
			$.ajax({
				type: "GET",
				url: "shopFollower",
				dataType: "text",
				data: {
					shop_idx : ${shopInfo.get('shop_idx') }
				}
			})
			.done(function(data) {
				$("#shop_resultArea").html(data);
			})
			.fail(function() {
				$("#shop_resultArea").html("요청 실패");
			})
		})
		$("#following").on("click", function() {
			initBackGroud(this);
			$.ajax({
				type: "GET",
				url: "shopFollowing",
				dataType: "text",
				data: {
					shop_idx : ${shopInfo.get('shop_idx') }
				}
			})
			.done(function(data) {
				$("#shop_resultArea").html(data);
			})
			.fail(function() {
				$("#shop_resultArea").html("요청 실패");
			})
		});
		
	});
	

	
</script>
<style type="text/css">
#under_nav_bar {
	width: 1040px;
	height: 50px;
	text-align: center;
	margin-bottom: 30px;
	margin-left: 21%;
	margin-right: 505px;
	border-bottom: inset;
	background: #cdf0ea;
	border-radius: 8px;
}

#under_nav_bar li {
	width: 260px;
	list-style-type: none;
	float: left;
	text-align: center;
}

/* 	#under_nav_bar li:hover:before{ */
/* 		  background: black;  */
/* 	} */
#shop_resultArea {
	margin-bottom: 50px;
	width: 100%;
	height: 500px;
}

form {
	margin: 0;
	padding: 0;
}

.shopInfo134 {
	position: relative;
	display: inline-block;
	height: 400px;
}

.shopForm134 {
	/*  margin:inherit; */
	/*  margin-right: 0; */
	/* margin-right:-500px; */
	/* position:inherit; */
	/* float:left; */
	display: inline-table;
	margin-left: 38px;
	margin-top: 20px;
}

.listWarp132 {
	/* text-align: right; */
	width: 304px;
	float: right;
	margin-left: 30px;
	margin-top: 7px
}

.shopModify {
	margin-top: 7px;
	margin-left: 265px;
	float: right;
}

/* #product:before { */
/*   color: black; */
/*   background-color: #a6a6a6; */
/* } */
</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../../header_footer/header.jsp" />
	</div>

	<div class="cono">



		<h2 style="font-family: Cafe24Ohsquare;">
			${shopInfo.get('shop_name') }의 상점 [${shopInfo.get('member_date') }]</h2>

		<hr class="hr-13">
		<hr>
		<div class="shopInfo134">
			<div class="shopForm134">

				<form action="ProductMyshopModifyForm.shop" name="shopForm"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="shop_idx"
						value="${shopInfo.get('shop_idx') }">
					<!-- 				<div class="form-group" style= font-family:IBMPlexSansKR-Regular;" > -->
					<c:choose>
						<c:when test="${shopInfo.get('shop_img') eq null }">
							<img alt="상점 이미지" id="img" style="width: 300px;"
								src="<spring:url value='/resources/default_img.png'/>">
						</c:when>
						<c:when test="${shopInfo.get('shop_img') ne null }">
							<img alt="상점 이미지" id="img" style="width: 300px;"
								src="<spring:url value='/resources/upload/shopImg/${shopInfo.get("shop_img") }'/>">
						</c:when>
					</c:choose>
					<!-- 						<input type="file" id="file" name="upload" onchange="readInputFile(this)" style="display: none;"> -->
					<br>


					<!-- <div class="w3-container"> -->

					<div class="rigthIndi">

						<div class="storeIndication">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAQBJREFUSA1jZCASNOz/z3L34Z1aBkaGZLCW/wxzleVVmhscGf8QYwQLMYpAakCW/GdgqGMAElBQBxQDMethAvhoJnySKHIwnyALYhNDlkdiE28RkiZymMRbBIwTDAuwiWEogggQHUegiAfHCSy4oIkBh7kjQJgxdtHtUIZ/jJP+M/yXoIV/GRkYXzAw/c9joqUlIIeDPQD0CPGpjkLvMoG8BfYehQbh0g4LOkZcCkDiMQtuIwocfAqhcksSVHGaR8egI8Kl1FAy6iOyQ5HoQhVkA3qqIiVVjsYR2XE0woIOubBFZsPCD1kMmQ2TR6bxBx20ZAcbAmQjawSzCckjaQAAJL9HBV3GwxoAAAAASUVORK5CYII="
								width="14" height="15" alt="상점방문수 아이콘"> 판매횟수
							${shopCountInfo[0]} &nbsp;
							<!-- 						<div class="reviewIndicateNum">  -->

							<!-- 						</div> -->
							<!-- 					</div> -->
							<!-- (3) 상품 갯수  -->

							<!-- 					<div class="storeIndication"> -->
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAl1JREFUSA21Vc9PE1EQnnktW2yIFy9GiCduSki4QjSGwA3qj248q/HCwQtnwg//CxKrMd4WMO2RQrxwkbQmBI0XExMxqQk3TTAt7Q4zu91l231btrq85KWz33wz39v3vn0F6HOYO7nHMvssA+ynwPxgXrebjc9So9LGbeue9StuvYpLFJ592lgHomsynbiP4thC+XLuCQDN8Rb8limxi8VTi7V1Ztm8SVQ/JICriPhUWhNRwRHFzJg1Y/24SO7CN+KGSNAotEVKGzPF1zJZsCSYk2POfwvld+8vsNg0dzq+klXPvYYSCyY54Xh41G/PlbDLRu3T+gEXZ1UKH1rTxffBRuZu7oHdoi3GTtRAZpxd+C2YD8aRW7dCK4pF3jA5y9v0tltEmggmOeEIV2oE143IxJedT4tcMAmARwjGC12xYG4Oj4TbrtFSMV+e/0kEw9psYiDWFBDuJ9YvohEiVWXrPkbkk4QrSim69DcCTFXV0CBUENBOcvndvQYNrKrCVOkPXyhfu5OhZ4SmAlxWqcyIMzlmyzVDvBCAtXd3tmppB0c2BNGtECcAKMKX1mxxLQCtmds5sIFWA1goFCMI6H5HGMMQKeNVqIsOC5Gg4gvxfXV5hmAj+EJj6YlDvkr+hhcTQFqNZ4EnN9RhXSQxgkD+pfpoe36Pn/nKiRhiBj4n8LaLRWykJSBwz1lbhrXN2eINSfkkfqN93sJoIW7oHHyrfn74/IfUa3hGEI5/qWIcQ/Tqqs85RugQggEjeUO0jdAhZN21vvOBHesX9m+oZ4QOIaeVfLiJDfdG8NqdARu11RN7gt5lAAAAAElFTkSuQmCC"
								width="14" height="15" alt="상품판매 아이콘"> 상품갯수
							${shopCountInfo[1]}
							<!-- 						<div class="sellIndicateNum"></div> -->
							<!-- 					</div> -->

							<!-- 						<div class="storeStar"> -->
							<img width="20" height="23" class="star1" alt="별 "
								src="resources/img/star.png">별점 ${itemAvg.get('avg') } / 5
							<!-- 						<div class="starIndicateNum"> </div> -->
						</div>
					</div>
				</form>
			</div>


			<div class="shopModify">
			<!-- 팔로우 버튼 연결하기  -->
			<c:choose>
	<c:when test="${follow eq null }">
			<input type ="button" value ="follow 하기" onclick="location.href='plusFollow?shop_idx=${shopInfo.get('shop_idx') }'">
			</c:when>
			
			<c:when test="${follow ne null }">
		<input type ="button" value ="follow 하기" onclick="location.href='deleteFollowing?shop_idx=${shopInfo.get('shop_idx') }'">
			</c:when>
</c:choose>
			
			
			
			
			
			
			</div>
				<div class="listWarp132" style="">
					<ul role="list">

						<li data-icon="🦄">판매자 ID :${shopInfo.get('member_id') }</li>
						<li data-icon="🌈">상점소개 : ${shopInfo.get('shop_content') }</li>
						<li data-icon="😎">팔로워 : ${followerCnt } 명</li>
						<%-- 				  <li data-icon="🦄"> 상점 오픈일 : ${myShop.get('member_date') }</li> --%>
					</ul>

				</div>
			

		</div>
		<!-- middleWrap -->
	</div>

	<!-- 			</div> -->
	<!-- 		</div>//storeTop -->
	<div id="under_nav_bar">
		<ul>
			<li id="product">상품</li>
			<li id="review">후기</li>
			<li id="follower">팔로워</li>
			<li id="following">팔로잉</li>
		</ul>
		<div id="shop_resultArea"></div>
	</div>
	<!-- 	</div> -->

	<div>
		<!-- 하단 부분 -->
		<footer style="position: relative; top: 800px;"
			<jsp:include page="../../header_footer/footer.jsp"/>></footer>
	</div>
</body>
</html>