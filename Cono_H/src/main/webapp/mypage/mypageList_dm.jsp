<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>

	<h1>DM</h1>
	<section> 
		<table border="1">
		  <tr><th rowspan="2">메시지</th><th></th><th><button>나가기</button></th></tr>
		  <tr></tr>
			<tr><td rowspan="2">로고1</td><td>판매자1</td><td>05월 03일</td></tr>
			<tr><td>마지막 톡 내용이 여기 보입니다</td><td><input type="checkbox"></td></tr>
		</table>
		
		<table border="1">
			<tr><td rowspan="2">이미지</td><td>판매자2</td><td>05월 03일</td></tr>
			<tr><td>마지막 톡 내용이 여기 보입니다</td><td><input type="checkbox"></td></tr>
		</table>
		<table border="1">
			<tr><td rowspan="2">코노단</td><td>판매자3</td><td>05월 03일</td></tr>
			<tr><td>마지막 톡 내용이 여기 보입니다</td><td><input type="checkbox"></td></tr>
		</table>
	</section>
	<br>	
	<br>
	<br>
	<section>
		<h2>*내용*</h2>
		<h3>(로고) 판매자 .......... 팔로우 / 나가기</h3>
		<br>
		<hr>
		<br>
		<h4>(로고) (판매자 톡 내용) (시간).............</h4>
		<h6>--------------------05월 03일--------------------</h6>
		<h4>.................... (시간)  (구매자 톡 내용)</h4>	
		<h4>.............................. (시간)  ( 톡 내용)</h4>	
		<h4>.............................. (시간)  ( 톡 내용)</h4>	
		<h4>.............................. (시간)  ( 톡 내용)</h4>	
		<h4>(로고) (톡 내용) (시간).........................</h4>
		
	</section>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>

</body>
</html>