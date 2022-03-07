<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ page import="java.net.URLEncoder"%> <% //2-1. 인코더를 import %>
	<%
	//1. 쿠키 만들기
	//new Cookie("변수명", "값"); String type만 가능. 키, 값으로 받나봄
	Cookie cookie = new Cookie("id", "kim");
	Cookie cookie2 = new Cookie("pwd", "1234");

	//2. 톰캣하위 버전에서는 특수문자, 한글을 쓰면 에러가 나기 때문에 인코딩처리해야 함.
	Cookie cookie3 = new Cookie("name", "김철수");

	//2-2. 2-1번 처럼 import를 하지않을거면 아래와 같은 문장으로 처리가능함
	//Cookie cookie3=new Cookie("name", URLEncoder.encode("김철수","utf-8"));
	
	Cookie cookie4 = new Cookie("age", "20");

	//응답헤더에 쿠키 추가 : 쿠키 객체를 웹 브라우저로 보낸다.
	response.addCookie(cookie);
	response.addCookie(cookie2);
	response.addCookie(cookie3);
	response.addCookie(cookie4);

	//3. 정리 : 쿠키를 저장하기 위해서는 첫째, Cookie의 객체를 생성하고 둘째, addCookie() 메서드를 호출해야한다.
	%>
	쿠키가 생성되었습니다.
	<br>
	<a href="useCookie.jsp">쿠키 확인</a>
</body>
</html>