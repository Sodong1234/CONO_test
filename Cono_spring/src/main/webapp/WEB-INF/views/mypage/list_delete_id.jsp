<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:회원 탈퇴</title>
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


</style>

</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	<section style="width: 980px; margin: auto;" >
		<div>
			<div class="deleteMember__container">
				<form action="#" method="post">
					<div class="deleteMember__head">
						<p><strong>회원님! CONO 서비스를 이용하시는데 불편함이 있으셨나요?</strong></p>
			            이용 불편 및 각종 문의 사항은 고객센터로 문의 주시면 성심 성의껏 답변 드리겠습니다.<br>
			            - <a href="#">고객센터</a> / 전화 문의 : 1577-#### (365일 오전 9시 ~ 오후 6시)
					</div>
					<div class="deleteMember__box">
						<div class="deleteMember__box__notice" style="padding:20px">
							<section>
								<h3 style="font-family: 'IBMPlexSansKR-Regular';">회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h3>
								<ul>
									<li>- 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.</li>
									<li>- 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
									<li>- 유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.</li>
									<li>- 유효기간 내 사용하지 못한 미사용 쿠폰은 구매금액의 70%를 CONO COIN으로 적립해 드리나, 탈퇴시 적립 받을 수 없습니다.</li>
									<li>- 보유하셨던 CONO COIN은 탈퇴와 함께 삭제되며 환불되지 않습니다.</li>
									<li>- 회원탈퇴 후 CONO 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.
									<br>상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>	
									<li>- 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>																																			
								</ul>
							</section>
						</div>
						<div class="deleteMember__box__comfirm">
							<label class="deleteMember__box__comfirm-check">
							
						<c:choose>
							<c:when test="${coin_total eq null }">
								<h5><strong>현재 보유 CONO 코인 : 0c</strong></h5><br>
							</c:when>
							<c:otherwise>
								<h5><strong>현재 보유 CONO 코인 : ${coin_total }c</strong></h5><br>
							</c:otherwise>
						</c:choose>	
						
								<input class="deleteMember__box__comfirm-check-input" type="checkbox" data-type="checked" required="required">
								<span>상기 CONO 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</span>
							</label>
						</div>
					</div>
					
					<form action="delete_id" class="deleteMember__check-user">
						<p class="deleteMember__check-user-msg" style="margin = 0 0 10px;">
						<strong>보안을 위해 회원님의 아이디와 비밀번호를 확인 합니다.</strong></p>
						<label>
							<span>아이디 : </span>
							<input class="deleteMember__check-user-name" name="id" type="text" data-err-target="alert" data-err-msg="아이디를 입력하세요.">
						</label>
						<label>
							<span>비밀번호 : </span>
							<input class="deleteMember__check-user-name" name="passwd" type="password" data-err-target="alert" data-err-msg="비밀번호를 입력하세요.">
						</label>
						<input type="submit" value="탈퇴" class="deleteMember__check-user-submit">
						</form>
				</form>
					</div>
					
			</div>
		</div>
	</section>
	
	
	
</body>
</html>