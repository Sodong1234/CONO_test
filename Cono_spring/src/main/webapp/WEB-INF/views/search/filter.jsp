<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//     new daum.Postcode({
//         oncomplete: function(data) {
//             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
//             // 예제를 참고하여 다양한 활용법을 확인해 보세요.
//         }
//     }).open();
    
    function execPostCode(){
    	daum.postcode.load(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없을땐 공백('')값을 가지므로, 이를 참고하여 분기한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('userZipcode').value = data.zonecode;
                    document.getElementById("userAddress").value = addr;
                    
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("userAddress").focus();
                }
            }).open();
        });
    }
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td id="filter_name">가격대</td>
			<td id="filter_content"><input type="checkbox" name="price" value="1">10,000원 이하</td>
			<td id="filter_content"><input type="checkbox" name="price" value="2">1만원~3만원 </td>
			<td id="filter_content"><input type="checkbox" name="price" value="3">3만원~5만원 </td>
			<td id="filter_content"><input type="checkbox" name="price" value="4">5만원 이상 </td>
		</tr>
		<tr>
			<td id="filter_name">지역별</td>
			<td><input type="button" onclick="execPostCode()">지도<td>
			<td id="userAddress"></td>
		</tr>
		<tr>
			<td id="filter_name">카테고리</td>
		</tr>
	</table>
</body>
</html>