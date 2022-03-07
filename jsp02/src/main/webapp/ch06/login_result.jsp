<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 헀을때 결과를 띄워주는 창</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%//2-1. 2번에 결과를 띄워주는 창 %>
<%= request.getAttribute("result") %>

<%//어떤 과정을 통해 이런 결과가 띄워지는지 알아보자 %>

<%//주의! : 먼저 이렇게 한명을 회원가입 시켜놓고 로그인을 진행해야한다!! %>
</body>
</html>