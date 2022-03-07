<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHA256방식의 암호화 처리(회원가입시 처리됨)</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {//페이지 로딩이 되자마자 자동으로 실행되는 코드
		list();
		$("#btnSave").click(function() {
			insert();
		});
	});
	function insert() {
		var param = "userid=" + $("#userid").val() + "&passwd="	+ $("#passwd").val() + "&name=" + $("#name").val() + "&email=" + $("#email").val() + "&hp=" + $("#hp").val();
		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/join_sha.do", //2. 결론적으로 이쪽에 도달하게 된다. 가상 URI가 들어왔으므로 MemberController.java로 가자. 내 아이디도 회원가입 시킴 ㅎㅎ
			data : param,
			success : function() {
				list();//회원목록 갱신
				//입력값 초기화
				$("#userid").val(""); $("#passwd").val(""); $("#name").val(""); $("#email").val(""); $("#hp").val("");
			}
		});
	}
	function list() {
		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/list.do",
			success : function(result) {
				console.log(result);//F12
				$("#memberList").html(result);
			}
		});
	}
</script>
</head>
<body>
	<h2>회원가입(SHA256)</h2>
	아이디 : <input id="userid"> 비번 : <input type="password" id="passwd"> <br> 
	이름 : <input id="name"> 이메일 : <input id="email"> <br> 
	핸드폰 : <input id="hp"> <button type="button" id="btnSave"> 회원가입</button><!-- 1. 회원가입 버튼을 누르면 위 함수가 작동하게 된다. 어떤 결과를 낳을까? -->
	<div id="memberList"></div>
</body>
</html>