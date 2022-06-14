<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>member/login.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- Custom fonts for this template-->
<link href="resources/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/js/sb-admin-2.min.js"></script>
<body class="bg-gradient-primary">
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user" action="login" method="post" id="login">
										<div class="form-floating">
											<input type="text" class="form-control form-control-user" name="member_id" id="id" placeholder="Username"> 
											<label for="floatingInput">Username</label>
										</div>
										<div class="form-floating">
											<input type="password" class="form-control form-control-user" name="member_pass" id="pass" placeholder="Password">
											<label for="floatingPassword">Password</label>
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck"> 
												<label class="custom-control-label" for="customCheck">아이디 기억</label>
											</div>
										</div>
										<input type="submit" class="btn btn-primary btn-user btn-block" value="로그인">
										<hr>
										<a href="" class="btn btn-warning btn-user btn-block" onclick="loginWithKakao()"> 
										<i class="fab fa-google fa-fw"></i> 카카오로 로그인
										</a> <a href="" class="btn btn-success btn-user btn-block"> <i class="fab fa-facebook-f fa-fw"></i> 네이버로 로그인
										</a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="./forget.jsp">Forgot Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="joinHow">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	        Kakao.init('ba7288b045b93c0d30a7bd856da85d67');
	        Kakao.isInitialized();
	    });
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:8080/cono/' 
	        }); // 등록한 리다이렉트uri 입력
	    }
	</script>
</body>
</html>


