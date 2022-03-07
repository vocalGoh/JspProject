<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>걔속해서 값을 넘겨주는 연습.. 이번에는 Map이다!..</title>
<%@ include file="../include/header.jsp" %>
<!--2. 예전에 만들어놓았던 header파일도 들고옴 -->

<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ page import="java.util.HashMap" %> <!--1. HashMap import -->

<%
HashMap<String,String> map=new HashMap<>();
map.put("포도", "grape");
map.put("오렌지", "orange");
map.put("바나나", "banana");
map.put("사과", "apple");
request.setAttribute("map", map); /* 3. 맵으로 저장한값들을 응답/요청 페이지에 넘김 */
%>
<jsp:forward page="ex06_result.jsp"></jsp:forward>
<!--4. 참고 : forward / redirect
forward : 주소고정, 대량의 데이터 전달가능, 컨텍스트패스 포함
sendRedirect : 주소변경, 소량의 데이터, 컨텍스트패스 추가해야 함
 -->
 
</body>
</html>