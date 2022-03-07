<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BCrypt 암호화 방식의 로그인</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnLogin").click(function() {
		var param="userid="+$("#userid").val()+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/login_bcrypt.do", //1. 가상 URL 들어왔으니 다시 MemberController로 떠나자
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});

</script>

</head>
<body>
<h2>로그인(Bcrypt 암호화)</h2>
아이디 : <input id="userid"> <br>
비번 : <input type="password" id="passwd"> <br>
<button id="btnLogin">로그인</button>

<div id="result"></div><!-- 2. 결과를 띄워즈는 창. 옆 login_result를 참고 -->

</body>
</html>