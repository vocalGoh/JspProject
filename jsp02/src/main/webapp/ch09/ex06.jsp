<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 코드로 날짜와 숫자를 원하는 형식으로 표현하고자 한다</title>

<%@ include file="../include/header.jsp" %>

<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<%
Date date=new Date();
out.println(date+"<br>");
%>

<!-- 날짜 표현 -->
<c:set var="date" value="<%=date%>" />
${date}<br>
<fmt:formatDate value="${date}"/> <br>
<fmt:formatDate value="${date}" type="date" /> <br>
<fmt:formatDate value="${date}" type="time" /> <br>
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" /> <br>


<!-- 숫자표현 -->
<c:set var="num" value="123456789.12" />
${num}<br>
<!-- 천단위로 끊어서 표현-->
<fmt:formatNumber value="${num}" groupingUsed="true" /><br>
<!-- 쉼표위치 조정 -->
<fmt:formatNumber value="${num}" pattern="#,####.#" /><br>
<!-- 소수점 이하의 값이 없으면 0으로 채움 -->
<fmt:formatNumber value="${num}" pattern="##,###.000"/><br>


</body>
</html>