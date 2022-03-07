<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL을 쓰는 이유 : 원래 사용하던 전통적인 코드 방식을 EL형식으로 바꿔보자 : 간결해지는 코드</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- 전통적인 코드방식을 EL로 바꿈 -->
<%
//	String name = request.getParameter("name");

//  null일때 즉, 입력돤 값이 없을때 대체할 값으로 변경해야 함.
//	if(name==null){
// 		name=""; 
//	}


//위 코드를 EL을 써서 표현하면 아래와 같다.
%> 

	<!-- <form>태그에 action="url"을 생략하면 자신의 페이지가 호출되어 실행된다. -->
	<!-- <form>태그를 썼기에 전통적인 방식으론 위와 같이 코드를 적어줘야 하지만 EL방식을 쓴다면 위 코드는 필요없이 아래처럼 나타내면 된다. -->
	<!-- 코드가 꽤나 간결해짐 -->
	<form>
		이름 : <input name="name" value="${param.name}"> <input type="submit" value="확인">
	</form>

	이름 : ${param.name} <br>

</body>
</html>