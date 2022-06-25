<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
.list_category{
	list-style: none;
	text-decoration: none;
	color: lime;
}
.intro_bg{
    width: 100%;
    height: 350px;
    background-color:#CDF0EA;
}
/* .main_text{ */
/* 	width: 920px; */
/* 	height: 52px; */
/* 	font-size: 45px; */
/* 	position: relative; */
/* 	top: 120px; */
/* 	margin: auto; */
/* } */
.inner_home_theme{
	background-color: #eaedf2;
    width: 1150px;
/*     height: 460px; */
	padding: 20px;
    position: relative;
    top: 130px;
    margin: auto;
    background: #fff;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);  /* 우 아래 흐려짐 색(-넣으면 좌 위 변경) */
    border-radius: 15px;
}
.list_home_theme1{
	display : flex;
	width: 1000px;
	height: 204px;
	margin: auto;
}
.list_home_theme2{
	display : flex;
	width: 1000px;
	height: 204px;
	margin: auto;
}
.list_category{
	width:250px;
	height:204px;
	align-items: center;
	align-content: center;
	text-align: center;
}
.cgr_req{
	width: 120px;
	height: 154px;
	display: block;
	position: relative;
	margin: auto;
	top: 25px;

}
.category_img{		
	width: 120px;
	height: 120px;
	display: block;
	border-radius: 50%; 
	margin-bottom: 10px;
	
}
.cgr_text{
	text-decoration: none;
}

*{

font-family: 'IBMPlexSansKR-Regular';

}

@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>


<!-- 실시간 인기순위 -->
<style type="text/css">

@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


*{

font-family: 'IBMPlexSansKR-Regular';

}

.relative {
    position: relative;
}

.center-align {
    margin: 0 auto;
    width: 1080px;
}

#rank-hot {
    height: 200px;
    border-top: 1px solid #f1f3f6;
    border-bottom: 1px solid #d1d8e4;
}

#rank-hot ul {
    display: inline-block;
    margin: 0;
    padding: 16px 0 0 4px;
    list-style: none;
}

#view{
	display:none;
	position:absolute;
	left:10px;
	top:10px;
	z-index:99;
	font-size:12px;
	font-weight:bold;
	border: 2px solid navy;
	border-radius: 4px;
	float: center;
	
	}

#search-ranking {
    position: relative;
    left: 0;
    width: 200px;
    height: 25px;
}

#search-ranking ul {
	letter-spacing:1px;
    display: none;
    list-style: none;
    padding: 17px;
    margin: 0;
    width: 300px;
    height: 330px;
    border: 1px solid #EFFFFD;
    background: white;
    border-radius:5px;
    position: absolute;
    top: 0;
    right: 0;
    z-index: 100;
    box-shadow: 4px gray;
    background-color: #EFFFFD;
}

#search-ranking li  {
	margin-top: 1px;
}

#search-ranking:hover ul {
    display: inline-block;
}

#rank-number {
    margin-top: -9px;
    color: #5F9EA0;
    font-size: 20px;
    font-style: bold;
    font-family:'Cafe24Ohsquare';
}

#rank-title {
    letter-spacing: -1px;
    font-size: 14px;
}

.clickBtnDiv {
	display: inline-block;
}

.clickBtn {
	padding: 5px 5px;
	border: 2px solid #1597BB;
	background-color: #1597BB;
	font-style : italic;
	
	color: white;
	border-radius: 6px;
	margin: auto;
	margin-left : 100px;
}

#readCnt {
	float: right;
	text-decoration: none;
}

@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="header_footer/header.jsp"/>
	</div>


<!-- 실시간 인기순위 -->
	<nav class="rank-hot">
	  <div class="center-align">
	    <div id="search-ranking">
	      <div>
	        <span id="rank-number"> * 실시간 인기! *</span>
	      </div>
	   
	      <ul>
		    <p class="view"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>☆ 실시간 인기순위 ☆</strong> &nbsp;</p>
		    	<c:if test="${sessionScope.hotList eq null }">
		    		<div class="clickBtnDiv">
		    			<input type="button" class="clickBtn" value="Click!" onclick="location.href='./hotItem'">
		    		</div>
		    	</c:if>
			<c:forEach var="hot" items="${sessionScope.hotList }">
		        <li>
		          <span class="rank-number">${hot.num}.</span>
		          <span class="rank-title"><a href="itemDetail?item_idx=${hot.item_idx }">${hot.item_title}</a>
		          <a id="readCnt">
		          <img 
		          	src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAaCAYAAADMp76xAAAAAXNSR0IArs4c6QAABAdJREFUWAm9mFtIFFEYx9tZ11UW1tLoaoGEPShqq3ahgogyIgnqQXqIgih6qKgEH4JIqCgIIoowIrSn6i0irOxCQdAN7wb2IiSlSUZuGJGyumu/b9lZZo8zs7ObdeBwvvNd/uc/53zznWFcs9Js7e3tczVNWzs1NbUKiErGfJfLNYcxVyCRg8g/GAeZdiC3eTyeN2VlZd/Enm5zpRLY09Pjm5yc3EnMbghUMbpTiYd8BP8X9Dt+v/9uYWHhz1TixdcR4YGBgezh4eFD+J+gz5XAGWijYFzKycm5nArxpIQ5+hqAr9AXzgBJM4ggqXWyvLz8uplR1VkShmgOR3iVo9+jBv2LOWs9pu+H+JAdvilhyC4j6AldxqSNhT7g1Oh2u59mZWV9loDx8fGl4XB4C+IBHrpIdA7ad7C2V1RUvLPynUa4u7s7wIvVQsB8qyCDfgK5jgUaWChs0MdFyLo7OjoOo7hI98QN1sJvsHaB+cDMJYFwV1fXCnblJY5+M2dFN8GOVgcCgWeK3nQKdhXYDzE6IR2GdA2k76lgmq7o7OxcBGAzcydkJazOKVlxjvnWieyguTmZ25y21PiEFt3h/v7+rJGRkddYyhOsFhOe/gMvR6lVGliEzZL0YGPep5DTw16vd2VJScmAjhnd4WAweBaFI7KxwEaVLCQyIHOafB2ULrLo9IVkjMU0GnVJ5PmhUOim0UejIqwGuNaoTCZLNVB9yNFTkUikHqzF0kUWnepnFqv6GOdgbWYDDuo6jaduYOLWFU5Gvgk+qX4A73ei08ue6ms3B/ui3LbiozExLUd2AOxSQnWx850h2+f8/PyQYGksfoRxMhVguRRUf06qyYnOLFaNM87BjdAP0KMbq1Fu2phcMDolk2M3WIIbOGf5JjgD1hfpIosuwYmJWazqo8yvGG++6NH29vZmjo2NPcdxveJsOoXQ/yprXcKpsrLyt04kWtaKi4tDPp9vB0T6dIPdSN4Xxa5bO7dpNomR2GkGEwVchjIyMrYbyYpbwstDGSqkHL0CdJ4Jhqr6l1ezfNhvhGynumj8ahYDOSc7vI7+UeZJmke+DajjR3lAy7IoNvERX/CcfEd8pRBsMCMrfBJ2WCdITi8gpx8xD+g6u1FyGvtff15KSlLjt5aWllpumClhIdfX1+cdHR09D0gtu2TpZ/cgKdqasrOzj/M+/bKLS0qEb4JN5PU1QJbbAaVrY0M+UQKPkY73nWAkJSwgkoe84fsQ6+lLRDcD7Stkz3FV35Aq5RTPEWEdLFavt7HQXnTVPEimbnM4ThDbQtytvLy85oKCgnGHcXG3lAjHoxAogbNJlTWIq6VDQn6k5DLmih+y/EgJMsqPlFaOvZW3/y0v1A+xp9v+ADhPuomDsZuZAAAAAElFTkSuQmCC"
					width="16" height="10" alt="조회수 아이콘">
		          &nbsp; ${hot.item_readCnt}</a></span>
		        </li>
			</c:forEach>
	      </ul>
	    </div>
	   </div>
	</nav>

	
 		<div class="intro_bg">
<!--  			<div class="main_text"> -->
<!--  			</div> -->
	 		<div class="inner_home_theme">
	                <ul class="list_home_theme1">
	                    <li class="list_category">
	                    	<a href="search_category?cgr=패션" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/fassion.jpg">
	                            </span>
	                            <span class="cgr_text">패션</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=디지털_가전" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/digi.jpg">
	                            </span>
	                            <span class="cgr_text">디지털/가전</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=스포츠_레저" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/sports.jpg">
	                            </span>
	                            <span class="cgr_text">스포츠/레저</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=가구_인테리어" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/inter.jpg">
	                            </span>
	                            <span class="cgr_text">가구/인테리어</span>
	                        </a>
	                    </li>
	                </ul>
	                <ul class="list_home_theme2">
		         	 <li class="list_category">
		                        <a href="search_category?cgr=생활_가공식품" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/life_food.jpg">
	                            </span>
	                            <span class="cgr_text">생활/식품</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=도서_티켓" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/book.jpg">
	                            </span>
	                            <span class="cgr_text">도서/티켓/문구</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=뷰티_미용" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/beauty.jpg">
	                            </span>
	                            <span class="cgr_text">뷰티/미용</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=반려" class="cgr_req">
	                             <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/야옹이.jpg">
	                            </span>
	                            <span class="cgr_text">반려</span>
	                        </a>
		                    </li>
		         	</ul>
	         </div>
		</div>
		  
		  <img alt="" src="${path }/resources/upload/test.jsp">
		  
		  
<!-- 	<footer style="position: relative; bottom: auto;"> -->
<%--  			<jsp:include page="header_footer/footer.jsp" /> --%>
<!-- 	</footer> -->
</body>
</html>
