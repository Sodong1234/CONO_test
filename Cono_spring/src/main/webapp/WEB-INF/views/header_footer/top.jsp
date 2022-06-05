<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String sId = (String)session.getAttribute("sId");
%>
<script type="text/javascript">
	// 
	function userCenterList() {
		let userCenterList = document.getElementById("userCenterList");
		userCenterList.style.visibility = "visible";
	}
	// 로그아웃
	function confirmLogout() {
		if(confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout";
		}
	}
</script>
<!-- 			<nav > -->
				
<!-- 			</nav> -->
<!-- 			<div class="intro_bg"> -->
<!--                 <div class="header" id="link_header"> -->
<!--                     <ul class="nav1"> -->
<!--                         <li><a href="">CONO</a></li> -->
<!--                         <li><a href="">홈</a></li> -->
<!--                     </ul> -->
<!--                     <div class="search_area"> -->
<!--                         <form>  input 타입은 form 으로 감싸~ -->
<!--                             <input type="search" placeholder="search"> -->
<!--                             <span>검색</span> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                     <ul class="nav2"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${sId == null}"> --%>
<!-- 								 <li><a href="MemberHowJoin.func">회원가입</a></li> -->
<!-- 		                         <li><a href="MemberLogin.func">로그인</a></li> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 		                     	 <li><a href="MypagePass.mypage"><c:out value="${sId }님"/></a></li> --%>
<!-- 	 							 <li><a href="">알림</a></li> -->
<!-- 	 							 <li><a href="">메시지</a></li> -->
<!-- 	 							 <li><a href="">고객센터</a></li>   -->
<%-- 	                    	</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!--                     </ul> -->
<!--                 </div> -->
<!--             </div> -->
            
            
            
<header>
	<span id="login">
		<span id=""><a href = "home"> 홈 </a>-------</span>
		<%if(sId == null) { %>
			<a href="joinHow">회원가입</a> | 
			<a href="MemberLogin.func">로그인</a> | 
		<%} else { %>
			<a href="mypage"><%=sId %>님</a>
			<a href="../mypage/mypageList_alarm.jsp">알림</a> | 
			<a href="../mypage/mypageList_dm.jsp">메세지</a> | 
			<input type="button" value="판매자 전용 마이페이지" onclick="location.href='ProductMyshop.shop'">
			<input type="button" value="관리자 전용 마이페이지" onclick="location.href='./admin_center/main.jsp'">
			<!-- 			==============================양윤석============================= -->
			<a href="javascript:void(0)" onclick="confirmLogout()">로그아웃</a>
<!-- 			==============================양윤석============================= -->
		<%}%>
		<button id="userCenter" onclick="userCenterList()">고객센터</button>
		<span id="userCenterList"  style="visibility: hidden">
			<a href="../only_member/user_notice_list.jsp">공지사항</a>
			<a href="../only_member/user_chat_bot.jsp">문의하기</a>
			<a href="../only_member/user_report_write.jsp">신고하기</a>
		</span>
		
		
		
	</span>
	<nav id="top_menu">
		<ul>
			<li><a href="../search/hot.jsp">실시간 인기상품</a></li>
		</ul>
	</nav>
</header>