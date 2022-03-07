<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테이블 처리와 페이지 나누기</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<!-- 1. 첫번째 방법 -->
	<table>
		<tr> <td>번호</td> <td>이름</td> <td>나이</td> <td>주소</td> <td>전화번호</td> </tr>
		<tr> <td>1</td> <td>kim</td> <td>20</td> <td>서울시</td> <td>010-1111-5555</td> </tr>
		<tr> <td>2</td> <td>park</td> <td>30</td> <td>인천시</td> <td>010-2222-5555</td> </tr>
		<tr> <td>3</td> <td>lee</td> <td>40</td> <td>경기도</td> <td>010-5555-5555</td> </tr>
	</table>

	<br>

	<!-- 2. 두번째 방법 -->
	<table class="table">
		<tr> <td>번호</td> <td>이름</td> <td>나이</td> <td>주소</td> <td>전화번호</td> </tr>
		<tr> <td>1</td> <td>kim</td> <td>20</td> <td>서울시</td> <td>010-1111-5555</td> </tr>
		<tr> <td>2</td> <td>park</td> <td>30</td> <td>인천시</td> <td>010-2222-5555</td> </tr>
		<tr> <td>3</td> <td>lee</td> <td>40</td> <td>경기도</td> <td>010-5555-5555</td> </tr>

	</table>

	<br>
	
	<!-- 3. 세번째 방법 -->
	<div class="container">
		<table class="table table-hover">
		<tr> <td>번호</td> <td>이름</td> <td>나이</td> <td>주소</td> <td>전화번호</td> </tr>
		<tr> <td>1</td> <td>kim</td> <td>20</td> <td>서울시</td> <td>010-1111-5555</td> </tr>
		<tr> <td>2</td> <td>park</td> <td>30</td> <td>인천시</td> <td>010-2222-5555</td> </tr>
		<tr> <td>3</td> <td>lee</td> <td>40</td> <td>경기도</td> <td>010-5555-5555</td> </tr>
		</table>
	</div>

	<br>
	<hr>
	
	<!-- 4. 페이지 네비게이션(페이지네이션) -->
	<div class="container">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<!-- tabindex="시작번호" 키보드의 Tab키를 누르면 다음요소로 이동됨 "-1"을 쓰면 tab시 해당요소를 건너뜀--> 
   					<a class="page-link" href="#" tabindex="-1" aria-disabled="true"> Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>