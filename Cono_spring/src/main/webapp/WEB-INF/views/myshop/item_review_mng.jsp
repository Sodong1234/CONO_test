<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slideShow.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slideShow.js"></script>
<title>myshop/item_review_mng.jsp</title>
<style type="text/css">

img {
	width: 100px;
}

.progress {
	margin: auto;
	height: -1rem;
	
}

.nav nav-tabs {
	
	text-align: center;
	margin: auto;

}

.tab-content{

	text-align: center;
	margin: auto;

}

.table table-hover{

	text-align: center;
	margin: auto;

}

</style>
</head>
<body>
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../header_footer/header.jsp" />
	</div>

	<!-- PageInfo 객체 값 변수에 저장 -->
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />

		<aside class="side">
		<ul class="side-list">
			<li>
			  <a class="nav-link active" aria-current="page" href="ProductMyshop.shop">내 상점</a>
			  <a class="nav-link" href="ItemUploadForm.shop">상품 등록</a>
			  <a class="nav-link" href="ItemMng.shop">상품 관리</a>
			  <a class="nav-link" href="ItemReviewMng.shop">상품 후기 관리</a>
			  <a class="nav-link" href="ItemOrdMng.shop">상품 주문 관리</a>
			  <a class="nav-link" href="follow">팔로우 상점</a>
			  </li>
		</ul>
	</aside>

	<hr>

	<div>
		<h3>상품 후기 관리</h3>


		<div class="storeIndication">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
  			<path
					d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
			</svg>
			
			평균 평점 : <span> ${itemAvg.get('avg') } / 5 </span> <br>

			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
 			 <path
					d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
 			 <path
					d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
			</svg>


			후기 갯수 : <span> ${itemAvg.get('item_idx') } 개</span>
			
		</div>
		
		<br>
		<br>
		<br>



		<div class="progress" style="width: 800px;">
			<div class="progress-bar progress-bar-striped bg-warning"
				role="progressbar" style="width: 500px;" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100">5점</div>
			${itemScore.get('5') } 개<img alt=""
				src="resources/upload/file/${img }">
		</div>
		<br>
		<div class="progress" style="width: 800px;">
			<div class="progress-bar progress-bar-striped bg-warning"
				role="progressbar" style="width: 400px;" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100">4점</div>
			${itemScore.get('4') } 개 <img alt=""
				src="resources/upload/file/${img }">
		</div>
		<br>

		<div class="progress" style="width: 800px;">
			<div class="progress-bar progress-bar-striped bg-warning"
				role="progressbar" style="width: 300px;" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100">3점</div>
			${itemScore.get('3') } 개 <img alt=""
				src="resources/upload/file/${img }">
		</div>
		<br>

		<div class="progress" style="width: 800px;">
			<div class="progress-bar progress-bar-striped bg-warning"
				role="progressbar" style="width: 200px;" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100">2점</div>
			${itemScore.get('2') } 개 <img alt=""
				src="resources/upload/file/${img }">
		</div>
		<br>

		<div class="progress" style="width: 800px;">
			<div class="progress-bar progress-bar-striped bg-warning"
				role="progressbar" style="width: 100px;" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100">1점</div>
			${itemScore.get('1') } 개 <img alt=""
				src="resources/upload/file/${img }">
		</div>
		<br>


		<div></div>
	</div>

	<hr>

	<div>

<!-- 이미지 슬라이더 시작-->

			<div id="slideShow">
		    <ul class="slides">
		      <li><img src="resources/img/flower.jpg" alt=""></li>
		      <li><img src="resources/img/fox.jpg" alt=""></li>
		      <li><img src="resources/img/lightning.jpg" alt=""></li>
		      <li><img src="resources/img/moon.jpg" alt=""></li>
		      <li><img src="resources/img/nature.jpg" alt=""></li>
		      <li><img src="resources/img/space.jpg" alt=""></li>
		    </ul>  
		    <p class="controller">
		      
		      <!-- &lang: 왼쪽 방향 화살표
		      &rang: 오른쪽 방향 화살표 -->
		      <span class="prev">&lang;</span>  
		      <span class="next">&rang;</span>
		    </p>
		  </div>
		  

		<table>
			<!-- 페이징 처리 처럼 옆으로 누르면 넘어가는 방식(한 칸씩 이동..! 부드럽게) -->
			<!-- URL 파라미터로 구분(상품 번호?) -->
			<tr>
				<c:forEach items="${imgNameList }" var="imgName">
					<td
						onclick="location.href='ItemReviewMng.shop?item_idx=${imgName.get('item_idx') }'">
						<c:choose>
							<c:when test="${imgName.get('img_name') ne null }">
								<img alt=""
									src="resources/upload/file/${imgName.get('img_name') }">
							</c:when>
							<c:otherwise>
								<img alt=""
									src="<spring:url value='/resources/default_img.png'/>">
							</c:otherwise>
						</c:choose> <span>${imgName.get('item_idx') }</span>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
		<!-- 이미지 슬라이더 끝 -->
	<hr>

	<!-- 	<div> -->
	<!-- URL 파라미터로 구분(sort) -->
	<ul class="nav nav-tabs">
<!-- 		<li class="nav-item"><a class="nav-link active" -->
<!-- 			data-bs-toggle="tab" href="#home">추천순</a></li> -->
		<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
			href="#profile">최신순</a></li>
		<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
			href="#">평점순</a></li>
	</ul>
	
	
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active show" id="home">
			<p></p>
		</div>
		<div class="tab-pane fade" id="profile">
			<p></p>
		</div>

	</div>



	<h2>후기 내용</h2>

	<table class="table table-hover" style="width: 1064px;">
		<tr class="table-primary">
			<th scope="row">index</th>
			<th>평점</th>
			<th>리뷰내용</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>

			<c:forEach items="${reviewList }" var="review">
				<tr>
					<td>${review.get('review_idx') }</td>
					<td>${review.get('item_score') }</td>
					<td>${review.get('review_content') }</td>
					<td>${review.get('member_id') }</td>
					<td>${review.get('review_date') }</td>
				</tr>
			</c:forEach>

	</table>
	
	<!-- 페이징 처리 -->
	<section class="paging">
		<!-- [이전] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value=" < " onclick="location.href='selectReviewList?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" < " disabled="disabled">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="selectReviewList?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" value=" > " onclick="location.href='selectReviewList?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value=" > " disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>
	
	
	
	
	
	
	
</body>
</html>




<!-- 		<table border="1"> -->

<!-- 				<tr> -->
<%-- 					<td width="100px" rowspan="2">${review.get('review_idx') }</td> --%>
<%-- 					<td width="100px">${review.get('item_score') }</td> --%>
<%-- 					<td width="300px" rowspan="2">${review.get('review_content') }</td> --%>
<%-- 					<td width="100px" rowspan="2">${review.get('review_date') }</td> --%>

<%-- 					<td>${review.get('review_idx') }<br> ${review.get('review_content') }<br> ${review.get('item_score') }<br> --%>
<%-- 						${review.get('member_id') } / ${review.get('review_date') }<br> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td>${review.get('member_id') }</td> --%>
<!-- 				</tr> -->

<!-- 		</table> -->



<!-- 	</div> -->

<!-- 	<div> -->
<!-- 하단 부분 -->
<jsp:include page="../header_footer/footer.jsp" />
</div>
</body>
</html>