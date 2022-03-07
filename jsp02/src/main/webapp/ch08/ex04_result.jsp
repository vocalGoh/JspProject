<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드를 JSTL코드로 바꾸는 작업 진행 중... 이번엔 session으로 값을 넘겨주는 코드들을 바꿔보자</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%-- 

<%

String name=(String)session.getAttribute("name");
int age=(int)session.getAttribute("age");
String job=(String)session.getAttribute("job");
String addr=(String)session.getAttribute("addr");

%>

이름 : <%= name %> <br>
나이 : <%= age %> <br>
직업 : <%= job %> <br>
주소 : <%= addr %> <br>


위 코드를 아래와 같이 나타낼 수 있다
 --%>

<!-- session뿐만이 아니라 request, application등등이 다 들어갈 수 있음 -->
이름 : ${sessionScope.name} <br>
나이 : ${sessionScope.age} <br>
직업 : ${sessionScope.job} <br>
주소 : ${sessionScope.addr} <br>

<!-- 코드 8줄이 4줄로 줄어들었노! -->


</body>
</html>