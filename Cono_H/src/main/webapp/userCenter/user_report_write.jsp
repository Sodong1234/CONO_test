<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	작은 새 창으로 하면 좋을 것 같아요!
	<h2>신고하기 페이지</h2>
	
	<details>
		<summary>광고 (상점 및 타사이트 홍보, 상품도배)</summary>
			<p onclick="">상점 및 타사이트 홍보</p>
			<p onclick="">상품도배</p>
	</details>	
	<details>
		<summary>상품 정보 부정확 (상품명, 이미지, 가격, 태그 등)</summary>
			<p><textarea rows="10" cols="10">신고 내용을 직접 작성해주세요.</textarea> </p>
	</details>	
	<details>
		<summary>거래 금지 품목</summary>
			<p>가품 (위조품/이미테이션)</p>
			<p>개인정보  거래(SNS 계정, 인증번호 글)</p>
			<p>반려동물(분약/입양 글)</p>
	</details>	
	<details>
		<summary>기타(사유)</summary>
			<p><textarea rows="10" cols="10">신고 내용을 직접 작성해주세요.</textarea> </p>
	</details>
	
	<input type="submit" value="등록">
</body>
</html>