<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>

<article>
			<h1>Qna Write</h1>
			<form action="" method="post">
				<table id="notice">
					<tr>
						<td>
					
					<select name="classify">
						<option value="name">에러문의</option>
						<option value="name">사용문의</option>
						<option value="name">등등등등</option>
					</select>
					</td>
					</tr>
					<tr>
						<td>작성자 구매자 판매자~~~ 아이디를 따온다</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content" required="required"></textarea></td>
					</tr>

				</table>

				<div id="table_search">
					<input type="submit" value="글쓰기" class="btn">
				</div>
			</form>
			<div class="clear"></div>
		</article>
		
	<div>
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>