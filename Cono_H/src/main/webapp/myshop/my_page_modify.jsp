<%@page import="vo.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


		
		<%
		ShopDTO myShop = (ShopDTO)request.getAttribute("myShop");
		
		System.out.println(myShop);
		%> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="ProductMyshopModifyPro.shop" name="shopForm" method="post" >
			<!-- input type="hidden" 사용하여 글번호(board_num)와 페이지번호(page) 전달 -->
			<input type="hidden" name="shop_idx" value="<%=myShop.getShop_idx() %>">
<%-- 			<input type="hidden" name="page" value="<%=request.getParameter("page")%>"> --%>
			<table>
			
				<tr>
					<td id="img" style="width:100px;height:100px;border:1px solid black;">
			
			상점 이미지(보이게하려고 스타일 쫌 넣어둠)
			
				</td>
				</tr>
				
		
			
				<tr>
					<td class="td_left"><label for="member_id">판매자이름</label></td>
					<td class="td_right">
						<input type="text" name="member_id" value="<%=myShop.getMember_id() %>"  />
					</td>
				</tr>

					<tr>
					<td class="td_left"><label for="member_pass">비밀번호</label></td>
					<td class="td_right">
						<input type="password" name="member_pass" required="required" />
					</td>
				
				
				</tr>
			
				<tr>
					<td class="td_left"><label for="shop_name">상점이름</label></td>
					<td class="td_right">
						<input type="text" name="shop_name" value="<%=myShop.getShop_name() %>"  />
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td class="td_left"><label for="shop_level">등급</label></td> -->
<!-- 					<td class="td_right"> -->
<%-- 						<input type="text" name="shop_level" value="<%=myShop.getShop_level() %>" /> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
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
					
					
				<tr>
				
					<td colspan="2">
					
					<input type="submit" value="수정"> 
					
					</td>
											
						
				</tr>
			
					
					
					
					
				
			</table>
</form>

</body>
</html>