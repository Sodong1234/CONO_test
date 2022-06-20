<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>member/join.jsp</title>
<!--  jQuery -->
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<!--   iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-1.1.8}.js"></script>
<script type="text/javascript">

	var isCheckRetypePass = false;
	var isCheckId = false;
	var isCheckPass = false;

	function checkPass(pass) {

		var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
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
		if(pass2 == pass) {
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
		if (!isCheckRetypePass) {
			alert("패스워드 확인 필수!");
			document.fr.pass2.focus();
			return false;
		} else if (!isCheckPass) {
			alert("패스워드 규칙 확인 필수");
			document.fr.pass.focus();
			return false;
		}
	}
		// 		else if(checkIdResult == false) {
		// 			alert("아이디 중복확인 필수!");
		// 			document.fr.id.focus();
		// 			return false;
		// 		}
		
// =============================================약관동의========================================

		
// ============================================휴대폰 본인인증 ====================================
	// 가맹점 식별 코드 : imp64297364
	// REST API : 7440562304225525
  	var IMP = window.IMP;
 	IMP.init("imp64297364"); // "iamport" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
 		
 	IMP.certification(
 			//파라미터 생략시 빈 object는 입력해줘야한것 같음. 제거 시 모듈 동작 안함.
 			        {},
 			        function (rsp) {
 			            //본인인증 성공 프로세스
 			            if (rsp.success) {
 			            	 $.ajax({
 			                  	type: 'POST',
 			                   	url: '인증정보 조회할 본인 웹서버 API 경로',
 			                   	dataType: 'json',
 			                   	data: {'imp_uid' : rsp.imp_uid},
 			                  });
 			            }
 			            //본인인증 실패 프로세스
 			            else{
 			                alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
 			            }
 			        }
 			    );	
 	
 	 //callback rsp 인자 값
 	 {
 	      error_code: null
 	      error_msg: null
 	      imp_uid: "고유인증값"
 	      merchant_uid: "주문번호(신경안써도됌)"
 	      pg_provider: "danal" //PG사
 	      pg_type: "certification" //PG타입(본인인증)
 	      success: true // 성공
 	}
 	 
 	//web.php
 	Route:post('/iamport/certificate', [Controller::class,'certificate']);

 	//Controller
 	function certificate(Request $request){
 	      //아임포트 관리자 페이지의 시스템설정->내정보->REST API 키 값을 입력한다.
 	      $imp_key = "REST API 키";
 	      //아임포트 관리자 페이지의 시스템설정->내정보->REST API Secret 값을 입력한다.
 	      $imp_secret = "REST API Secret";
 	      //본인인증 모듈을 호출한 페이지에서 ajax로 넘겨받은 imp_uid값을 저장한다.
 	      $imp_uid = $request->input('imp_uid');
 	    
 	      try{
 	        $getToken  = Http::withHeaders([
 	          'Content-Type' => 'application/json'
 	        ])->post('https://api.iamport.kr/users/getToken', [
 	          'imp_key' => $imp_key,
 	          'imp_secret' => $imp_secret,
 	        ]);
 	        /*
 	         * 본인인증한 사람의 정보를 얻기 위해서는 아임포트 API 통신을해야 한다.
 	         * api access_key를 얻기위해 아임포트에서 제공되는 imp_key,imp_secret을 이용하여
 	         * 아래 api로 token을 얻는다.
 	         * return 값이 json이므로 decode하여 원하는 값을 들고온다.
 	        */
 	        $getTokenJson = json_decode($getToken, true);
 	        
 	        //API TOKEN
 	        $access_token = $getTokenJson['response']['access_token'];
 	        $getCertifications=Http::withHeaders([
 	          'Authorization' => $access_token
 	        ])->get('https://api.iamport.kr/certifications/'.$imp_uid);

 	        $getCertificationsJson = json_decode($getCertifications,true);
 	        $responseData = $getCertificationsJson['response'];

 	        $result = ['code'=>200, 'message'=>'success','data'=>$responseData];
 	      }catch(Exception $e){
 	        $result = [
 	          'code' => 410,
 	          'message' => $e->getMessage()
 	        ];
 	      }

 	      return response()->json($result);
 	      
 	    }
 	    
 	    //$responseData 상세 값
 	    
 	   {
 	    "birth":, //무슨 표기법으로 표시한지 모르겠음.
 	    "birthday":"YYYY-MM-DD",
 	    "carrier":"SKT", //통신사
 	    "certified":true, //인증 성공 여부
 	    "certified_at":인증날짜,
 	    "foreigner":false, //외국인 여부
 	    "gender":"male", // 성별
 	    "imp_uid":"인증고유값",
 	    "merchant_uid":"신경안써도되는값",
 	    "name":"이름",
 	    "origin":"요청URL",
 	    "pg_provider":"danal", //PG사
 	    "pg_tid":"요청일시",
 	    "phone":"휴대폰번호",
 	    "unique_in_site":"뭔지 모르겠음",
 	    "unique_key":"뭔지 모르겠음"
 	    }
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
			<form action="joinPost" method="post" id="join" name="fr">
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h4 class="mb-3">회원가입</h4>
							<form class="validation-form" novalidate>
								<div class="row">
									<div class="col-md-6 mb-3">
										<label for="name">아이디</label> 
										<input type="text" class="form-control" name="member_id" id="id" 
										placeholder="아이디를 입력해주세요" required>
										<div class="invalid-feedback">아이디를 입력해주세요.</div>
									</div>
									<div class="col-md-3 mb-3">
									<label for="dup">&nbsp;</label>
									<button class="form-control" style="background-color: aquamarine;">중복확인</button>
									</div>
									<div class="col-md-6 mb-3">
										<label for="nick">별명</label> <input type="text" class="form-control" name="member_nick" id="nick" placeholder="닉네임을 입력해주세요" required>
										<div class="invalid-feedback">별명을 입력해주세요.</div>
									</div>
									<div> <!-- 별명 오른쪽 빈칸 만들기용.. -->
										<label>&nbsp;</label>
										<div>&nbsp;</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="pass">비밀번호</label> <input type="password" class="form-control" name="member_pass" id="pass" placeholder="영문 + 숫자 + 특수문자 8자 이상" required>
										<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="pass">비밀번호 확인</label> <input type="password" class="form-control" name="member_pass2" id="pass2" placeholder="비밀번호 확인" required>
										<div class="invalid-feedback"></div>
									</div>
								</div>
								<div class="mb-3">
									<label for="email">이메일</label> <input type="email" class="form-control" name="member_email" id="email" placeholder="이메일을 입력해주세요" required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>					
								<div class="mb-3">
									<label for="birth">생년월일</label> <input type="date" class="form-control" name="member_birth" id="birth" placeholder="생년월일" required>
									<div class="invalid-feedback">생년월일을 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="phone">전화번호</label> <input type="text" class="form-control" name="member_phone" id="phone" placeholder="전화번호 입력" required>
									<div class="invalid-feedback">전화번호를 입력해주세요.</div>
									<input type="button" value="인증요청"><br> 
									<input type="text" name="number" id="number" placeholder="인증번호 입력"><br>
									<input type="button" value="확인"><br>
								</div>
								<div class="checkbox_group">
									<input type="checkbox" id="check_all">
									 <label for="check_all">전체 동의</label><br>
									 
									<input type="checkbox" id="check_1" class="normal">
									<label for="check_1">개인정보 처리방침 동의</label> <br>
									
									<input type="checkbox" id="check_2" class="normal">
									<label for="check_2">서비스 이용약관 동의</label><br> 
									
									<input type="checkbox" id="check_3" class="normal">
									<label for="check_3">마케팅 수신 동의</label><br>
								</div> 
								<input type="submit" value="가입하기" class="submit">
							
							</form>
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



