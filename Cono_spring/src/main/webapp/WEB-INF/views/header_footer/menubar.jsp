<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#nav1{
	text-align:center;
	border-bottom: 2px solid rgb(240, 240, 240);
	margin-bottom: 22px;
}

#nav1>ul{
	display:inline-block
}
#nav1>ul li{
	float:left;
	padding:0 30px;
	line-height:40px;
	
}

#nav1 a{
	text-decoration: none;
	color: inherit;
	position: relative;
	font-size: 17px;
}

#nav1 a::after {
	content: "";
	position: absolute;
	left: 0%;
	bottom: 0;
	trasform: translateX(-50%);
	width: 0;
	height: 4px;
	background: #AED6F1 ;
	transition: all .2s ease-out;
}

#nav1 a:hover::after {
	width: 100%;
}

</style>
</head>
<body>

	<div id="nav1">
	    <ul>
	      <li><a href="search_category?cgr=패션">패션</a></li>
	      <li><a href="search_category?cgr=디지털_가전">디지털/가전</a></li>
	      <li><a href="search_category?cgr=스포츠_레저">스포츠/레저</a></li>
	      <li><a href="search_category?cgr=가구_인테리어">가구/인테리어</a></li>
	      <li><a href="search_category?cgr=생활_가공식품">생활/식품</a></li>
	      <li><a href="search_category?cgr=도서_티켓">도서/티켓/문구</a></li>
	      <li><a href="search_category?cgr=뷰티_미용">뷰티/미용</a></li>
	      <li><a href="search_category?cgr=반려">반려</a></li>
	  </ul>
	</div>

</body>
</html>