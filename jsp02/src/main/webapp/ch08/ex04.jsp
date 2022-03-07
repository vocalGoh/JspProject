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

session.setAttribute("name", "김길동");
session.setAttribute("age", 20);
session.setAttribute("job", "programmer");
session.setAttribute("addr", "서울 성동구 왕십리");

%> 


위 코드를 아래와 같이 나타낼 수 있다
--%>

<c:set var="name" value="김길동" scope="session" />
<c:set var="age" value="20" scope="session" />
<c:set var="job" value="programmer" scope="session" />
<c:set var="addr" value="서울 성동구 왕십리" scope="session" />


세션변수가 생성되었습니다. <br>
<a href="ex04_result.jsp">확인</a>

</body>
</html>