<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link href="${path}/resources/css/message_list.css" rel="stylesheet"/>
<script type="text/javascript">
	$(function() {
		$ajax({
			type:"GET",
			url:"msg_content_list",
			data:{
				
			},
			success:function(data)
		});
	});
</script>
</head>
</html>