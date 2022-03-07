<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL의 숫자처리와 문자처리</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- 1. value="숫자처리" -->
<!-- 1-1. scope를 통해 다양한 처리영역을 표현해 보자 -->
<c:set var="num" value="<%=new Integer(100) %>" scope="page" />

<!-- 2. value="문자" -->
<c:set var="num" value="200" scope="request" />
<c:set var="num" value="300" scope="session" />
<c:set var="num" value="400" scope="application" />


<!-- 3. JSTL로 출력 -->
${num}<br> <!--3-1. 1-1번에서 볼수있듯, num은 page영역임. 따라서 원래는 아랫줄 처럼 써야하지만 지금은 생략가능 -->
${pageScope.num}<br>


${requestScope.num}<br>
${sessionScope.num}<br>
${applicationScope.num}<br>

<!-- 3-2. 설정한 영역이 어디냐에 따라 출력할때도 그 영역에 맞는 스콥을 써줘야함  -->

</body>
</html>