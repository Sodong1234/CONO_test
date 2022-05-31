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
		<jsp:include page="./HeaderFooter/top.jsp"/>
	</div>
		  <input type="text" placeholder="검색"><button>검색</button>
		<div class="clear"></div>   
		<hr> 
		
		
		<div>
			<section></section>
			<section></section>
		</div>
		  
	<div class="clear">
 			<jsp:include page="./HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>


