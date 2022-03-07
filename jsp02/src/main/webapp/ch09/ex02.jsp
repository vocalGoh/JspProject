<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다양한 JSTL 코드 표현</title>
<%@ include file="../include/header.jsp"%>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 1. setAttribute -->
	<c:set var="country" value="Korea" scope="page" /> <% //pageContext.setAttribute("country", "Korea");와 같음%>
	<c:if test="${country != null}">
 		국가명 : ${country}<br>
	</c:if>

	<%int[] nums = { 10, 70, 80, 50, 40, 30, 20 }; %> <!-- pageContext.setAttribute("num", nums); -->
	
	<!--2. 배열에 들어있는 값을 빼내는 법 : for반복문을 JSTL로 표현 -->
	<c:set var="num" value="<%=nums%>" />
	<c:forEach var="n" items="${num}">
 	${n},
	</c:forEach>
	<br>

	<!-- 3. 다중조건문 (switch case문) -->
	<c:set var="season" value="겨울" />
	<c:choose>
		<c:when test="${season == '봄'}">
			<img src="/jsp02/images/spring.jpg">
		</c:when>
		<c:when test="${season == '여름'}">
			<img src="/jsp02/images/summer.jpg">
		</c:when>
		<c:when test="${season == '가을'}">
			<img src="/jsp02/images/autumn.jpg">
		</c:when>
		<c:when test="${season == '겨울'}">
			<img src="/jsp02/images/winter.jpg">
		</c:when>
		<c:otherwise>
   잘못된 입력입니다.
 </c:otherwise>
	</c:choose>

</body>
</html>