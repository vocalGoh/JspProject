<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반적인 방식의 login(암호화 없음) : 실행파일</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/* 2. 로그인 버튼을 눌렀을 때 함수(의 역할) */
$(function(){
	$("#btnLogin").click(function() {
		var param = "userid=" + $("#userid").val() + "&passwd=" + $("#passwd").val();
		//2-1. 여러데이터를 param이란 변수에 묶어 압축한다
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/login.do", //2-2. 가상 URI가 넘어오니 MemberController.java로 이동
			data: param, //2-3. 데이터를 param으로 넘겨주는데
			success: function(result){
				$("#result").html(result); //2-4. 결과가 HTML형식으로 id가 result인 <div>태그에 출력됨
			}
		});
	});
});

</script>

</head>
<body>
<h2>로그인</h2>
<!-- 1. 여기서 먼저 올바른 아이디와 비밀번호를 입력한다. -->
아이디 : <input id="userid"> <br> <!-- kim -->
비번 : <input type="password" id="passwd"> <br> <!-- 1234 -->
<button id="btnLogin">로그인</button> <!-- 로그인 버튼을 누르면 2번의 함수가 실행된다. -->

<div id="result"></div>

</body>
</html>