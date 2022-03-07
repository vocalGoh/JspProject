<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션삭제</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<% session.invalidate(); //5. 세션을 초기화시킴 %>
세션이 삭제되었습니다. <br>

<a href="viewSession.jsp">세션 확인</a>

</body>
</html>