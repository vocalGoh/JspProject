<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>"코드"에서 세션값(세션시간)을 컨트롤하고 싶다</title>

<!-- 
원래 세션의 유효시간은 30분이 주어짐. 
예를 들어 한 웹페이지에 로그인 해놓고 아무짓도 안하면 자동 로그아웃 되어있지 않음? 
근데 이걸 40분으로 늘리고나 20분으로 줄이고 싶은거임. 
-->

</head>
<body>
	<h2>1. 세션의 유효 시간</h2>
	<%
	session.setMaxInactiveInterval(1200); //1200초(20분)으로 변경
	int timeout =session.getMaxInactiveInterval();
	out.println("세션의 유효시간:" + timeout);
	%>
	
	<!--2. 참고 : 아래는 web.xml로 위 작업을 실행한 예시다. -->
</body>
</html>

