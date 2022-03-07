<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %> <!--1. ArrayList import -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>걔속해서 값을 넘겨주는 연습.. 이번에는 배열이다!..</title>
<%@ include file="../include/header.jsp" %> <!--2. 예전에 만들어놓았던 header파일도 들고옴 -->
<script src="../include/jquery-3.6.0.min.js"></script>
</head>

<body>
<%

//3. 배열을 만든 후 그 값을 request해버림
ArrayList<String> items=new ArrayList<>();
items.add("오렌지");
items.add("사과");
items.add("포도");
items.add("복숭아");
request.setAttribute("items", items);
%>

<jsp:forward page="ex05_result.jsp"></jsp:forward>
<!--4. 참고 : forward / redirect
forward : 주소고정, 대량의 데이터 전달가능, 컨텍스트패스 포함
sendRedirect : 주소변경, 소량의 데이터, 컨텍스트패스 추가해야 함
 -->

</body>
</html>