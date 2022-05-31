<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	$("#review_writeList").on({
		click: function() {
			$.ajax({
				type:"GET",
				url: "mypage_review_writeList.jsp",
				data: {
					
				},
				dataType: "text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		},

	});	
	$("#review_readList").on({
		click: function() {
			$.ajax({
				type:"GET",
				url: "mypage_review_readList.jsp",
				data: {
					
				},
				dataType: "text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		},

	});	
});




</script>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<h1>나의 후기</h1>
	
	<table>
		<tr>
			<td><button id="review_writeList">구매 후기 쓰기</button></td>
			<td><button id="review_readList">내가 쓴 구매후기</button></td>
		</tr>
	</table>
	
	<div id="resultArea"></div>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>
	
</body>
</html>