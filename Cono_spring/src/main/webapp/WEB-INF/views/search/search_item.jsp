<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 1. 스크롤 이벤트 최초 발생
	var lastScrollTop = 0;
	$(window).scroll(function(){
		var currentScrollTop = $(window).scrollTop();
		
		if(currentScrollTop - lastScrollTop > 0) {
			lastScrollTop = currentScrollTop;
		} else {
			lastScrollTop = currentScrollTop;
		}
		// 2. 현재 스크롤의 위치가 화면의 보이는 위치보다 크면
		if($(window.scrollTop() >= $(document).height() - $(window).height()){
			// 3. ajax 로 서버에 게시물 데이터 요청
			// 3. class 가 스크롤 마지막인 요소를 선택한 다음 그것의 속성 값을 받아온다.
			var lastitem_idx = $(".scrolling:last").attr("data-item_idx");
			$.ajax({
				type:'post',
				url:'',
				dataType : 'json',
				data : JSON.stringify({
					item_idx : lastitem_idx
				}),
				success : function(data) {
					var str = "";
					if(data != "") {
						$(data).each(
						function() {
							console.log(this);
							str += "<tr class =" + "'listToChange'" + ">"
								+		"<td class= " + "'scrolling'" + " data-idx='" + this.item_idx + "'>"
								+ 			this.item_idx
								+		"</td>"
								+		"<td>" + this.img_real_name + "</td>"
								+		"<td>" + this.item_title + "</td>"
								+		"<td>" + this.item_region + "</td>"
								+		"<td>" + this.item_price + "</td>"
								+		"<td>" + this.item_date + "</td>"
								+  "</tr>"
						});
						$(".listToChange").empty();
						$(".scrollLocation").after(str);
					}
					else {
						alert("불러올 데이터가 없습니다.");
					}
				}
				
			});		
			
		})
	});
	
	
</script>
</head>
<body>
	<h1>${searchText } 검색</h1>
	<c:forEach var="card" items="${cardList }">
		<div>
			<table border="1">
				<tr>
					<td class="scrolling" data-item_idx="${card.item_idx }">${card.item_idx }</td>
					<td>${card.img_real_name }</td>
					<td>${card.item_title }</td>
					<td>${card.item_region }</td>
					<td>${card.item_price }</td>	
					<td>${card.item_date }</td>		
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>