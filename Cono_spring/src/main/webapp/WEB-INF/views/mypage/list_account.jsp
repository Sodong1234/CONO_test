<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:환불 계좌</title>
<script type="text/javascript">
	window.onload=function() {
		document.getElementById('accountName').value = ${account.accountName };
		document.getElementById('accountNum').value = ${account.accountNum };
		var bankName = document.getElementById('bankName');
		alert(bankName.value)
		if (var i=0; i<bankName.options.length; i++) {
			if(bankName.options[i].value == ${account.bankName }) {
				bankName.options[i].selected = true;
			}
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
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
					
						<form action="setAccountInfo" method="post">
							<c:choose>
							<c:when test="${empty account.accountName }">
							<div class="userInfo__setName">
								<div class="userInfo__name1" >예금주</div>
								<input type="text" placeholder="예금주를 입력해주세요." id="accountName" name="accountName" class="userInfo__account2">
<!-- 								<div class="userInfo__name2">테스트</div> -->
							</div>
							<div class="userInfo__setBank">
								<div class="userInfo__bank1">은행</div>
								<div class="userInfo__selectBank">
									<select class="userInfo__selectBankList" name="bankName" id="bankName">
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
								<input type="number" placeholder="계좌번호를 입력해주세요." name="accountNum" id="accountNum" class="userInfo__account2">
								</div>
								</c:when>
								
								<c:otherwise>
										<div class="userInfo__setName">
											<div class="userInfo__name1">예금주</div>
											<input type="text" id="accountName" name="accountName" class="userInfo__account2" value="${account.accountName }">
										</div>
										<div class="userInfo__setBank">
											<div class="userInfo__bank1">은행</div>
											<div class="userInfo__selectBank">
												<select class="userInfo__selectBankList" name="bankName" id="bankName">
													<option value="002" <c:if test="${account.bankName eq 002 }">selected</c:if>>산업은행</option>
													<option value="003" <c:if test="${account.bankName eq 003 }">selected</c:if>>기업은행</option>
													<option value="004" <c:if test="${account.bankName eq 004 }">selected</c:if>>국민은행</option>
													<option value="005" <c:if test="${account.bankName eq 005 }">selected</c:if>>외환은행</option>
													<option value="006" <c:if test="${account.bankName eq 006 }">selected</c:if>>수협은행</option>
													<option value="007" <c:if test="${account.bankName eq 007 }">selected</c:if>>농협은행</option>
													<option value="008" <c:if test="${account.bankName eq 008 }">selected</c:if>>우리은행</option>
													<option value="009" <c:if test="${account.bankName eq 009 }">selected</c:if>>SC제일은행</option>
													<option value="010" <c:if test="${account.bankName eq 010 }">selected</c:if>>씨티은행</option>
													<option value="011" <c:if test="${account.bankName eq 011 }">selected</c:if>>부산은행</option>
													<option value="012" <c:if test="${account.bankName eq 012 }">selected</c:if>>광주은행</option>
													<option value="013" <c:if test="${account.bankName eq 013 }">selected</c:if>>제주은행</option>
													<option value="014" <c:if test="${account.bankName eq 014 }">selected</c:if>>전북은행</option>
													<option value="015" <c:if test="${account.bankName eq 015 }">selected</c:if>>경남은행</option>
													<option value="016" <c:if test="${account.bankName eq 016 }">selected</c:if>>새마을금고</option>
													<option value="017" <c:if test="${account.bankName eq 017 }">selected</c:if>>신협은행</option>
													<option value="018" <c:if test="${account.bankName eq 018 }">selected</c:if>>우체국</option>
													<option value="019" <c:if test="${account.bankName eq 019 }">selected</c:if>>하나은행</option>
													<option value="020" <c:if test="${account.bankName eq 020 }">selected</c:if>>신한은행</option>
													<option value="021" <c:if test="${account.bankName eq 021 }">selected</c:if>>케이뱅크</option>
													<option value="022" <c:if test="${account.bankName eq 022 }">selected</c:if>>카카오뱅크</option>
												</select>
											</div>
										</div>
										<div class="userInfo__setAccount">
													<div class="userInfo__account1">계좌번호</div>
													<input type="number" name="accountNum" id="accountNum" class="userInfo__account2" value="${account.accountNum }">
												</div>
									</c:otherwise>
								</c:choose>
<!-- 								<form method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize"> -->
<%-- 									필요 파라미터는 입력데이터 없이 hidden 속성으로 전달 --%>
<!-- 									<input type="hidden" name="response_type" value="code"> -->
<!-- 									<input type="hidden" name="client_id" value="234192c2-8c1a-4cdb-a1d3-49e0f2ecc09a"> -->
<!-- 									<input type="hidden" name="redirect_uri" value="http://localhost:8080/cono/tokenCallback"> -->
<!-- 									<input type="hidden" name="scope" value="login inquiry transfer"> -->
<!-- 									<input type="hidden" name="state" value="12345678123456781234567812345678"> -->
<!-- 									<input type="hidden" name="auth_type" value="0"> -->
<!-- 									<input type="submit" value="토큰발급" class="userInfo__accountCheck"> -->
<!-- 								</form> -->
								
								<input type="submit" value="등록" class="userInfo__accountCheck">
							</div>
						</form>
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
 		<jsp:include page="../header_footer/footer.jsp"/>
 	</div>
</body>
</html>