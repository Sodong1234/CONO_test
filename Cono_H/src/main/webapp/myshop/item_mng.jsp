<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("sId") == null) {
	response.sendRedirect("MemberLogin.func");
}
ArrayList<String[]> itemList = (ArrayList<String[]>)request.getAttribute("itemList");

String keyword = request.getParameter("keyword");
String sell_status = request.getParameter("sell_status");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_mng.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.js"></script>
<link rel="styleSheet" type="text/css" href="./myshop/myshop.css">
</head>
<body>
	<div>
		<!-- 상단 부분 -->
			<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<div class="container">
		<div class="row bg-primary" id="nav_row">
			<div class="col"><a href="my_page.jsp">내 상점</a></div>
			<div class="col"><a href="ItemUploadForm.shop">상품 등록</a></div>
			<div class="col"><a class="text-danger" href="ItemMng.shop">상품 관리</a></div>
			<div class="col"><a href="item_review_mng.jsp">상품 후기 관리</a></div>
			<div class="col"><a href="item_order_mng.jsp">상품 주문 관리</a></div>
			<div class="col"><a href="follow_shop.jsp">팔로우 상점</a></div>
		</div>
	
		<div class="row" id="search_row">
			<form action="ItemMng.shop" class="input-group">
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>>
				<select class="form-select"  name="sell_status">
					<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>전체</option>
					<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 중</option>
					<option value="2" <%if(sell_status != null && sell_status.equals("2")) { %> selected="selected" <%} %>>판매 완료</option>
				</select>
				<input type="submit" class="btn btn-outline-primary" id="search" value="검색">
			</form>
			
	<!-- 		<form action="ItemMng.shop" class="input-group"> -->
	<!-- 			<div class="col"> -->
	<%-- 				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>> --%>
	<!-- 			</div> -->
	<!-- 			<div class="col"> -->
	<!-- 				<select class="form-select" name="sell_status"> -->
	<%-- 					<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>전체</option> --%>
	<%-- 					<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 중</option> --%>
	<%-- 					<option value="2" <%if(sell_status != null && sell_status.equals("2")) { %> selected="selected" <%} %>>판매 완료</option> --%>
	<!-- 				</select> -->
	<!-- 			</div> -->
	<!-- 			<div class="col"> -->
	<!-- 				<input type="submit" class="btn btn-outline-secondary" id="search" value="검색"> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-6"></div> -->
	<!-- 		</form> -->
		</div>
<!-- 		<form action="ItemMng.shop"> -->
<%-- 			<input type="text" name="keyword" id="keyword" placeholder="상품명 입력" <%if(keyword != null) { %> value="<%=keyword%>" <%} %>> --%>
<!-- 			<select name="sell_status"> -->
<%-- 				<option value="0" <%if(sell_status != null && sell_status.equals("0")) { %> selected="selected" <%} %>>전체</option> --%>
<%-- 				<option value="1" <%if(sell_status != null && sell_status.equals("1")) { %> selected="selected" <%} %>>판매 중</option> --%>
<%-- 				<option value="2" <%if(sell_status != null && sell_status.equals("2")) { %> selected="selected" <%} %>>판매 완료</option> --%>
<!-- 			</select> -->
<!-- 			<input type="submit" id="search" value="검색"> -->
<!-- 		</form> -->
		<div class="row" id="list_row">
			<table class="table table-hover" style="border:1px 0;border-color:bg-primary;">
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>가격</th>
					<th>상품 등록일</th>
					<th>판매 상태</th>
					<th>찜</th>
					<th>조회수</th>
					<th>숨김</th>
				</tr>
				<!--수정이 가능한 (판매자가 보는) 상품 상세 페이지로 이동 -->
				<%
				for(int i = 0; i < itemList.size(); i++){
					 String[] item = itemList.get(i);
				%>
						<tr>
							<td><%=item[0] %></td>
							<td onclick="location.href='ItemDetail.shop?item_idx=<%=item[0] %>'"><%=item[1] %></td>
							<td><%=item[2] %></td>
							<td><%=item[3] %></td>
							<td><%=item[4] %></td>
							<td><%=item[5] %></td>
							<td><%=item[6] %></td>
							<td><input type="checkbox" name="item_hide" class="item_hide" <%if(item[7].equals("Y")) { %> checked="checked" <%} %> 
							     onchange="location.href='ItemHide.shop?item_idx=<%=item[0]%>&item_hide=<%=item[7]%>'"></td>
							     <!-- 숨기겠냐, 살리겠냐 물어봐야하는데 애매해서 일단 패스 -->
						</tr>
				<%} %>
			</table>
		</div>
	</div>
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>