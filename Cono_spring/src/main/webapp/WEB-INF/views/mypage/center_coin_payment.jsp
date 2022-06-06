<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	// 가맹점 식별 코드 : imp64297364
	// REST API : 7440562304225525
  	var IMP = window.IMP;
 		IMP.init("imp64297364"); // "iamport" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	//결제시 전달되는 정보
	IMP.request_pay({
			    pg : 'inicis', 
			    pay_method : 'card',
			    merchant_uid : 'coin' +  new Date().getTime(),
			    name: "coin" + "${payment.payment_value}",	// 상품 이름
			    amount: ${payment.payment_value},	
			    buyer_name: "${payment.member_id}",
			    buyer_tel: "${payment.member_phone}"
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
			        history.back();
			    }
			    if(result=='0') {
			    	location.href="addCoin?payment_value=${payment.payment_value}";
			    }
			    alert(msg);
			});
</script>
</head>
<body>

</body>
</html>