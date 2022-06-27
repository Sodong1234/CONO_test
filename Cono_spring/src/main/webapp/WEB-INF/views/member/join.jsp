<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONO::회원가입</title>
<!--  jQuery -->
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<!--   iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-1.1.8}.js"></script>
<script>
	var isCheckRetypePass = false;
	var isCheckId = false;
	var isCheckPass = false;
	var isCheckPhone = false;
	var isCheckEmail = false;
	var isCheckLaw = false;
	
	function checkId() {
		$.ajax({
			url : "member/checkId",
			type : "POST",
			dataType : "json",
			data : {"member_id" : $("#member_id").val()},
			success : function(data) {
				if(data == 1) {
					alert("중복된 아이디입니다.");
					$("#member_id").focus();
					
				} else if(data == 0) {
					$("#checkId").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
					isCheckId = true;
				}
			}
		})
	}
	
	function checkPhone(phone) {
		var regPhone = /^01([0|1|6|7|8|9)])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(!regPhone.exec(phone)) {
			document.getElementById("checkPhoneResult").innerHTML = "전화번호 양식에 맞지 않습니다.";
			document.getElementById("checkPhoneResult").style.color = "RED";
			isCheckPhone = false;
		} else {
			document.getElementById("checkPhoneResult").innerHTML = "사용 가능합니다.";
			document.getElementById("checkPhoneResult").style.color = "GREEN";
			isCheckPhone = true;
		}
	}
	
	function checkEmail(email) {
		var regEmail = /^[A-Za-z0-9-_.]+@[A-Za-z0-9-]+\.[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*$/;
		
		if(!regEmail.exec(email)) {
			document.getElementById("checkEmailResult").innerHTML = "이메일 양식에 맞지 않습니다.";
			document.getElementById("checkEmailResult").style.color = "red";
			isCheckEmail = false;
		} else {
			document.getElementById("checkEmailResult").innerHTML = "사용 가능합니다.";
			document.getElementById("checkEmailResult").style.color = "GREEN";
			isCheckEmail = true;
		}
	}

	function checkPass(pass) {

		var lengthRegex = /^[A-Za-z0-9!@#$%^&*()-_=+]{8,16}$/;
		var engUpperRegex = /[A-Z]/;
		var engLowerRegex = /[a-z]/;
		var numRegex = /[0-9]/;
		var specRegex = /[!@#$%]/;

		var count = 0;

		if (!lengthRegex.exec(pass)) {
			document.getElementById("checkPassResult").innerHTML = "영문,숫자,특수문자 8~16자 필수";
			document.getElementById("checkPassResult").style.color = "red";
			isCheckPass = false;

		} else {
			if (engUpperRegex.exec(pass))
				count++;
			if (engLowerRegex.exec(pass))
				count++;
			if (numRegex.exec(pass))
				count++;
			if (specRegex.exec(pass))
				count++;

			switch (count) {
			case 4:
				document.getElementById("checkPassResult").innerHTML = "사용 가능한 비밀번호(안전)";
				document.getElementById("checkPassResult").style.color = "GREEN";
				isCheckPass = true;
				break;
			case 3:
				document.getElementById("checkPassResult").innerHTML = "사용 가능한 비밀번호(보통)";
				document.getElementById("checkPassResult").style.color = "yellow";
				isCheckPass = true;
				break;
			case 2:
				document.getElementById("checkPassResult").innerHTML = "사용 가능한 비밀번호(위험)";
				document.getElementById("checkPassResult").style.color = "orange";
				isCheckPass = true;
				break;
			default:
				document.getElementById("checkPassResult").innerHTML = "영문,숫자,특수문자 8~16자 필수";
				document.getElementById("checkPassResult").style.color = "red";
				isCheckPass = false;
			}

		}
	}

	function checkRetypePass(pass2) {
		var pass = document.fr.pass.value;
		var span = document.getElementById("checkRetypePassResult");
		if (pass2 == pass) {
			span.innerHTML = "패스워드 일치";
			span.style.color = "GREEN";
			isCheckRetypePass = true;
		} else {
			span.innerHTML = "패스워드 불일치";
			span.style.color = "RED";
			isCheckRetypePass = false;
		}
	}

	function checkSubmit() {
		if (!isCheckId) {
			alert("아이디 중복 확인 필수!");
			document.fr.member_id.focus();
			return false;
		} else if (!isCheckRetypePass) {
			alert("패스워드 확인 필수!");
			document.fr.pass2.focus();
			return false;
		} else if (!isCheckPass) {
			alert("패스워드 규칙 확인 필수");
			document.fr.pass.focus();
			return false;
		} else if (!isCheckEmail) {
			alert("이메일 확인 필수!");
			document.fr.email.focus();
			return false;
		} else if (!isCheckPhone) {
			alert("전화번호 확인 필수!");
			document.fr.phone.focus();
			return false;
		} else if (!isCheckLaw) {
			alert("필수 약관에 동의하셔야 가입 가능합니다.");
			return false;
		}
	}
	// 		else if(checkIdResult == false) {
	// 			alert("아이디 중복확인 필수!");
	// 			document.fr.id.focus();
	// 			return false;
	// 		}

	$(document).ready(function() {
		$("#check_all").click(function() {
			if ($("#check_all").is(":checked"))
				$("input[class=normal]").prop("checked", true);
			else
				$("input[class=normal]").prop("checked", false);
		});

		$("input[class=normal]").click(function() {
			var total = $("input[class=normal]").length;
			var checked = $("input[class=normal]:checked").length;

			if (total != checked)
				$("#check_all").prop("checked", false);
			else
				$("#check_all").prop("checked", true);
		});
	});

	$(function() {
		$("#submit").click(function() {
			if ($("#check_1").is(":checked") == false) {
				// 					alert("필수 약관에 동의하셔야 가입 가능합니다.");
				// 					return false;
				isCheckLaw = false;
			} else if ($("#check_2").is(":checked") == false) {
				// 					alert("필수 약관에 동의하셔야 가입 가능합니다.");
				// 					return false;
				isCheckLaw = false;
			} else {
				isCheckLaw = true;
				$("#join").submit();
			}
		});
	});
	// 	$("#sendMail").click(function () {
	// 		var email = $(".email").val();

	// 		if(email == "") {
	// 			alert("메일 주소를 입력해주세요!");
	// 			return false;
	// 		}

	// 	})

	// =========================================== 메일 발송 ===============================
</script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="resources/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: -moz-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: -o-linear-gradient(bottom left, #CFFFE5 0%, #6EB4B5 100%);
	background: linear-gradient(to top right, #CFFFE5 0%, #6EB4B5 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

input[type="date"] {
  width:150px;
}
input[type="date"]::before {
  display:none;
}
input[type="date"].after::-webkit-calendar-picker-indicator{
    margin-left: 0px;
}

.checkbox_group {
	text-align: center;
}

input[type="submit"] {
	float: right;
	margin: 10px;
}

:root {
  --bg: #6EB4B5;
  --primary: #6EB4B5;
  --solid: #fff;
  --btn-w: 10em;
  --dot-w: calc(var(--btn-w)*.2);
  --tr-X: calc(var(--btn-w) - var(--dot-w));
}
* {box-sizing: border-box;}
*:before, *:after {box-sizing: border-box;}

.btnSub {
  position: relative;
  margin: 0 auto;
  width: var(--btn-w);
  color: var(--primary);
  border: .15em solid var(--primary);
  border-radius: 5em;
  text-transform: uppercase;
  text-align: center;
  font-size: 1.3em;
  line-height: 2em;
  cursor: pointer;  
}



</style>
<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/js/sb-admin-2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	
</script>
<body>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<div class="container" id="wrap">

		<div id="sub_img_member"></div>
		<nav id="sub_menu"></nav>
		<article>
			<form action="joinPost" method="post" id="join" name="fr" onsubmit="return checkSubmit()">
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h4 class="mb-3">회원가입</h4>
								<div class="row">
									<div class="col-md-6 mb-3">
										<label for="name">아이디</label> 
										<input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디를 입력해주세요">
									</div>
									<div class="col-md-3 mb-3">
										<label for="dup">&nbsp;</label>
										<button type="button" class="form-control" id="dupBtn" style="background-color: aquamarine;"
										onclick="checkId(this.value)" value="N">중복확인</button>
									</div>
									<div class="col-md-6 mb-3">
										<label for="nick">별명</label> 
										<input type="text" class="form-control" name="member_nick" id="nick" placeholder="닉네임을 입력해주세요">
									</div>
									<div> 
									<!-- 별명 오른쪽 빈칸 만들기용.. -->
										<label>&nbsp;</label>
										<div>&nbsp;</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="passworid">비밀번호</label>
										<input type="password" class="form-control" 
										name="member_pass" id="pass" placeholder="영문 + 숫자 + 특수문자 8자 이상" onkeyup="checkPass(this.value)">
										<span id="checkPassResult"></span><br>
									</div>
									<div class="col-md-6 mb-3">
										<label for="password">비밀번호 확인</label> 
										<input type="password" class="form-control" 
										name="pass2" id="pass2" placeholder="비밀번호 확인" onkeyup="checkRetypePass(this.value)">
										<span id="checkRetypePassResult"></span><br>
									</div>
								</div>
								<div class="mb-3">
									<label for="email">이메일</label> 
									<input type="email" class="form-control" name="member_email" id="email" placeholder="이메일을 입력해주세요" onblur="checkEmail(this.value)">
									<span id="checkEmailResult"></span>
									<button class=" col-md-3 mb-3 form-control" 
									style="background-color: aquamarine;" id="sendMail" onclick="">이메일 인증요청</button>
									<input type="text" name="number" id="number" placeholder="인증번호 입력"><br>
								</div>					
								<div class="mb-3">
									<label for="birth">생년월일</label> 
									<input type="date" class="form-control" name="member_birth" id="birth" placeholder="생년월일">
								</div>
								<div class="mb-3">
									<label for="phone">전화번호</label> 
									<input type="text" class="form-control" name="member_phone" id="phone" placeholder="전화번호 입력" onblur="checkPhone(this.value)">
									<span id="checkPhoneResult"></span><br>
								</div>
								<div class="checkbox_group">
									<input type="checkbox" id="check_all">
									 <label for="check_all">전체 동의</label><br>
									<input type="checkbox" id="check_1" class="normal">
									<label for="check_1">
									개인정보 처리방침 동의<strong> (필수)</strong>
									</label><br>
									
									<input type="checkbox" id="check_2" class="normal">
									<label for="check_2">
									서비스 이용약관 동의<strong> (필수)</strong>
									</label><br> 
									
									<input type="checkbox" id="check_3" class="normal">
									<label for="check_3">
									마케팅 수신 동의<strong> (선택)</strong>
									</label><br>
									<button type="button" class="col-md-3 mb-3 form-control" 
									style="background-color: aquamarine; left: 37%;" 
									id="checkBtn" onclick="location.href='newLawWindow'">
									약관 보기
									</button>
								</div> 
								<input type="submit" value="가입하기" class="btnSub" id="submit">
						</div>
					</div>
				</div>
			</form>
		</article>

		<div class="clear"></div>
		<jsp:include page="../header_footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>



