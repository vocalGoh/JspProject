<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DTO 코드도 JSTL로 나타낼 수 있을까?</title>
<%@ include file="../include/header.jsp" %><!--2. 예전에 만들어놓았던 header파일도 들고옴 -->
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%-- 

<%@ page import="member.MemberDTO" %> //1. 저번에 만들었던 MemberDTO 들고옴

<%
MemberDTO dto=new MemberDTO();
dto.setUserid("kim");
dto.setName("홍길동");
dto.setPasswd("1234");
request.setAttribute("dto", dto);
%> 

3. 위 코드는 JSTL코드를 이용해 아래와 같이 간결하게 나타낼 수 있다.
--%>

<%@ page import="member.MemberDTO" %> <!--3-1. 저번에 만들었던 MemberDTO 들고옴 -->
<%
MemberDTO dto=new MemberDTO();
dto.setUserid("kim");
dto.setName("홍길동");
dto.setPasswd("1234");
%>

<c:set var="dto" value="<%=dto%>" scope="request" />

<jsp:forward page="ex07_result.jsp"></jsp:forward>
<!-- 4. 참고 : forward / redirect
forward : 주소고정, 대량의 데이터 전달가능, 컨텍스트패스 포함
sendRedirect : 주소변경, 소량의 데이터, 컨텍스트패스 추가해야 함
-->


</body>
</html>