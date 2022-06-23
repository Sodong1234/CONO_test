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
<link href="${path}/resources/sass/msgbtn.scss" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modifyButton.css">
<script type="text/javascript">

	function msgDelete() {
		var msgList_room = document.getElementById("rNum").value;
		alert("방번호 : " + msgList_room);
		location.href="msgDelete?msgList_room=" + msgList_room;
	}
	

	function sendMsg() {
		// 방번호 샵네임 저장
		var msgList_room = document.getElementById("rNum").value;
		var shop_idx	 = document.getElementById("sNum").value;
		sendMessage(msgList_room, shop_idx);
	}
//  Msg DB 저장 함수
	const sendMessage = function(msgList_room, shop_idx) {
		let content = $('#msgText').val();
// 		alert("content: " + content + "msgList_room: " + msgList_room + "shop_name:" + shop_name);
		
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
// 					console.log("메세지 전송 성공");
					// 메시지 입력칸 비우기
					$('#msgText').val("");
					// 메시지 내용 리로드
					MessageContentList(msgList_room, shop_idx);
					// 메시지 리스트 리로드
// 					MessageList();
				},
				error : function() {
// 					alert('전송완료 후 실패');
					MessageContentList(msgList_room, shop_idx);
					$('#msgText').val("");
				}
			});
		}
	}

	
	
	
	// 헤더 이름 붙이기 + msg 불러오기
	const MessageContentList = function(msgList_room, shop_idx, shop_name, img_name, item_title) {
		
		$(".sname").html(shop_name);
		$(".itTitle").html(item_title);
		
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
	// 헤더 클릭시 내용 호출을 위한 함수
	function getMsgList(msgList_room, shop_idx, shop_name, img_name, item_title) {
		var btn = document.getElementById("msgbtn");
		var msg_form = document.getElementById("msg_form");
		
		document.getElementById("sname").value = shop_name;
		document.getElementById("prof_imName").src = "resources/upload/file/" + img_name;
		document.getElementById("itTitle").value = item_title;
		
		btn.style.visibility = "visible";
		msg_form.style.visibility = "visible";
		
		
		// 내용 호출
		MessageContentList(msgList_room, shop_idx, shop_name, img_name, item_title);
		
	}
		
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	<br>
	<br>
	
	<input type="button" value="내 상점 메시지" onclick="location.href='shop_msgList'">
	<div class="box">
	<div class="msg_container">
		<div class="msg_title">
			<h2 style="font-family: Cafe24Ohsquare;">코노톡 * 구매 문의</h2>
		</div>
		
<!-- 		room 리스트 -->
		<ul class="circle">
			<c:forEach var="msgH" items="${msgList }">
				<li class="msg_item" onclick="getMsgList('${msgH.msgList_room }', '${msgH.shop_idx }', '${msgH.shop_name }','${msgH.img_name }','${msgH.item_title }')">
<!-- 					room / shopname 저장 -->
					<c:set value="${msgH.shop_name }" var="sName"></c:set>
					<c:set value="${msgH.img_name }" var="imName"></c:set>
					<c:set value="${msgH.item_title }" var="itTitle"></c:set>
					<a href="#" class="room">
						<span class="area-txt">
							<span class="Hname">${msgH.shop_name }</span><br>
							<span class="Htime">${msgH.msgChat_time }</span>
						    <span class="Htxt">${msgH.msgChat_content }</span><br>
						</span>
					</a>
				</li>
			</c:forEach>
		</ul>
		</div>
<!-- 		<ul class="msg_lists"> -->
<!--   <li>lorem ipsum</li> -->
<!--   <li>lorem ipsum</li> -->
<!--   <li>lorem ipsum</li> -->
<!--   <li>lorem ipsum</li> -->
<!--   <li>lorem ipsum</li> -->
<!-- </ul> -->

	
	<section class="msg_board">
		<div class="board_head">
			<fieldset class="msgbtn" id="msgbtn" >
			<div class="prof">
				<span class="sname" id="sname"></span> <br>
				<span class="itTitle" id="itTitle"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src='' class="prof_imName" id="prof_imName"></img>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="follwing" onclick="location.href='following'">팔로우</button> 
				<button class="msg_out" onclick="msgDelete()">나가기</button>
			</div>
			</fieldset>
		</div>
<!-- 		메시지 내용 -->
		<div class="msg_area">
			
		</div>
<!-- 		메시지 전송 -->
		<div class="msg_form" id="msg_form" style="visibility: hidden">
			<input type="text" id="sNum">
			<input type="text" id="rNum">
			<textarea rows="3" cols="75" id="msgText"></textarea>
			<button class="btn_send" onclick="sendMsg()">버튼</button>
		</div>
	</section>	
	
	
	
	</div> 
<!-- 	box -->
	
	
	
	<div id="wrap">
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>