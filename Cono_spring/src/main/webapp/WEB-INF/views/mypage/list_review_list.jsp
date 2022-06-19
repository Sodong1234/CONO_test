<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--  common-layout -->
 <script src="${path}/resources/js/jquery-3.6.0.js"></script>
  <script type="text/javascript" src="//image.msscdn.net/static/common/1.2.0/chunk-vendors.js"></script>
  <link type="text/css" rel="stylesheet" href="//image.msscdn.net/static/common/1.2.0/pc.css"/>
  <link rel="stylesheet" type="text/css" href="https://static.msscdn.net/ui/build/pc/css/common.css">

  <!--
    magazine_common.css 먼저 선언 후에 layout.min.css 선언 필요
    - .footer .snb_store 와 .footer .snb 선택자가 layout.min.css 의 스타일이 적용되야 문제없이 footer 출력.
  -->
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/guide.min.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/layout.min.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/media_query.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/new.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/style.min.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/store_common.css?202206141054"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/sub.css?202206141054"/>

  <link rel="stylesheet" href="//image.msscdn.net/ui/musinsa/resources/common/css/icon.min.css?202101051200"/>

  <!-- lib -->
  <script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery.easing.js?202206141054"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.lazyload.min.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/m_js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/clipboard.min.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.bxslider.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.cycle.all.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jslib.js"></script>

  <!-- Swiper -->
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/swiper/swiper.min.css?20200316"/>
  <script type="text/javascript" src="//static.msscdn.net/swiper/swiper.min.js?20200316"></script>

  <!--jqModal-->
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/jqModal.css"/>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jqModal.min.js"></script>
  <!--//jqModal-->

  <!-- 스토어, 매거진 공통 스크립트 -->
  <script type="text/javascript" href="//static.msscdn.net/mfile_outsrc/js/common/base.js?202206141054"></script>
  <script type="text/javascript" href="//static.msscdn.net/mfile_outsrc/js/common/common.js?202206141054"></script>

<!--  <script type="text/javascript" th:src="|//static.msscdn.net/skin/musinsa/js/common.js?${staticResourceVersion}|"></script>-->
<!--  <script type="text/javascript" th:src="|//static.msscdn.net/skin/musinsa/js/mini_cart.js?${staticResourceVersion}|"></script>-->
<!--  <script type="text/javascript" th:src="|//static.msscdn.net/skin/musinsa/js/suggestions.js?${staticResourceVersion}|"></script>-->
<!--  <script type="text/javascript" th:src="|//static.msscdn.net/skin/musinsa/js/search_form.js?${staticResourceVersion}|"></script>-->
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/ui.js?202206141054"></script>
  <!--// 스토어, 매거진 공통 스크립트 -->

  <!-- 유사 이미지 상품 검색 -->
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/image_search.css?202206141054"/>
  <script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/image_search.js?202206141054"></script>
<style type="text/css">

html, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, form, dl, dt, dd, ol, ul, li, input, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: top;
    background: transparent;
}
.mypage-cont {
/*     width: calc(100% - 210px); */
	width: 1200px;
	margin: 0 350px;
    padding: 0;
}

.n-section-title {
    border-bottom: 3px solid #000000;
    padding-bottom: 14px;
    margin-top: 48px;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
}

.n-section-title .tit {
    display: inline-block;
    font-size: 24px;
    font-family: "Musinsa", sans-serif !important;
}

.n-section-title .tab-group {
    padding: 10px 0 6px 0;
    margin-left: -4px;
}

.n-section-title .tab-group .tab-btn {
    font-family: "Musinsa", sans-serif !important;
    font-size: 18px;
    color: #ccc;
    float: left;
}

.n-info-txt {
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    padding-top: 20px;
}

.n-info-txt > li:first-of-type {
    margin-top: 0;
}

.n-table-filter {
    margin: 50px 0 16px 0;
}

.n-table-filter .n-radio-tab, .n-table-filter .n-datepicker, .n-table-filter .n-select {
    display: block;
    float: left;
    margin-right: 20px;
}

.n-table-filter .n-datepicker.sb {
    margin-right: 10px;
}
.n-table-filter .n-datepicker {
    width: 120px;
}

.n-table.table-col {
    border-top: 1px solid #000000;
}

.n-table {
    width: 100%;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    border-collapse: collapse;
    table-layout: fixed;
}

colgroup {
    display: table-column-group;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
    text-align: center;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

.n-table {
    width: 100%;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
    line-height: 1.5;
    font-size: 14px;
    border-collapse: collapse;
    table-layout: fixed;
}

div {
    display: block;
}

</style>
<script type="text/javascript">
	function writeReview() {
		window.open("", "리뷰 작성", "width=600px,height=720px,top=180px,left=500px");
	}
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	<section class="mypage-cont">
		<header class="n-section-title">
			<h1 class="tit">구매후기</h1>
			<div class="tab-group">
				<div class="tab-btn">
					<a href="readOrdList">후기 작성</a>
				</div>
				<div class="tab-btn">
					<a href="javascript:void(0);" class="is-active">후기 내역</a>
				</div>
			</div>
		</header>

		<ul class="n-info-txt">
			<li>CONO의 후기는 일반 후기, 상품 사진 후기, 스타일 후기로 구성되며, 각각의 후기 작성 시 기준에 맞는 적립금이 지급됩니다.</li>
			<li>작성 시 관리자 확인 후 적립금이 지급됩니다.</li>
			<li>후기작성은 구매확정일로부터 90일까지 가능합니다.</li>
		</ul>
		<form name="f1" method="get" action="/goods/mypage/review/write-review">
			<input type="hidden" name="stateType" value=""> <input type="hidden" name="period" value=""> <input type="hidden"
				name="fromOrderDate" value=""> <input type="hidden" name="toOrderDate" value=""> <input type="hidden" name="page" value="1">
		</form>
		<!-- //filter -->

		<table class="n-table table-col" id="wrapReviewArea">
			<thead>
				<tr>
<!-- 					<th scope="col">상품번호</th> -->
					<th scope="col">상품정보</th>
					<th scope="col">구매일</th>
					<th scope="col">후기 내용/평점</th>
					<th scope="col">후기 작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reviewList }" var="review">
					<tr>
						<td>
							<div class="n-prd-row">
								<ul class="info">
									<li class="brand"><a href="">${review.item_title }</a></li>
									<li class="option">${review.ord_quantity } 개 / ${review.shop_name }</li>
								</ul>
							</div>
						</td>
						<td>
							${review.ord_date }
						</td>
						<td>
							<ul class="info">
								<li class="brand">${review.review_content }</li>
								<li class="brand">${review.review_score }</li>
							</ul>
						</td>
						<td>
							${review.review_date }
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
<!-- 	<div class ="paging"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageInfo.pageNum > 1 }"> --%>
<%-- 				<input type="button" value=" < " onclick="location.href='readReviewList?pageNum=${pageInfo.pageNum - 1 }'"> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<input type="button" value=" < "> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>

<%-- 		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
<%-- 			<c:choose> --%>
<%-- 			<c:when test="${pageInfo.pageNum eq i }"> --%>
<%-- 				${i } --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<a href="readReviewList?pageNum=${i }">${i }</a> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${pageInfo.pageNum < pageInfo.maxPage }"> --%>
<%-- 				<input type="button" value=" > " onclick="location.href='IreadReviewList?pageNum=${pageInfo.pageNum + 1 }'"> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<input type="button" value=" > "> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</div> -->
	</section>

	<div class="clear" style="position: relative; top: 4500px;">
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>