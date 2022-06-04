<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
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
	  	
		// 가맹점 식별 코드 : imp64297364
		// REST API : 7440562304225525
	  	IMP.init(imp64297364);
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : payment_name,/*상품명*/,
				    amount : payment_value,/*상품 가격*/, 
				    member_id : ${member.member_id },
				    member_phone : ${member.member_phone}/*구매자 연락처*/,
				}, function(rsp) {
					var result = '';
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	location.href= $.getContextPath()+"/Cart/Success";
				    }
				    alert(msg);
				});
			}
</script>
</head>
<body>
	<h1>결제하기</h1>
		<table>
			<tr><td><input type="radio" name="payment" value="10000"></td><td colspan="1">10,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="30000"></td><td colspan="2">30,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="50000"></td><td colspan="2">50,000원</td></tr>
			<tr><td><input type="radio" name="payment" value="100000"></td><td colspan="2">100,000원</td></tr>
<!-- 			<tr><td><input type="checkbox" name="payment" value=""></td><td>직접 입력</td><td><input type="text" name="payment"></td></tr> -->
		</table>
		<input type="button" value="결제하기" onclick="requestPay()">
</body>
</html>