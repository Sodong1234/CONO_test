<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	$("#list_writeList").on({
		click: function() {
			$.ajax({
				type:"GET",
				url: "list_writeList.jsp",
				data: {
					
				},
				dataType: "text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		},

	});	
	$("#list_readList").on({
		click: function() {
			$.ajax({
				type:"GET",
				url: "list_readList.jsp",
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
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	<h1>나의 후기</h1>
	
	<table>
		<tr>
			<td><button id="list_writeList">구매 후기 쓰기</button></td>
			<td><button id="list_readList">내가 쓴 구매후기</button></td>
		</tr>
	</table>
	
	<div id="resultArea"></div>
	
	<div class="clear">
 		<jsp:include page="../header_footer/footer.jsp" />
	</div>
	
</body>
</html>