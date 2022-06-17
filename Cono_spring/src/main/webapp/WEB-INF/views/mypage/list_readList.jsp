<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--  common-layout -->
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
    width: calc(100% - 210px);
    padding: 0;
    float: right;
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
					<a href="javascript:void(0);" class="is-active">후기 작성</a>
				</div>
				<div class="tab-btn">
					<a href="/goods/mypage/review/review-history">후기 내역</a>
				</div>
			</div>
		</header>

		<ul class="n-info-txt">
			<li>CONO의 후기는 일반 후기, 상품 사진 후기, 스타일 후기로 구성되며, 각각의 후기 작성 시 기준에 맞는 적립금이 지급됩니다.</li>
			<li>작성 시 관리자 확인 후 적립금이 지급됩니다.</li>
			<li>후기작성은 구매확정일로부터 90일까지 가능합니다.</li>
		</ul>

		<!-- 베스트 후기 선정 기준 확인하기 팝업 버튼 -->

		<!-- //베스트 후기 선정 기준 확인하기 팝업 버튼 -->

		<!-- filter -->
		<form name="f2" method="get" action="/goods/mypage/review/write-review">
			<input type="hidden" name="stateType" value=""> <input type="hidden" name="period" value=""> <input type="hidden"
				name="fromOrderDate" value=""> <input type="hidden" name="toOrderDate" value=""> <input type="hidden" name="page" value="1">

			<div class="n-table-filter">
				<div class="n-radio-tab">
					<input type="radio" id="radioTabGuide0" name="radioTabGuide" onclick="setPeriod(this,'1week');"> <label for="radioTabGuide0">1주일</label>

					<input type="radio" id="radioTabGuide1" name="radioTabGuide" onclick="setPeriod(this,'1month');"> <label for="radioTabGuide1">1개월</label>

					<input type="radio" id="radioTabGuide2" name="radioTabGuide" onclick="setPeriod(this,'3month');"> <label for="radioTabGuide2">3개월</label>

					<input type="radio" id="radioTabGuide3" name="radioTabGuide" onclick="setPeriod(this,'');" checked="checked"> <label for="radioTabGuide3">전체
						시기</label>
				</div>

				<div class="n-datepicker sb">
					<input type="text" class="n-input hasDatepicker" name="fromOrderDateInput" value="" placeholder="-" onblur="checkDateFormat(this);"
						id="dp1655344710846"><img class="ui-datepicker-trigger" src="//image.msscdn.net/skin/musinsa/images/ico_calendar.png?20200528"
						alt="날짜 선택" title="날짜 선택">
				</div>
				<div class="n-datepicker">
					<input type="text" class="n-input hasDatepicker" name="toOrderDateInput" value="" placeholder="-" onblur="checkDateFormat(this);"
						id="dp1655344710847"><img class="ui-datepicker-trigger" src="//image.msscdn.net/skin/musinsa/images/ico_calendar.png?20200528"
						alt="날짜 선택" title="날짜 선택">
				</div>

				<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
			</div>
		</form>
		<form name="f1" method="get" action="/goods/mypage/review/write-review">
			<input type="hidden" name="stateType" value=""> <input type="hidden" name="period" value=""> <input type="hidden"
				name="fromOrderDate" value=""> <input type="hidden" name="toOrderDate" value=""> <input type="hidden" name="page" value="1">
		</form>
		<!-- //filter -->

		<table class="n-table table-col" id="wrapReviewArea">
			<colgroup>
				<col style="width: *">
				<col style="width: 12.8%">
				<col style="width: 12.8%">
				<col style="width: 12.8%">
				<col style="width: 12.8%">
				<col style="width: 12.8%">
			</colgroup>
			<!-- 	<section> -->
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<td>번호</td> -->
<!-- 				<td>상품이미지</td> -->
<!-- 				<td>상품명</td> -->
<!-- 				<td>평점</td> -->
<!-- 				<td>후기 내용</td> -->
<!-- 				<td>작성일</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</section> -->
			
			<thead>
				<tr>
					<th scope="col">상품번호</th>
					<th scope="col">상품정보</th>
					<th scope="col">구매 / 구매확정일</th>
					<th scope="col">상품 사진 후기</th>
					<th scope="col">일반 후기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td>1 <!-- 리뷰번호 -->
				</td> 
					<td>
						<div class="n-prd-row">
							<a href="https://www.musinsa.com/app/goods/1459843/0" class="img-block">
							<img src="//image.msscdn.net/images/goods_img/20200523/1459843/1459843_1_100.jpg" 
							alt="박스 로고 스트라이프 링거 탑 [블루 퍼플]">
							</a>
							<ul class="info">
								<li class="brand"><a href="">러닝하이</a></li>
								<li class="name"><a href="">박스 로고 스트라이프 링거 탑 [블루 퍼플]</a></li>
								<li class="option">FREE</li>
							</ul>
						</div>
					</td>
					<td>2022.06.14<br>구매확정
					</td>
					<!-- 상품 사진 후기 -->
					<td><a class="n-btn w80 btn-sm btn-default" href="writePictureReview">작성하기</a></td>
					<!-- //상품 사진 후기 -->
					<!-- 일반 후기 -->
					<td><a class="n-btn w80 btn-sm btn-default" href="writeBasicReview">작성하기</a></td>
					<!-- //일반 후기 -->


				</tr>
				<tr>
				<td>2 <!-- 상품번호 -->
				</td> 
					<td>
						<div class="n-prd-row">
							<a href="https://www.musinsa.com/app/goods/1801766/0" class="img-block"> <img class="lazyload"
								data-original="//image.msscdn.net/images/goods_img/20210218/1801766/1801766_2_100.jpg" alt="브라운 하운드투스 체크 칼라 셋업 재킷 (351239JQ1D)"
								src="//image.msscdn.net/images/goods_img/20210218/1801766/1801766_2_100.jpg" style="display: block;">
							</a>
							<ul class="info">
								<li class="brand"><a href="">에잇세컨즈</a></li>
								<li class="name"><a href="">브라운 하운드투스 체크 칼라 셋업 재킷 (351239JQ1D)</a></li>
								<li class="option">진한갈색 : M</li>
							</ul>
						</div>
					</td>
					<td class="txt-lighter">2021.08.11<br>구매확정
					</td>
					<!-- 상품 사진 후기 -->
					<td><span class="txt-lighter">작성불가<br>(90일 경과)
					</span></td>
					<!-- //상품 사진 후기 -->

					<!-- 일반 후기 -->
					<td><span class="txt-info">작성완료</span><br> (적립금 지급)</td>
					<!-- //일반 후기 -->


				</tr>
				<tr>
				<td>3 <!-- 상품번호 -->
				</td> 
					<td>
						<div class="n-prd-row">
							<a href="https://www.musinsa.com/app/goods/1274715/0" class="img-block"> <img class="lazyload"
								data-original="//image.msscdn.net/images/goods_img/20200118/1274715/1274715_1_100.jpg" alt="캐주얼글로시백 / 블랙"
								src="//image.msscdn.net/images/goods_img/20200118/1274715/1274715_1_100.jpg" style="display: block;">
							</a>
							<ul class="info">
								<li class="brand"><a href="//www.musinsa.com/brands/neata">니트에이</a></li>
								<li class="name"><a href="https://www.musinsa.com/app/goods/1274715/0">캐주얼글로시백 / 블랙</a></li>
								<li class="option">없음</li>


							</ul>
						</div>
					</td>
					<td class="txt-lighter">2021.07.17<br>구매확정
					</td>
					<!-- 상품 사진 후기 -->
					<td><span class="txt-lighter">작성불가<br>(90일 경과)
					</span></td>
					<!-- //상품 사진 후기 -->

					<!-- 일반 후기 -->
					<td><span class="txt-info">작성완료</span><br> (적립금 지급)</td>
					<!-- //일반 후기 -->
				</tr>
			</tbody>
		</table>
		<!-- //paging -->
		<div class="n-paging">
			<button type="button" class="page is-active">1</button>
			<button type="button" class="page" onclick="click_paging(2);">2</button>
			<button type="button" class="page" onclick="click_paging(3);">3</button>
			<button type="button" class="page" onclick="click_paging(4);">4</button>
			<button type="button" class="page" onclick="click_paging(5);">5</button>
		</div>
	</section>

	<div class="clear" style="position: relative; top: 4500px;">
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>