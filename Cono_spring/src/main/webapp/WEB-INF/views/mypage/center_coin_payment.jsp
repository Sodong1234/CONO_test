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
$("btn_payment").click(function() {
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		
	  	IMP.init(imp64297364);
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount : 1000/*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
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