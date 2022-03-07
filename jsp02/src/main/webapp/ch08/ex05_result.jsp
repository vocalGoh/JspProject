<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번에도 JSTL코드를 이용해 긴코드를 간결하게 나타내어 보자</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<%-- 

<%@ page import="java.util.ArrayList" %>

<%

ArrayList<String> items=(ArrayList<String>)request.getAttribute("items");
for(String str : items){
 out.print(str + "<br>");
}

%> 

5. 위 코드는 JSTL코드를 이용해 아래와 같이 간결하게 나타낼 수 있따
--%>

<!-- EL/JSTL -->
<!-- forEach문도 2가지 종류가 있다.
1) forEach var="변수" begin="시작" end="끝" - java의 일반 for문과 비슷
2) forEach var="개별값" items="집합" - java의 확장 for문과 비슷
 -->

<!-- getAttribute로 값을 받고 for문으로 값을 꺼내는 과정이 아래처럼 간결해짐 -->
<c:forEach var="fruit" items="${requestScope.items}"><!-- request영역이니까 requestScope -->
 	${fruit} <br>
</c:forEach>

</body>
</html>