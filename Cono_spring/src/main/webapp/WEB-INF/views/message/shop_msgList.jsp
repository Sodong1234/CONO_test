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

<script type="text/javascript">
	// 헤더 클릭시 - 성공
	function getMsgList(msgList_room, member_id, member_nick, img_name, item_title) {
		var btn = document.getElementById("msgbtn");
		var msg_form = document.getElementById("msg_form");
		
		document.getElementById("mname").value = member_nick;
		document.getElementById("prof_imName").src = "resources/upload/file/" + img_name;
		document.getElementById("itTitle").value = item_title;
		
		btn.style.visibility = "visible";
		msg_form.style.visibility = "visible";
		
		
		
		MessageContentList(msgList_room, member_id, member_nick, img_name, item_title);
		
	}
	
	//헤더 이름 붙이기 + msg 불러오기 - 성공
	const MessageContentList = function(msgList_room, member_id, member_nick, img_name, item_title) {
		$(".mname").html(member_nick);
		$(".itTitle").html(item_title);
		
		$.ajax({
			type:"GET",
			// 샵 메시지 전체 가져오기
			url:"shop_getAllMsg",
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
	
	// 메시지 보내기
	function sendMsg() {
			// 방번호 샵네임 저장
			var msgList_room = document.getElementById("rNum").value;
			var member_id	 = document.getElementById("mId").value;
			sendMessage(msgList_room, member_id);
		}
	//  Msg DB 저장 함수
		const sendMessage = function(msgList_room, member_id) {
			let content = $('#msgText').val();
	// 		alert("content: " + content + "msgList_room: " + msgList_room + "shop_name:" + shop_name);
			
			// 양쪽 공백 제거
			content = content.trim();
			
			if(content == "") {
				alert("메세지를 입력하세요");
			} else {
				$.ajax({
					url:"shop_setSendMsg",
					method:"GET",
					data:{
						msgList_room : msgList_room,
						member_id : member_id,
						content : content
					},
					success:function(data) {
	// 					console.log("메세지 전송 성공");
						// 메시지 입력칸 비우기
						$('#msgText').val("");
						// 메시지 내용 리로드
						MessageContentList(msgList_room, member_id);
						// 메시지 리스트 리로드
	// 					MessageList();
					},
					error : function() {
	// 					alert('전송완료 후 실패');
						MessageContentList(msgList_room, member_id);
						$('#msgText').val("");
					}
				});
			}
		}

</script>


</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	
	<div class="box">
	<div class="msg_container" style="margin-top: 0%; background-color:#FFF0F5;" >
		<div class="msg_title">
			<h2 style="font-family: Cafe24Ohsquare;">코노톡 * 판매 문의</h2>
		</div>
		
<!-- 		room 리스트 -->
		<ul class="circle" >
			<c:forEach var="msgH" items="${msgList }">
				<li class="msg_item" onclick="getMsgList('${msgH.msgList_room }', '${msgH.member_id }','${msgH.member_nick }','${msgH.img_name }','${msgH.item_title }')" style="background-color: #FFC0CB;">
<!-- 					room / shopname 저장  -->
					<c:set value="${msgH.msgList_room }" var="rNum"></c:set>
					<c:set value="${msgH.member_id }" var="mId"></c:set>
					<a href="#" class="room">
						<span class="area-txt">
							<span class="Htime" style="left: 185px; top: 0px;">${msgH.msgChat_time }</span>
							<span class="Hname" style="right: 111px;">${msgH.member_nick }</span>
							<span class="Htxt" style="margin-top: 5px;">${msgH.msgChat_content }</span>
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

	<section class="msg_board" style="background-color: #FFC0CB;">
		<div class="board_head">
			<fieldset class="msgbtn" id="msgbtn">
			<div class="prof">
				<span class="mname" id="mname" ></span> &nbsp;&nbsp;&nbsp;
				<span class="itTitle" id="itTitle" style="margin-left: 10px;"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src='' class="prof_imName" id="prof_imName" style="margin-top:0px; "></img> &nbsp;&nbsp;&nbsp;
				<button class="btn btn-primary2 btn-ghost btn-close" onclick="location.href='msgDelete()'">나가기</button>
			</div>
			</fieldset>
		</div>
<!-- 		메시지 내용 -->
		<div class="msg_area" style="background-color: #FFE4E1;	">
			
		</div>
<!-- 		메시지 전송 -->
		<div class="msg_form" id="msg_form" style="visibility: hidden; margin-top:20px;  ">
			<textarea rows="3" cols="75" id="msgText"></textarea> &nbsp;&nbsp;
			<button class="btn btn-primary2 btn-ghost btn-through" onclick="sendMsg()">버튼</button>
		</div>
	</section>	
	
	
	
	</div> 
	
	
	
	<div id="wrap">
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>