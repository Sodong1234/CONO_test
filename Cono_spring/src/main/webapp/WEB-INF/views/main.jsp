<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
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
    background-color: rgb(234, 237, 242);
}
.main_text{
	width: 920px;
	height: 52px;
	font-size: 45px;
	position: relative;
	top: 120px;
	margin: auto;
}
.inner_home_theme{
	background-color: #eaedf2;
    width: 1280px;
    height: 460px;
    position: relative;
    top: 220px;
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
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="header_footer/top.jsp"/>
	</div>
 		<div class="intro_bg">
 			<div class="main_text">
 				<span>오늘은 어떤게 필요하신가요?</span>
 			</div>
	 		<div class="inner_home_theme">
	                <ul class="list_home_theme1">
	                    <li class="list_category">
	                    	<a href="search_category?cgr=1" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/fassion.jpg">
	                            </span>
	                            <span class="cgr_text">패션</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=2" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/digi.jpg">
	                            </span>
	                            <span class="cgr_text">디지털/가전</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=3" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/sports.jpg">
	                            </span>
	                            <span class="cgr_text">스포츠/레저</span>
	                        </a>
	                    </li>
	                    <li class="list_category">
	                        <a href="search_category?cgr=4" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/inter.jpg">
	                            </span>
	                            <span class="cgr_text">가구/인테리어</span>
	                        </a>
	                    </li>
	                </ul>
	                <ul class="list_home_theme2">
		         	 <li class="list_category">
		                        <a href="search_category?cgr=5" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/life_food.jpg">
	                            </span>
	                            <span class="cgr_text">생활/식품</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=6" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/book.jpg">
	                            </span>
	                            <span class="cgr_text">도서/티켓/문구</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=7" class="cgr_req">
	                            <span class="category_img">
	                            	<img class="category_img" src="resources/main_img/beauty.jpg">
	                            </span>
	                            <span class="cgr_text">뷰티/미용</span>
	                        </a>
		                    </li>
		                    <li class="list_category">
		                        <a href="search_category?cgr=8" class="cgr_req">
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
	<footer style="position: relative; bottom: auto;">
 			<jsp:include page="header_footer/bottom.jsp" />
	</footer>
</body>
</html>
