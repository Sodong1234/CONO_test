<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String itemId = request.getParameter("");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">


var checkProductResult = false;

	function one_on_one_message() {
		window.open("OoOMessageProduct.jsp", "1:1 대화", "width=500, height=900");
	}
	
	function ProductInBasket() {
		
		if(confirm("장바구니에 제품이 담겼습니다. 확인하러 가시겠습니까?")){
			location.href="BasketProduct.jsp";
		} else {
			return false;
		}
		
		
	}
	
</script>
</head>
<body>
<div>
		<!-- 상단 부분 -->
			<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	<h1>상품 클릭 시 - 상품 상세 정보</h1><br>
	<img src ="../images/ic_launcher.png">
	<span id = "productList"><br>
	<input type="button" value="좋아요" onclick="likeCountUp()"> 
	<!-- 하트모양으로 누르면 likeCount +1 -->
	<input type="button" value="공유" onclick="">
	<!-- 카카오, 페이스북, 인스타 등 공유 페이지 -->
	<input type="button" value="1:1 메세지" onclick="one_on_one_message()"> 
	<!-- 1:1 메세지창 띄우기 -->
	<input type="button" value="장바구니" onclick="ProductInBasket()">
	<!-- 일단 만들긴 했는데 이거 파라미터 받아온 제품으로 넘어가게 해야함! -->
	</span>
	<span id = "buyProduct">
	
<select name="userSettingSelect">
	<!-- 판매자가 드롭다운 메뉴를 셀렉트바에 넣게해야하는데 어떻게 구현하지? -->
</select>
	<input type="button" value="구매하기" onclick="BuyProduct.jsp">
	
	<!-- 제품의 상세설정 후 클릭하면 결제창으로 넘어가게 하기. -->
	</span>
		<div class="clear"></div>  
 			<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
</body>
</html>