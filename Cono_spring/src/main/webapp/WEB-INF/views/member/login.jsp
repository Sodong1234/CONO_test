<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<title>CONO::로그인</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
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
			<div class="col-xl-6 col-lg-6 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인1</h1>
									</div>
									<form class="user" action="login" method="post" id="login">
										<div class="form-floating">
											<input type="text" class="form-control" name="member_id" id="floatingInput" placeholder="Username"> 
											<label for="floatingInput">Username</label>
										</div>
										<div class="form-floating">
											<input type="password" class="form-control" name="member_pass" id="floatingPassword" placeholder="Password">
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
										<a href="https://kauth.kakao.com/oauth/authorize?client_id=f9f5f6880f6e92a9e2fabbf34781366d&redirect_uri=http://localhost:8080/cono/kakao_callback&response_type=code" class="btn btn-warning btn-user btn-block"> 
											<i class="fab fa-google fa-fw"></i> 카카오로 로그인
										</a> 
										<a class="btn btn-success btn-user btn-block" name="naver" onclick="location.href='${urlNaver}'" > 
											<i class="fab fa-facebook-f fa-fw"></i> 네이버로 로그인
										</a>
									</form>
									<hr>
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
<!--  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
crossorigin="anonymous">
</script>
</body>
</html>


