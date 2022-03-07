<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!-- 1. 일단 여기 세줄이 없어짐 -->

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존의 member_list와 코드비교 해보자</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


function view(userid){
	document.form1.userid.value = userid;
	document.form1.submit();
}

</script>
</head>
<body>





<!-- 2. 여기에 있을 Map계열도 ${map.count}로 퉁쳐버림 -->






	등록된 회원수 : ${map.count}명 <br>
	<table border="1" width="100%">
		<tr>
			<th>이름</th> <th>아이디</th> <th>가입일자</th> <th>이메일</th> <th>핸드폰</th>
		</tr>
		<!-- 3. 여기 for문도 JSTL의 for문으로 퉁쳐버림 ㅋㅋㅋ -->
		<c:forEach var="dto" items="${map.list}"> 
			<tr><!-- 4. 멤버변수명이 아닌 실지로는 getter 메소드 호출 -->
				<td><a href="#" onclick="view('${dto.userid}')">${dto.name}</a>
				</td>
				<td>${dto.userid}</td><!--4-1. 내부적으로 dto.getUserid()호출  -->
				<td>${dto.join_date}</td>
				<td>${dto.email}</td>
				<td>${dto.hp}</td>
			</tr>
		</c:forEach><!--3-1. for문 끝 -->
	</table>

	<form name="form1" method="post" action="/jsp02/member_servlet/view.do">
		<input type="hidden" name="userid">
	</form>

</body>
</html>







