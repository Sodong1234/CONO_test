<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#follower_list tr {
	background: #e1f3f0;
 	height: 20px; 
 	vertical-align: middle;
}
#follower_list tr td {
	padding: 15px;
	height: 10px;
}
#follower_list tr {
	vertical-align: middle;
}


</style>
</head>
<body>
	<div id="item_follower_list">
		<table id="follower_list" style="width: 100%;">
			<c:forEach items="${followerList }" var="follower">
				<tr>
					<td width="100px">${follower.get('shop_idx') }</td>
					<td width="300px">${follower.get('shop_img') }</td>
					<td width="100px">${follower.get('shop_name') }</td>
					<td>${follower.get('shop_content') }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>