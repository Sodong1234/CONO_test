<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link href="${path}/resources/css/msg.css" rel="stylesheet" />
</head>
<body>
	<c:forEach var="msg" items="${Allmsg}" >
		<c:choose>
			<c:when test="${msg.msgChat_send eq sessionScope.shop_idx}">
				<div class="sendBox">
					<span class="sendMsg">${msg.msgChat_content } </span><span class="stime">${msg.msgChat_time}</span>
				</div>
			</c:when>
			<c:otherwise>
					<div class='recvNick'>${member_nick}</div>
				<div></div>
				<div class="recvBox" style="height:  60px; margin-top: -15px;">
					<span class="recvMsg">${msg.msgChat_content }</span><span class="rtime">${msg.msgChat_time}</span>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</body>
</html>