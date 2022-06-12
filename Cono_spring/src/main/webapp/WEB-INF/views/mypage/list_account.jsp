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
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<div class="accountInfo">
		<div class="accountInfoBox">
			<div class="accountInfoBoxInside">
				<ul class="userInfo">
					<li class="userInfo__title"></li>
					<ul class="userInfo__inside">
						<li class="userInfo__msg">
							<span class="useInfo__plzmsg">환불계좌를 등록해주세요.</span>
						</li>
						<li class="userinfo__value">
							<div class="userInfo__setName">
								<div class="userInfo__name1">예금주</div>
								<div class="userInfo__name2">${name }테스트</div>
							</div>
							<div class="userInfo__setBank">
								<div class="userInfo__bank1">은행</div>
								<div class="userInfo__selectBank">
									<select class="userInfo__selectBankList">
										<option value="NONE" disabled selected>은행을 선택해주세요.</option>
										<option value="002">산업은행</option>
										<option value="003">기업은행</option>
										<option value="004">국민은행</option>
										<option value="005">외환은행</option>
										<option value="006">수협은행</option>
										<option value="007">농협은행</option>
										<option value="008">우리은행</option>
										<option value="009">SC제일은행</option>
										<option value="010">씨티은행</option>
										<option value="011">부산은행</option>
										<option value="012">광주은행</option>
										<option value="013">제주은행</option>
										<option value="014">전북은행</option>
										<option value="015">경남은행</option>
										<option value="016">새마을금고</option>
										<option value="017">신협은행</option>
										<option value="018">우체국</option>
										<option value="019">하나은행</option>
										<option value="020">신한은행</option>
										<option value="021">케이뱅크</option>
										<option value="022">카카오뱅크</option>																																																		
									</select>	
								</div>
							</div>
							<div class="userInfo__setAccount">
								<div class="userInfo__account1">계좌번호</div>
								<input type="number" placeholder="계좌번호를 입력해주세요." class="userInfo__account2">
								<button class="userInfo__accountCheck">인증</button>
							</div>
						</li>
						<div class="userInfo__check">
							<input type="checkbox" class="userInfo__checkBox">
							<span>성명, 은행명, 계좌번호를 환불목적으로 수집, 5년간 처리에 동의</span>
						</div>
						<li class="userInfo__caution">
							<ul class="caution1">
								<i class="caution11"></i>
								무통장 입금 혹은 휴대폰으로 결제 후 주문 취소할 경우 무통장 계좌로 환불해드립니다. (단, 고객님 본인 명의의 계좌만 가능)
							</ul>
							<ul class="caution2">
								<i class="caution22"></i>
								환불계좌 등록 후, 환불대기중의 상품은 등록하신 계좌로 변경되어 환불됩니다.
							</ul>
							<ul class="caution31">
								<i class="caution33"></i>
								그 외 문의는 고객센터(1577-####) 또는 1:1 CONO 문의를 이용해주시기 바랍니다.
							</ul>
						</li>
						<div class="userInfo__button">
							<button class="userInfo__button-cancle">취소</button>
							<button class="userInfo__button-ok">확인</button>							
						</div>
					</ul>
				</ul>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: 565px;">
 		<jsp:include page="../header_footer/bottom.jsp"/>
 	</div>
</body>
</html>