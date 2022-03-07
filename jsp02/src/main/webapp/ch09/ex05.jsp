<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL코드 : redirect를 써서 쿼리스트링 방식으로 값을 넘겨줄수도 있다(ex04참조)</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<%-- 
<c:redirect url="ex04.jsp?start=3&end=9"></c:redirect> 

이 코드 자체도 JSTL코드

이걸 아래에 풀어써볼게
--%>

<c:redirect url="ex04.jsp">
 <c:param name="start" value="2" />
 <c:param name="end" value="9" />
 <!-- 구구단이 제대로 나오려면 value값이 먹혀야하고 -->
 <!-- value값이 제대로 먹히려면 
  1번에서의 ${param.start}, ${param.end}가 꼭 있어야함 -->
</c:redirect>

</body>
</html>