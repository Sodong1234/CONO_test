<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONO:회원 정보 수정</title>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
		<jsp:include page="./mypage_sidebar.jsp" />
		<jsp:include page="../search/recentView.jsp" />	
	</div>


	<section style="position: relative; bottom: 800px; left: 600px; width: 700px;">
		<form class="form-member" action="memberInfo_modify" method="post" style="width: 600px; margin: auto;">
			<div class="title-style">
				<a href="#" class="txt">회원 정보 수정</a> <br>
			</div>
			<table class="table-style">
				<tbody>
					<tr>
						<th>닉네임</th>
						<td>
							<div class="input-text"
								style="display: inline-block; vertical-align: middle">
								<input type="text" name="member_nick" id="id"
									required="required" value="${member.member_nick }" style="width: 258px;"><br>
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="input-text"
								style="inline-block: inline-block; vertical-align: middle">
								<input type="password" name="member_pass" id="pass"
									required="required" placeholder="영문 + 숫자 + 특수문자 8자 이상" style="width: 258px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
							<td>
								<div class="input-text"
									style="inline-block: inline-block; vertical-align: middle">
									<input type="password" name="member_pass2" id="pass"
										required="required" placeholder="비밀번호를 재입력하세요" style="width: 258px;">
								</div>
							</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="input-text"
								style="inline-block: inline-block; vertical-align: middle">
								<input type="email" name="member_email" id="email"
									required="required" value="${member.member_email }"
									placeholder="이메일을 입력해주세요" style="width: 258px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="input-text"
								style="inline-block: inline-block; vertical-align: middle">
								<input type="text" name="member_phone" id="number"
									required="required" value="${member.member_phone }"
									placeholder="전화번호입력" style="width: 258px;"><input type="button"
									class="table-style__phone" value="인증요청"><br> <input
									type="text" name="number" id="number" required="required"
									placeholder="인증번호" style="width: 258px;"><input type="button"
									class="table-style__phone-check" value="확인"><br>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="form-submit" style="text-align: center !important; position: relative; right: 50px;">
				<button type="submit" class="modifySubmit">회원 정보 수정하기</button>
			</div>
		</form>
	</section>


	<div class="clear" style="position: relative; bottom: 400px;">
		<jsp:include page="../header_footer/footer.jsp" />
	</div>

</body>
</html>
