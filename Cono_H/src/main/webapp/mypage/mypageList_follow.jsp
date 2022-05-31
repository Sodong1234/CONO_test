<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#fer").on({
			click: function() {
				$.ajax({
					type: "POST",
					url: "MypageFollowerList.mypage",
					data: {"sId" : <%=sId%>},
					dataType: "text",
					success:function(msg) {
						$("#resultArea").html(msg);
					}
				});
			}
		});
		$("#fing").on({
			click: function() {
				$.ajax({
					type: "POST",
					data: {"sId" : <%=sId%>},
					dataType: "text",
					url: "MypageFollowingList.mypage",
					success:function(msg) {
						$("#resultArea").html(msg);
					}
				});
			}
		});
	});
</script>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<section>
		<h1>팔로잉&팔로워</h1>
	</section>
	<section>
		<table>
			<tr><td><input type="button" id="fing" value="팔로잉"></td><td><input type="button" id="fer" value="팔로워"></td></tr>
		</table>	
	</section>
	<section>
		<div id="resultArea"></div>
	</section>
	
	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>

</body>
</html>