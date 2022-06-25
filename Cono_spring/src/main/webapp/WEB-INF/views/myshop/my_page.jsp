<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
if (session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO::내상점</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sass/my_page.scss">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-colors-flat.css">
<script src="resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modifyButton.css">

<style type="text/css">

form {
	margin: 0;
	padding: 0;
}

.shopInfo134{
	position: relative;
	display: inline-block;
	    height: 600px;
}
.shopForm134 {
	/*  margin:inherit; */
	/*  margin-right: 0; */
	/* margin-right:-500px; */
	/* position:inherit; */
	/* float:left; */
 	display: inline-table; 
}



.listWarp132 {
	/* text-align: right; */
	width: 304px;
	float: right;
	margin-left: 30px;
	
}

.shopModify {
	margin-left: 265px;
	float: right;
}
</style>
</head>
<body>

	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp" />
	</div>

	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp" />
	</div>


<!-- 	<div  class="cono"> -->



		<div id="storeWrap"><h2 style="font-family: Cafe24Ohsquare;">
			${myShop.get('shop_name') }의 상점 [${myShop.get('member_date') }]</h2>

		<hr class="hr-13">
		  	<div class="shopInfo134">  
 			<div class="shopForm134"> 
		<form action="ProductMyshopModifyForm.shop" name="shopForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="shop_idx" value="${myShop.get('shop_idx') }">
			<!-- 				<div class="form-group" style= font-family:IBMPlexSansKR-Regular;" > -->
				<c:choose>
					<c:when test="${myShop.get('shop_img') eq null }">
						<img alt="상점 이미지" id="img" style="width: 300px;"
							src="<spring:url value='/resources/default_img.png'/>">
					</c:when>
					<c:when test="${myShop.get('shop_img') ne null }">
						<img alt="상점 이미지" id="img" style="width: 300px;"
							src="<spring:url value='/resources/upload/shopImg/${myShop.get("shop_img") }'/>">
					</c:when>
				</c:choose>
				<!-- 						<input type="file" id="file" name="upload" onchange="readInputFile(this)" style="display: none;"> -->
				<br>
				<br>
				<!-- <div class="w3-container"> -->

				<div class="rigthIndi">
					<!-- (2) 판매 횟수 -->

					<div class="storeIndication">
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAQBJREFUSA1jZCASNOz/z3L34Z1aBkaGZLCW/wxzleVVmhscGf8QYwQLMYpAakCW/GdgqGMAElBQBxQDMethAvhoJnySKHIwnyALYhNDlkdiE28RkiZymMRbBIwTDAuwiWEogggQHUegiAfHCSy4oIkBh7kjQJgxdtHtUIZ/jJP+M/yXoIV/GRkYXzAw/c9joqUlIIeDPQD0CPGpjkLvMoG8BfYehQbh0g4LOkZcCkDiMQtuIwocfAqhcksSVHGaR8egI8Kl1FAy6iOyQ5HoQhVkA3qqIiVVjsYR2XE0woIOubBFZsPCD1kMmQ2TR6bxBx20ZAcbAmQjawSzCckjaQAAJL9HBV3GwxoAAAAASUVORK5CYII="
							width="14" height="15" alt="상점방문수 아이콘">판매횟수 ${myShopCountInfo[0]} &nbsp;
<!-- 						<div class="reviewIndicateNum">  -->
						
<!-- 						</div> -->
						<!-- 					</div> -->
						<!-- (3) 상품 갯수  -->

						<!-- 					<div class="storeIndication"> -->
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAl1JREFUSA21Vc9PE1EQnnktW2yIFy9GiCduSki4QjSGwA3qj248q/HCwQtnwg//CxKrMd4WMO2RQrxwkbQmBI0XExMxqQk3TTAt7Q4zu91l231btrq85KWz33wz39v3vn0F6HOYO7nHMvssA+ynwPxgXrebjc9So9LGbeue9StuvYpLFJ592lgHomsynbiP4thC+XLuCQDN8Rb8limxi8VTi7V1Ztm8SVQ/JICriPhUWhNRwRHFzJg1Y/24SO7CN+KGSNAotEVKGzPF1zJZsCSYk2POfwvld+8vsNg0dzq+klXPvYYSCyY54Xh41G/PlbDLRu3T+gEXZ1UKH1rTxffBRuZu7oHdoi3GTtRAZpxd+C2YD8aRW7dCK4pF3jA5y9v0tltEmggmOeEIV2oE143IxJedT4tcMAmARwjGC12xYG4Oj4TbrtFSMV+e/0kEw9psYiDWFBDuJ9YvohEiVWXrPkbkk4QrSim69DcCTFXV0CBUENBOcvndvQYNrKrCVOkPXyhfu5OhZ4SmAlxWqcyIMzlmyzVDvBCAtXd3tmppB0c2BNGtECcAKMKX1mxxLQCtmds5sIFWA1goFCMI6H5HGMMQKeNVqIsOC5Gg4gvxfXV5hmAj+EJj6YlDvkr+hhcTQFqNZ4EnN9RhXSQxgkD+pfpoe36Pn/nKiRhiBj4n8LaLRWykJSBwz1lbhrXN2eINSfkkfqN93sJoIW7oHHyrfn74/IfUa3hGEI5/qWIcQ/Tqqs85RugQggEjeUO0jdAhZN21vvOBHesX9m+oZ4QOIaeVfLiJDfdG8NqdARu11RN7gt5lAAAAAElFTkSuQmCC"
							width="14" height="15" alt="상품판매 아이콘">상품갯수  ${myShopCountInfo[1]}
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
		  <div class="svg-wrapper">
      <svg height="40" width="120" xmlns="http://www.w3.org/2000/svg">
        <rect id="shape" height="40" width="120" />
        <div id="text">
          <a href="#" onclick="location.href='ProductMyshopModifyForm.shop'"><span class="spot"></span>수정하기</a>
        </div>
      </svg>
    </div>
		</div>
<!-- 		</div> -->
		<div class="listWarp132" style="">
			<ul role="list">

				<li data-icon="🦄" style="font-weight: bolder;"> 아이디 </li>
				<li> ${myShop.get('member_id') } </li> 
				<li data-icon="🌈" style="font-weight: bolder;"> 상점 소개  </li>
				<li> ${myShop.get('shop_content') } </li>
				<li data-icon="😎" style="font-weight: bolder;"> 팔로워 ${followerCnt } 명
			 </li>
			</ul>
			
		</div>
	</div>
</div>

	<!-- </div>	 -->

	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp" />
	</div>

</body>
</html>