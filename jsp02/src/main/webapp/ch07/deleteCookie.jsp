<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%
	//참조 : 쿠키삭제 법)
	//쿠키를 클라이언트에게 보내기 전에 쿠키의 생존기간을 지정.
	//cookie.setMaxAge(초단위);
	//cookie.setMaxAge(0); 즉시 지워라
	//cookie.setMaxAge(-1); 브라우저를 종료할때 쿠키를 지워라
		
	//6-1. 전체 쿠키 삭제
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			//쿠키의 유효시간을 0으로 설정하여 만료시킨다.
			cookies[i].setMaxAge(0);
			
			//응답헤더에 쿠키 추가 : 쿠키 객체를 웹 브라우저로 보낸다.
			response.addCookie(cookies[i]);
		}
	}


/* 	//6-2. 참조 : 특정 쿠키만 삭제 : 삭제함수가 없어서 이런 방식을 취해야 함
	Cookie cookie = new Cookie("id","");//우선 value를 ""로 처리
	cookie.setMaxAge(0);//시간 세팅
	response.addCookie(cookie);//함수처리  */
	
	%>
	쿠키가 삭제되었습니다.
	<a href="useCookie.jsp">쿠키 확인</a>



</body>
</html>