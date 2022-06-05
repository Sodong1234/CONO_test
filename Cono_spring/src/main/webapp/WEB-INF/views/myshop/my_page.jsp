<%@page import="com.itwillbs.cono.vo.ShopDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function openModifyImage() {
		window.open("my_page_image.jsp","","width=700,height=250");
	}
	function useId(id) {
		// 자식창(나)에서 부모창(나를 연 창)을 제어하려면 window.opener.xxx 형태로 제어
		// => xxx 은 원래 해당 요소에 접근하는 문법 그대로 사용
		// 1. 사용 가능한 아이디를 부모창의 아이디 입력란에 표시
		window.opener.document.fr.id.value = id;
		// 2. 부모창의 전역변수 checkIdResult 값을 true 로 변경
		window.opener.checkIdResult = true;
		// 3. 자식창 닫기
		window.close();
	}
</script>
		<%
		ShopDTO myShop = (ShopDTO)request.getAttribute("myShop");
		String[] myShopCountInfo = (String[])request.getAttribute("myShopCountInfo");
		
		
		// 상점 오픈일 가져오기
		
// 		MemberDAO mdao = new MemberDAO();
// 		MemberDTO mb = mdao.getMember();
// => MemberDAO에서 회원정보조회 메서드 가져와서 찍기
		%> 
<meta charset="UTF-8">
<title>myShop/my_page.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h1> 내 상점</h1>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../header_footer/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="ProductMyshop.shop">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="ItemReviewMng.shop">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	
	<hr>
		
		<form action="./ProductMyshopModifyPro.shop" name="shopForm" method="post" enctype="multipart/form-data">
			<!-- input type="hidden" 사용하여 글번호(board_num)와 페이지번호(page) 전달 -->
			
		
		
		<!-- 편집 누르면 상점 이름 변경 칸 생기면서 입력 가능 -->

			<table>
			
				<tr>
			<td class="td_left"><label for="member_id">상점번호</label></td>
				<td class="td_right">
			<input type="hidden" name="shop_idx" value="<%=myShop.getShop_idx() %>">
<%-- 			<input type="hidden" name="page" value="<%=request.getParameter("page")%>"> --%>
				</td>
				</tr>
			
				<tr>
					<td id="img" style="width:100px;height:100px;border:1px solid black;">
			
			상점 이미지(보이게하려고 스타일 쫌 넣어둠)
			
				</td>
				
				
				
				<tr>
					<td class="td_left"><label for="member_id">판매자이름</label></td>
					<td class="td_right">
						<input type="text" name="member_id" value="<%=myShop.getMember_id() %>"  />
					</td>
				</tr>
			
				<tr>
					<td class="td_left"><label for="shop_name">상점이름</label></td>
					<td class="td_right">
						<input type="text" name="shop_name" value="<%=myShop.getShop_name() %>"  />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_level">등급</label></td>
					<td class="td_right">
						<input type="text" name="shop_level" value="<%=myShop.getShop_level() %>" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_content">내용</label></td>
					<td class="td_right">
						<textarea id="board_content" name="shop_content" cols="40" rows="15" ><%=myShop.getShop_content() %></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="shop_img">이미지</label></td>
					<td class="td_right"><%=myShop.getShop_img() %>
					
					파일 수정 기능은 제외(파일명만 표시)(수정불가)</td>
					
				</tr>
				
				<tr>
					<td class="td_left"><label for="shop_sellNum">판매횟수<%=myShopCountInfo[0] %>번</label></td>
					
					<td class="td_right">
					
				</tr>
				
				<tr>
					<td class="td_left"><label for="shop_item">상품 갯수 <%=myShopCountInfo[1]%>개</label></td>
					
					<td class="td_right">
					
				</tr>
				
				<tr>
					<td class="td_left"><label for="follower">팔로워 x명</label></td>
					
					<td class="td_right">
					
				</tr>
				
				<tr>
					<td class="td_left"><label for="shop_openDate">상점 오픈일 xx.xx.xx</label></td>
					
					<td class="td_right">
					
				</tr>
				
				
			</table>
			</form>
			
		이미지 수정하기<input type="button" value="편집(이미지)" class="img" id="id" onclick="openModifyImage()">
		수정하기 <input type="button" value="수정" onclick="location.href='ProductMyshopModifyForm.shop'">
		취소 <input type="button" value="취소" onclick="history.back()">
	
	<button type="button" class="btn btn-warning">Warning</button>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/bottom.jsp"/>
	</div>
</body>
</html>