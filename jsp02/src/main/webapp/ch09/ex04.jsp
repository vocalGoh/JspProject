<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL코드를 이용한 구구단</title>

<%@ include file="../include/header.jsp" %>
<!-- 1. 이전에 만들어놓은 header파일 영입 -->

<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<!--1. 구구단에 for문이 두개 들어갔던거 기억하지? 이번엔 JSTL for문 들어간다~ -->
<c:forEach var="i" begin="${param.start}" end="${param.end}" varStatus="status">
 
<!-- 여기서 status는 밑에 반복횟수의 status임 -->
 	<h2>${i}단</h2>
 	<h3>반복횟수 : ${status.count}</h3>
 
 	<c:forEach var="j" begin="1" end="9">
  		${i} x ${j} = ${i * j} <br>
 	</c:forEach>
</c:forEach>

</body>
</html>