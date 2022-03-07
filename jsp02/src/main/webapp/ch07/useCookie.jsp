<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 받기</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%
	//4. 클라이언트에 저장된 쿠키값은 배열로 받음. 쿠키는 한개가 아니라 name, age 처럼 여러개의 데이터가 전송되기 때문
	Cookie[] cookies = request.getCookies(); //쿠키 받기
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			out.print("쿠키이름 : " + cookies[i].getName());
			out.print(",쿠키값 : " + cookies[i].getValue() + "<br>");
		}
	}
	%>
	<hr>
	<!-- 5. EL을 써서 처리 -->
	아이디 : ${cookie.id.value}
	<br> 비번 : ${cookie.pwd.value}
	<br> 이름 : ${cookie.name.value}
	<br> 나이 : ${cookie.age.value}
	<br>

	<a href="deleteCookie.jsp">쿠키 삭제</a>
	<a href="editCookie.jsp">쿠키 변경</a>
</body>
</html>