<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function visiblePayCheck() {
		var checkBox = document.getElementById("payCheck");
		var vis = checkBox.style.visibility;
		if(vis == "" || vis == "hidden") {
			vis = "visible";
		} else {
			vis = "hidden";
		}
		
	}
	function requestPay() {
	
	  	var payment = document.getElementsByName("payment");
	  	var payment_name;
	  	var payment_value;
	  	for(var i=0; i<payment.length; i++) {
	  		if(payment[i].checked) {
				payment_name = payment[i].value + " 코인";
	  			payment_value = Number(payment[i].value);
	  		}
	  	}
	  	alert(payment_name + " " + payment_value);
	  	location.href="mypage/center_coin_payment?payment_name=" + payment_name + "&payment_value=" + payment_value;
	}
</script>
</head>
<body>

	<h1>코인페이지</h1>
	<button onclick="visiblePayCheck()">코인충전</button>
	<h1>결제하기</h1>
		<table border="1" id="payCheck" hidden="">
			<tr><td><input type="radio" name="payment" value="10000"></td><td colspan="1">10,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="30000"></td><td colspan="2">30,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="50000"></td><td colspan="2">50,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="100000"></td><td colspan="2">100,000원</td></tr>
<!-- 			<tr><td><input type="checkbox" name="payment" value=""></td><td>직접 입력</td><td><input type="text" name="payment"></td></tr> -->
		</table>
		<button onclick='requestPay()'>결제하기</button>
	<table border="1">
		
		<tr><td colspan="4">사용가능한 코인</td><td>${coin_total}</td></tr>
		<tr><td>No.</td><td>적립내역</td><td>사용내역</td><td>보유 코인</td><td>날짜</td></tr>
		<c:forEach var="coinVO" items="${coin }">
		<tr><td>${coinVO.coin_idx}</td><td>${coinVO.coin_add }</td><td>${coinVO.coin_use }</td><td>${coinVO.coin_total }</td><td>${coinVO.coin_date }</td></tr>
		</c:forEach>
		
	</table>
</body>
</html>