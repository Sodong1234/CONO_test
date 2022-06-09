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
</head>
<body>
	<div id="wrap">
		<jsp:include page="header_footer/top.jsp"/>
	</div>
		<div class="clear"></div>   
		<hr> 
		<div>
			<section>
				<span><a href="search_category?cgr=1">패션</a></span>
				<span><a href="search_category?cgr=2">디지털/가전</a></span>
				<span><a href="search_category?cgr=3">스포츠/레저</a></span>
				<span><a href="search_category?cgr=4">가구/인테리어</a></span>
				
			</section>
			<section>
				<span><a href="search_category?cgr=5">생활/가공식품</a></span>
				<span><a href="search_category?cgr=6">도서/티켓/문구</a></span>
				<span><a href="search_category?cgr=7">뷰티/미용</a></span>
				<span><a href="search_category?cgr=8">반려</a></span>
			</section>
		</div>
		  
	<div class="clear">
 			<jsp:include page="header_footer/bottom.jsp" />
	</div>
</body>
</html>
