<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    

	<%
	//7.로그인 창이 아닌 다른 방식으로 로그인 헀을때의 대처
	//7-1. 세션 변수 조회
	String userid=(String)session.getAttribute("userid");
	if(userid==null){//세션변수에 값이 없으면
	  String message="먼저 로그인하신 후 사용 가능합니다.";
	  message=URLEncoder.encode(message, "utf-8"); 
  	  //7-2. 로그인 화면으로 이동
  	  response.sendRedirect("sessionTestForm.jsp?message="+message);
	  }
	%>