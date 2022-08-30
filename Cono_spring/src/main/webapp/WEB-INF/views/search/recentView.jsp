<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.recent_li {
	list-style: none;
}
.recent_Box {
	float:
    text-decoration: none;
    background-color: #1E2027;
    position: fixed;
	top: 200px;
    height: auto;
	padding-top: 7px;
	padding-bottom: 7px;
    right: 40px;
    width: 134px;
    border-radius: 10px;
    
}
.recent_title_box {
/* 	position: relative; */
	color: #DDFFFF;
	background-color: #292C35;
	margin: auto;
	width: 130px;
	height: 25px;
	border-radius: 5px; 
	text-align: center;
	font-size: 20px;
}
.recent_ul {
 	margin: auto;
/*  	position: relative; */
 	padding-left: 0px;
}
.recent_li {
	background-color: #292C35;
/* 	position: relative; */
	width: 130px;
	height: 150px;
	border-radius: 5px;
	margin: auto;
	margin-top: 10px; 
	text-align: center;

}
.recent_li_box{

}
.recent_img {
	position : relative;
	top: 5px;
	margin : auto;
	width : 120px;
	height: 120px;
}

.recent_item_title {
	position: relative;
	top: 5px;
	width:120px;
	margin: auto;
	color: #DDFFFF;
	overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    text-align: center;
}

</style>
<script type="text/javascript">
	function btnView() {
		var r_ul = document.getElementById("recent_ul");
		
       if(r_ul.style.display == "" || r_ul.style.display == "none") {
    	   r_ul.style.display = "block";
       } else {
    	   r_ul.style.display = "none";
       }
	}
</script>
</head>
<body>
	<div class="recent_Box">
		<div class="recent_title_box" onclick="btnView()">
			<span>최근 조회</span>
		</div>
			<ul class="recent_ul" id="recent_ul" style="display: none;">
				<c:forEach var="recent" items="${getRecent}">
					<li class="recent_li" onclick="location.href='itemDetail?item_idx=${recent.item_idx}'">
						<div class="recent_li_box">
							<img class="recent_img" src="resources/upload/file/${recent.img_name}">
							<div class="recent_item_title">${recent.item_title }</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		
	</div>
</body>
</html>