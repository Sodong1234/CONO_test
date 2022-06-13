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
<script type="text/javascript">

	function sendMsg() {
		// 방번호 샵네임 저장
		var msgList_room = document.getElementById("rNum").value;
		var shop_name = document.getElementById("sName").value;
		sendMessage(msgList_room, shop_name);
	}
//  Msg DB 저장 함수
	const sendMessage = function(msgList_room, shop_name) {
		let content = $('#msgText').val();
		alert("content: " + content + "msgList_room: " + msgList_room + "shop_name:" + shop_name);
		
		// 양쪽 공백 제거
		content = content.trim();
		
		if(content == "") {
			alert("메세지를 입력하세요");
		} else {
			$.ajax({
				url:"setSendMsg",
				method:"GET",
				data:{
					msgList_room : msgList_room,
					shop_idx : shop_idx,
					content : content
				},
				success:function(data) {
					console.log("메세지 전송 성공");
					// 메시지 입력칸 비우기
					$('#msgText').val("");
					// 메시지 내용 리로드
					MessageContentList(msgList_room, shop_name);
					// 메시지 리스트 리로드
// 					MessageList();
				},
				error : function() {
					alert('실패');
				}
			});
		}
	}

	
	
	
	// 헤더 이름 붙이기 + msg 불러오기
	const MessageContentList = function(msgList_room, shop_name) {
		$(".sname").html(shop_name);
		$.ajax({
			type:"GET",
			url:"getAllMsg",
			data: {
				msgList_room : msgList_room
			},
			success:function(data) {
				$(".msg_area").html(data);
			},
			error : function() {
				alert("불러오기 실패!");
			}
		});
	}
	function getMsgList(msgList_room, shop_name) {
		var btn = document.getElementById("msgbtn");
		var msg_form = document.getElementById("msg_form");
		document.getElementById("sName").value = shop_name;
		document.getElementById("rNum").value = msgList_room;
		btn.style.visibility = "visible";
		msg_form.style.visibility = "visible";
		
		
		
		MessageContentList(msgList_room, shop_name);
		
	}
		
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/top.jsp"/>
	</div>
	<input type="button" value="문의하기" onclick="location.href='addMessageList?item_idx=2&shop_idx=1'">
	<input type="button" value="문의하기" onclick="location.href='addMessageList?item_idx=1&shop_idx=3'">
	<br>
	<br>
	
	
	<div class="box">
	<div class="msg_container">
		<div class="msg_title">
			<h2>메세지</h2>
		</div>
		
<!-- 		room 리스트 -->
		<ul class="msg_lists">
			<c:forEach var="msgH" items="${msgList }">
				<li class="msg_item" onclick="getMsgList('${msgH.msgList_room }', '${msgH.shop_name }')">
<!-- 					room / shopname 저장 -->
					<c:set value="${msgH.msgList_room }" var="rNum"></c:set>
					<c:set value="${msgH.shop_name }" var="sName"></c:set>
					<a href="#" class="room">
						<span class="area-txt">
							<span class="Htime">${msgH.msgChat_time }</span>
							<span class="Hname">${msgH.shop_name }</span>
							<span class="Htxt">	${msgH.msgChat_content }</span>
						</span>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<section class="msg_board">
		<div class="board_head">
			<div class="prof">
				<span class="sname"></span>
			</div>
			<fieldset class="msgbtn" id="msgbtn" style="visibility: hidden">
				<button class="follwing" onclick="location.href='following'">팔로우</button>
				<button class="msg_out" onclick="location.href='msgDelete'">나가기</button>
			</fieldset>
		</div>
<!-- 		메시지 내용 -->
		<div class="msg_area">
			
		</div>
<!-- 		메시지 전송 -->
		<div class="msg_form" id="msg_form" style="visibility: hidden">
			<input type="text" id="sName">
			<input type="text" id="rNum">
			<textarea rows="3" cols="75" id="msgText"></textarea>
			<button class="btn_send" onclick="sendMsg()">버튼</button>
		</div>
	</section>	
	
	
	
	</div> 
<!-- 	box -->
	
	
	
	<div id="wrap">
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>