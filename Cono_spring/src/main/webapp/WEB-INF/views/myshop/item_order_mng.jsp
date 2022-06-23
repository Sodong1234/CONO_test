<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_order_mng.jsp</title>
<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

table {
	text-align: center;
	/*  width: 70%;  */
	margin: auto; 
	margin-top: 17px;
}
  
h3 {
	text-align: center;
	/*  width: 70%;  */
	margin: auto;
}
.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
}

/*  paging  */
 .paging  {  
 	margin-top: 70px;  
  	text-align: center;   
 	margin-right: 27px;
 	margin-bottom: 50px;
 }  


 .paging input:not(.btn){ 
   width: 30px;  
  	height: 30px;   
  	background-repeat:no-repeat; 
  	border-radius:80px;  
  	border-style: none;  
   overflow: hidden;   
   font-size: 13px;
   font-weight: bold;
 } 
 
 .paging input:not(.btn):hover{
 	background-color: #999;
 } 
 
 .paging a:hover{
 	text-decoration: underline;
 }
 
/* 탭 */

.tab {
/*   width: 100%; */
  height: 50px;
  margin-right: 230px;
  margin-left: 370px;
}

.tablinks {
  float: left;
  width: 50%;
  height: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  font-weight: bold;
  color: black;
  background-color: #e8e8e8;
}

.tablinks.active {
  color: black;
  background-color: #a6a6a6;
}

.tabBox {
	margin-top: 11px;
	padding-bottom: 70px;
}

hr.hr-13 {
  height: 10px;
  border: 0;
  box-shadow: 0 10px 10px -10px #8c8c8c inset;
  width: 68.8%;
  margin-left: 370px;
}

@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Cafe24Ohsquare';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Cafe24Ohsquare.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{
  font-family: 'IBMPlexSansKR-Regular';
}
</style>
<script type="text/javascript">	
	function openTab(evt, tabName) {
	      var i, tabcontent, tablinks;
	      tabcontent = document.getElementsByClassName("tabcontent");
	      for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	      }
	      tablinks = document.getElementsByClassName("tablinks");
	      for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	      }
	      document.getElementById(tabName).style.display = "block";
	      evt.currentTarget.className += " active";
	}
</script>
</head>
<body>
	<!-- 상단 부분 -->
	<div>
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	<!-- 사이드바 -->
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
	
		
	<!-- 
	판매 중('0')
	구매 진행 중 ('1') : ord 테이블 insert할 때
	구매 완료 ('2') : ord 테이블 delete할 때
	예약 중('3')
	 -->
	<div class="cono" style="margin-top: 25px;">
		<h2 style="font-family: Cafe24Ohsquare; margin-left:370px;">상품 주문 관리</h2>

		<hr class="hr-13">
	
	<div class="allTab">
		<div class="tab">
			<button class="tablinks active" onclick="openTab(event, 'tab1')">구매진행</button>
			<button class="tablinks" onclick="openTab(event, 'tab2')">구매완료</button>
		</div>
		<!-- 탭 1 -->
		<div class="tabBox">
			<div id="tab1" class="tabcontent" style="display: block;">
				<h3 style="font-family: 'IBMPlexSansKR-Regular';">구매 진행중 ▼</h3>
					<table class="table table-hover" style="border:1px 0; border-color:bg-primary; width: 1090px;">
					    <tr>
					      <th scope="col">주문일시</th>
					      <th scope="col">주문상품</th>
					      <th scope="col">주문수량</th>
					      <th scope="col">주문한 사람</th>
					      <th scope="col">가격</th>
					      <th scope="col">주문 요청사항</th>
					    </tr>
					  <tbody>
					  <c:forEach items="${ordList }" var="ord">
						 <tr class="table-primary">
					<!--       <th scope="row">Primary</th> -->
					      <td>${ord.get('ord_date') }</td>
					      <td onclick="location.href='ItemDetail.shop?item_idx=${item.get('item_idx') }'"${item.get("item_title") }>${ord.get('item_title') }</td>
					      <td>${ord.get('ord_quantity') }</td>
					      <td>${ord.get('member_id') }</td>
<%-- 					      <td>${ord.get('item_price') }</td> --%>
 <td><fmt:formatNumber value="${ord.get('item_price') }" pattern="\#,###.##"/></td>
					      <td>${ord.get('ord_reqContent') }</td>
					    </tr>
					    </c:forEach>
					   </tbody>
					</table>
			
			<!-- 구매 진행중 페이징 처리 -->
				<div class ="paging">
					<c:choose>
						<c:when test="${pageInfo.pageNum > 1 }">
							<input type="button" value=" < " onclick="location.href='ItemOrdMng.shop?pageNum=${pageInfo.pageNum - 1 }'">
						</c:when>
						<c:otherwise>
							<input type="button" value=" < ">
						</c:otherwise>
					</c:choose>
			
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
						<c:when test="${pageInfo.pageNum eq i }">
							${i }
						</c:when>
						<c:otherwise>
							<a href="ItemOrdMng.shop?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.pageNum < pageInfo.maxPage }">
							<input type="button" value=" > " onclick="location.href='ItemOrdMng.shop?pageNum=${pageInfo.pageNum + 1 }'">
						</c:when>
						<c:otherwise>
							<input type="button" value=" > ">
						</c:otherwise>
					</c:choose>
				</div>
			</div>	<!-- 탭 1 -->
			
			<!-- 탭 2 -->
			<div id="tab2" class="tabcontent" style="display: none;">
				<h3 style="font-family: 'IBMPlexSansKR-Regular';">구매 완료 ▼</h3>
					<table class="table table-hover" style="border:1px 0;border-color:bg-primary; width: 1080px;">
						<tr>
							<th scope="col">주문일시</th>
							<th scope="col">주문상품</th>
							<!--  <th scope="col">주문수량</th> -->
							<th scope="col">주문한 사람</th>
							<th scope="col">가격</th>
							<th scope="col">주문 요청사항</th>
						</tr>
						<tbody>
							<c:forEach items="${finishOrdList }" var="ord">
								<tr class="table-primary">
									<!--  <th scope="row">Primary</th> -->
									<td>${ord.get('ord_date') }</td>
									<td>${ord.get('item_title') }</td>
									<%--   <td>${ord.get('ord_quantity') }</td> --%>
									<td>${ord.get('member_id') }</td>
<%-- 									<td>${ord.get('item_price') }</td> --%>
				<td><fmt:formatNumber value="${ord.get('item_price') }" pattern="#,###.##"/></td>
									<td>${ord.get('ord_reqContent') }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			    
			<!-- 구매 완료 페이징 처리 -->
<!-- 				<div class ="paging"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${finPageInfo.pageNum > 1 }"> --%>
<%-- 							<input type="button" value=" < " onclick="location.href='ItemOrdMng.shop?pageNum=${finPageInfo.pageNum - 1 }'"> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<input type="button" value=" < "> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
			
<%-- 					<c:forEach var="i" begin="${finPageInfo.startPage }" end="${finPageInfo.endPage }"> --%>
<%-- 						<c:choose> --%>
<%-- 						<c:when test="${finPageInfo.pageNum eq i }"> --%>
<%-- 							${i } --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<a href="ItemOrdMng.shop?pageNum=${i }">${i }</a> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 					</c:forEach> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${finPageInfo.pageNum < finPageInfo.maxPage }"> --%>
<%-- 							<input type="button" value=" > " onclick="location.href='ItemOrdMng.shop?pageNum=${finPageInfo.pageNum + 1 }'"> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<input type="button" value=" > "> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				</div> -->
			</div>	<!-- 탭 2 -->
		</div>	<!-- 탭1,2 -->
	</div> <!-- allTab -->
	</div>
	
	


	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>