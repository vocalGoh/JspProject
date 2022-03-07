<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB를 연동시킨 회원추가 프로그램</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {//3. 페이지 로딩이 되자마자 자동으로 실행되는 코드
		list();//3-1. 4번으로 이동하자
		$("#btnSave").click(function() {//3-2.1번의 버튼을 누르게 되면
			insert(); //5번으로 이동하자
		});
	});
	function insert() {//5. 입력된 회원정보를 가상 URI인 "/jsp02/member_servlet/join.do"로 보내어 회원정보를 추가시키는 함수. MemberController로 이동하자
		var param = "userid=" + $("#userid").val() + "&passwd=" + $("#passwd").val() + "&name=" + $("#name").val() + "&email=" + $("#email").val() + "&hp=" + $("#hp").val();

		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/join.do",
			data : param,
			success : function() {
				list();//5-1. 회원목록 갱신
				//입력값 초기화
				$("#userid").val(""); $("#passwd").val(""); $("#name").val(""); $("#email").val(""); $("#hp").val("");
			}
		});
	}
	function list() {//4. 가상 URI인 "/jsp02/member_servlet/list.do"를 전송하는 함수. MemberController로 이동하자
		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/list.do",
			success : function(result) {
				console.log(result);//F12 누르면 확인가능
				$("#memberList").html(result);//4-1. 결과가 아래 div의 memberlist에 출력
			}
		});
	}	
</script>
</head>
<body>
	<h2>회원관리</h2>
	아이디 : <input id="userid"> 비번 : <input type="password" id="passwd"> <br> 
	이름 : <input id="name"> 이메일 : <input id="email"> <br> 
	핸드폰 : <input id="hp"> <button type="button" id="btnSave">추가</button> <%//1. 아이디, 비번, 이름, 이메일, 핸드폰을 입력하고 이 버튼을 누르면 테이블과 데이터 베이스에 그 정보들이 추가됨 %>
	<div id="memberList"></div> <%//2. 데이터 베이스에 등록되어 있는 회원정보를 표로 보여줌. 4-1번과 member_list 참조 %>
</body>
</html>