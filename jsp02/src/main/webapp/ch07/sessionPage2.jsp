<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %><!-- 아까 만들어놓은 header파일 -->
<%@ include file="../include/session_check.jsp" %>
<!-- 로그인 하지않고 페이지에 들어온 잡것들 거르기 위해 만든 소스파일(7번참조)-->
<script type="text/javascript">

$(function () {
  $("#btnLogout").click(function() {//6-2. 로그아웃 처리 이므로 서블릿인 4-6번으로 이동
    location.href="${path}/session_servlet/logout.do";
  });
});
</script>

</head>
<body>
<!-- 6. EL버변을 사용한 결과 출력 -->
<!--6-1. 4-3번에서 저장해놨던 message와 userid 끌고옴ㅋㅋ -->
<h2>${sessionScope.message}</h2> 
<!-- message : result = rs.getString("name") + "님 환영합니다." -->
${sessionScope.userid}님이 접속중입니다.<br>

<button type="button" id="btnLogout">로그아웃</button>

</body>
</html>