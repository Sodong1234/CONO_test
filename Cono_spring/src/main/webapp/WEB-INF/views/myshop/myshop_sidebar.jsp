<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Rubik&display=swap');
.sidebar{
   position: fixed;
   width: 210px;
   left: 80px;
   border-radius:30px;   
   background: #CDF0EA;
   padding-top: 50px;
   padding-bottom: 50px;
   top: 163px;
    box-shadow: 1px 1px 1px 1px #F6C6EA;
}

.sidebar a{
   display: block;
   padding: 10px 20px;
   color: black;
   text-decoration: none;
   font-family: "Rubik";
   letter-spacing: 2px;
}

.sidebar a:hover{
   color: #14C38E;
   margin-left: 20px;
   transition: 0.4s;
}
</style>
</head>
<body>

	<!-- 사이드바 -->
		<div class="sidebar">
			<a class="nav-link active" aria-current="page" href="ProductMyshop.shop">내 상점</a>
			<a class="nav-link" href="ItemUploadForm.shop">상품 등록</a>
			<a class="nav-link" href="ItemMng.shop">상품 관리</a>
			<a class="nav-link" href="ItemReviewMng.shop">상품 후기 관리</a>
			<a class="nav-link" href="ItemOrdMng.shop">상품 주문 관리</a>
			<a class="nav-link" href="follow">팔로우 상점</a>
		</div>
	


</body>
</html>