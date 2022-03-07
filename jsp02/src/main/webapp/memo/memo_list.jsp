<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>15.메인화면의 요청을 받고 응답 결과를 보내주는 페이지</title>
<%@ include file="../include/header.jsp"%> 
<!-- 우리가 미리 만들어놨던 헤더를 걔속 사용했다ㅎㅎ 밑에 짤 참조 -->

<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<table border="1" width="500px">
		<tr>
			<th>번호</th> 
			<th>이름</th> 
			<th width="50%">메모</th> 
			<th>날짜</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr> 
				<td>${row.idx}</td> <!-- getter에서 getIdx()를 호출 -->
				<td>${row.writer}</td> 
				
				<!-- 20. 새로운 기능을 추가하려함.-->
				<!-- 사진에서 볼 수 있듯이 적힌 메모를 클릭하면 적힌 메모가 있는 새로운 화면으로 넘어가게 설정하려고 함. -->
				<!-- 일단, 새로운 가상 URL이 들어왔으니 MemoController로 이동하자.-->
				<td><a href="${path}/memo_servlet/view.do?idx=${row.idx}">${row.memo}</a></td> 
				
				<td>${row.post_date}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>