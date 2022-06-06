<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<nav>
	<div class="mypage_profile">
		<div class="mypage_profile_div_img">
			<img src="" class="mypage_profile_img">img 들어감
		</div>
		<div class="mypage_profile_div_myIntro">
			<span class="mypage_profile_nickname">닉네임</span>
			<span class="mypage_profile_myIntro">자기소개글</span>
		</div>
	</div>
	<div>
		<table border="1">
			<tr><th>나의 코노</th></tr>
			<tr><td><a href="recentViewList">최근 본 상품</a></td></tr>
			<tr><td><a href="follow">팔로잉&팔로워</a></td></tr>
			<tr><td><a href="MypageList_myReview.jsp">나의 후기</a></td></tr>
			
			<tr><th>알림 및 메세지</th></tr>
			<tr><td><a href="mypageList_alarm.jsp">알림</a></td></tr>
			<tr><td><a href="MypageList_dm.mypage">메세지</a></td></tr>
			
			<tr><th>내 정보</th></tr>
			<tr><td><a href="memberInfo_modify">회원 정보 수정</a></td></tr>
			<tr><td><a href="accountInfo">계좌 정보 관리</a></td></tr>
			<tr><td><a href="delete_id">회원 탈퇴</a></td></tr>
		
		</table>
	</div>
</nav>

<br>

<nav>
	<section class="mypage_info">
		<table border="1">
			<tr><th colspan="4">내 정보</th></tr>
			<tr>
				<td>
					코인<hr>
					<a href="coin" class="coin">${coin_total}P</a>
				</td>
				<td>
					예약 중인 상품<hr>
					<a href="reserved">${reservedCount}</a>
				</td>
				<td>
					장바구니<hr>
					<a href="basket">${basketCount}</a>
				</td>
				<td>
					쿠폰<hr>
					<a href="coupon">${couponCount}</a>
				</td>
			</tr>
		</table>
		<br><hr><br>
		구매완료<hr>
	</section>
	<section class="mypage_info_detail">
		
	</section>
</nav>
<div id="resultArea"></div>

	<div class="clear">
 		<jsp:include page="../header_footer/bottom.jsp" />
	</div>

</body>
</html>