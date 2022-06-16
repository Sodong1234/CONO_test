<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/guide.min.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/layout.min.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/media_query.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/new.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/style.min.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/store_common.css?202206161419"/>
  <link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/sub.css?202206161419"/>

  <link rel="stylesheet" href="//image.msscdn.net/ui/musinsa/resources/common/css/icon.min.css?202101051200"/>

  <!-- lib -->
  <script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery.easing.js?202206161419"></script>
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
  <script type="text/javascript" href="//static.msscdn.net/mfile_outsrc/js/common/base.js?202206161419"></script>
  <script type="text/javascript" href="//static.msscdn.net/mfile_outsrc/js/common/common.js?202206161419"></script>
</head>
<body>
<section class="mypage-cont">
            <form id="reviewForm" name="reviewForm" method="post" target="hf">
                <input type="hidden" name="tmpcode" value="1655368349687">
<!--                <input type="hidden" name="goods_est" value=""> // TODO 사용여부 확인 후 삭제-->
                <input type="hidden" name="opt_kind_cd" id="optKindCode" value="CLOTHES">


                
    <header class="n-section-title">
        <h1 class="tit">일반 후기작성</h1>
    </header>

    <ul class="n-info-txt">
        <li>작성하신 후기는 다른 회원들에게 공개됩니다. 댓글은 무신사에서 확인하지 않습니다.</li>
        <li>일반 후기 작성 시 500원의 적립금을 평일 기준 2일 전후로 지급됩니다.</li>
        <li>후기 내용은 20자 이상 작성합니다. 상품과 관련 없는 내용, 단순 문자 및 기호의 나열/반복 확인 시 적립금 회수 및 지급 혜택이 제한됩니다.</li>
        <li>
            아래에 해당할 경우 적립금 지급이 보류되며, 이미 지급받으셨더라도 2차 검수를 통해 적립금을 회수할 수 있습니다. 또한 일부 후기는 조건에 따라 비노출 처리됩니다.
            <br>- 상품과 관련없거나 문자 및 기호의 단순 나열, 반복된 내용의 후기
            <br>- 개인정보 및 광고, 비속어가 포함된 내용의 후기 (비노출 대상)
        </li>
        <li>특히 후기 도용 시 적립금 2배 회수, 1년간 커뮤니티 이용 제한, 3개월간 후기 적립금 지급이 중단됩니다.</li>
        
            <li>신체정보(성별, 키, 몸무게)는 수집ㆍ이용 동의 시 후기 서비스 제공 목적으로만 이용되며, 무신사 개인정보 처리방침에 따라 처리됩니다.</li>
        
    </ul>


                <div class="my-review-write" id="reviewWrap">
                    <!-- 상품 -->
                    <div class="n-prd-row">
                        <a href="/app/goods/1459843" class="img-block">
                            <img src="//image.msscdn.net/images/goods_img/20200523/1459843/1459843_1_100.jpg" alt="박스 로고 스트라이프 링거 탑 [블루 퍼플]">
                        </a>
                        <ul class="info">
                            <li class="brand"><a href="null/brands/runninghigh">러닝하이</a></li>
                            <li class="name"><a href="/app/goods/1459843">박스 로고 스트라이프 링거 탑 [블루 퍼플]</a></li>
                            <li class="option">FREE</li>
                            
                        </ul>
                    </div>
                    <!-- //상품 -->

                    <!-- 별점 -->
                    <div class="review-score" id="reviewScorePos">
                        <em class="label">별점을 매겨주세요</em>
                        <div class="n-score score-lg clickable goods_est_area" id="startScoreWrap">
                            <a href="#" class="score score10" data-star="5"></a>
                            <a href="#" class="score score8" data-star="4"></a>
                            <a href="#" class="score score6" data-star="3"></a>
                            <a href="#" class="score score4" data-star="2"></a>
                            <a href="#" class="score score2" data-star="1"></a>
                        </div>
                    </div>
                    <!-- //별점 -->

                    <!-- 구매만족도 -->
                    <ul class="review-check">
                        <li class="n-radio-tab" value="1263">
                            <em class="label satisfactionTitle">사이즈</em>
                            
                                <input type="radio" id="choice0_25" name="satisfactionAnswer[1263]" value="25" data-category="1263">
                                <label for="choice0_25">커요</label>
                            
                                <input type="radio" id="choice0_11" name="satisfactionAnswer[1263]" value="11" data-category="1263">
                                <label for="choice0_11">보통이에요</label>
                            
                                <input type="radio" id="choice0_20" name="satisfactionAnswer[1263]" value="20" data-category="1263">
                                <label for="choice0_20">작아요</label>
                            
                        </li>
                    </ul>
                    <ul class="review-check">
                        <li class="n-radio-tab" value="1264">
                            <em class="label satisfactionTitle">밝기</em>
                            
                                <input type="radio" id="choice1_10" name="satisfactionAnswer[1264]" value="10" data-category="1264">
                                <label for="choice1_10">밝아요</label>
                            
                                <input type="radio" id="choice1_11" name="satisfactionAnswer[1264]" value="11" data-category="1264">
                                <label for="choice1_11">보통이에요</label>
                            
                                <input type="radio" id="choice1_18" name="satisfactionAnswer[1264]" value="18" data-category="1264">
                                <label for="choice1_18">어두워요</label>
                            
                        </li>
                    </ul>
                    <ul class="review-check">
                        <li class="n-radio-tab" value="1265">
                            <em class="label satisfactionTitle">색감</em>
                            
                                <input type="radio" id="choice2_15" name="satisfactionAnswer[1265]" value="15" data-category="1265">
                                <label for="choice2_15">선명해요</label>
                            
                                <input type="radio" id="choice2_11" name="satisfactionAnswer[1265]" value="11" data-category="1265">
                                <label for="choice2_11">보통이에요</label>
                            
                                <input type="radio" id="choice2_29" name="satisfactionAnswer[1265]" value="29" data-category="1265">
                                <label for="choice2_29">흐려요</label>
                            
                        </li>
                    </ul>
                    <ul class="review-check">
                        <li class="n-radio-tab" value="1266">
                            <em class="label satisfactionTitle">두께감</em>
                            
                                <input type="radio" id="choice3_5" name="satisfactionAnswer[1266]" value="5" data-category="1266">
                                <label for="choice3_5">두꺼워요</label>
                            
                                <input type="radio" id="choice3_11" name="satisfactionAnswer[1266]" value="11" data-category="1266">
                                <label for="choice3_11">보통이에요</label>
                            
                                <input type="radio" id="choice3_17" name="satisfactionAnswer[1266]" value="17" data-category="1266">
                                <label for="choice3_17">얇아요</label>
                            
                        </li>
                    </ul>
                    <!-- // 구매만족도 -->

                    
                        <!-- 신체지수 리뷰 공유 -->
                        <div class="review-share" id="reviewSharePos">
                            <h2>신체정보</h2>
                        </div>
                        <div class="review-share-view on">
                            <ul>
                                <li>
                                    <em class="label">성별</em>
                                    <input type="radio" class="n-radio" id="mySizeMan" name="review_share_gender" value="1"><label for="mySizeMan">남성</label>
                                    <input type="radio" class="n-radio" id="mySizeWoman" name="review_share_gender" value="2" checked="checked"><label for="mySizeWoman">여성</label>
                                </li>
                                <li>
                                    <em class="label">키</em>
                                    <input type="number" class="n-input" placeholder="" name="review_share_height" id="review_share_height" value="166" style="ime-mode:disabled;">
                                    <span>cm</span>
                                </li>
                                <li>
                                    <em class="label">몸무게</em>
                                    <input type="number" class="n-input" placeholder="" name="review_share_weight" id="review_share_weight" value="53" style="ime-mode:disabled;">
                                    <span>kg</span>
                                </li>
                                <li>
                                    <input type="checkbox" class="n-check" id="mySizeRegister" name="change_mysize">
                                    <label for="mySizeRegister">마이사이즈 기본 신체정보로 등록</label>
                                </li>
                            </ul>
                        </div>
                        <!-- //신체지수 리뷰 공유 -->
                    

                    

                    

                    <!-- 후기 작성 -->
                    <div class="review-write">
                        <label for="goods_text" class="label">상품에 대한 평가를 20자 이상 작성해 주세요.</label>
                        <!-- 입력 영역 -->
                        <div class="n-comment-input tab-wrap is-active">
                            <!-- Default -->
                            <button type="button" class="default">
                                <i class="ico ico-cont"></i>
                                <i class="ico ico-image"></i>
                                <i class="ico ico-emot"></i>
                                댓글을 남겨주세요
                            </button>

                            <!-- Util -->
                            <div class="util-area">
                                <button type="button" class="tab-btn is-active" data-tab="text">
                                    <i class="ico ico-cont">내용 입력</i>
                                </button>

                                

                                <button type="button" class="tab-btn" data-tab="emoticon">
                                    <i class="ico ico-emot">이모티콘 입력</i>
                                    <span class="n-badge badge-primary" id="emoticonCount">0</span>
                                </button>
                            </div>

                            <div class="input-area">
                                <!-- Text -->
                                <div class="tab-block is-active" data-tab="text">
                                    <textarea id="goods_text" placeholder="내용" name="goods_text"></textarea>
                                    <p class="info" id="text_size">0 자 / 20자 이상</p>
                                </div>

                                <!-- Image -->
                                

                                <!-- Emoticon -->
                                <div class="tab-block emoticon_area" data-tab="emoticon" id="emoticonWrap">
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon1" data-code="A_01" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon2" data-code="A_02" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon3" data-code="A_03" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon4" data-code="A_04" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon5" data-code="A_05" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon6" data-code="A_06" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon7" data-code="A_07" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon8" data-code="A_08" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon9" data-code="A_09" data-type="toggle"><span></span></a>
                                    <a href="#emoticon" class="ui-toggle-btn emoticon emoticon10" data-code="A_10" data-type="toggle"><span></span></a>
                                    <p class="info">스티커는 최대 3개까지 선택 가능합니다</p>
                                </div>
                            </div>
                        </div>
                        <!-- //입력 영역 -->
                    </div>
                    <!-- //후기 작성 -->

                    <!--[D] 전체동의 / 수집이용 동의-->
                    <div class="n-wrap-agree">
                        
                            
                                <input type="checkbox" class="n-check agree" id="allAgree">
                                <label for="allAgree" class="n-all-agree">전체 동의하기</label>
                            
                            <input type="checkbox" class="n-check agree ckbMyAgree btnReviewAgree" id="myReviewAgree" name="review_agree">
                            <label for="myReviewAgree">작성된 후기는 무신사 홍보 콘텐츠로 사용될 수 있습니다. (필수)</label>
                            
                                <input type="checkbox" class="n-check agree ckbMyAgree btnReviewAgree" id="myInfoAgree" name="review_share">
                                <label for="myInfoAgree">보다 나은 후기 서비스 제공을 위해 성별/키/몸무게 정보 수집ㆍ이용에 동의합니다. (선택)</label>
                            
                        
                        
                    </div>

                    <div class="n-btn-group">
                        <button type="button" class="n-btn btn-accent" id="btnSave">등록</button>
                    </div>
                </div>
            </form>
        </section>
</body>
</html>