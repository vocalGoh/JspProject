<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정/삭제</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/* 32. 두 버튼의 기능 : 각각 update.do와 delete.do라는 가상 URI를 또 붙이노? 그럼 MemberController.java로 이동해야겠지?*/
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="/jsp02/member_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		 document.form1.action="/jsp02/member_servlet/delete.do";
		 document.form1.submit();
		}
	});
});
</script>


</head>
<body>
<% MemberDTO dto=(MemberDTO)request.getAttribute("dto"); %>

	<form name="form1" method="post"> <% //31. 30번에서 찾던 form1이 여기있다. %>
	<%//이곳은 회원정보 수정/삭제를 하기 위해 사람의 이름을 누르면 새로 테이블이 뜨게 하는 그런 페이지다 %>
	<%//아이디와 회원가입일자를 제외한 곳엔 <input>태그를 넣어 수정이 가능하게 했다. %>
		<table border="1">
 			<tr>
  				<td>아이디</td> <td><%= dto.getUserid() %> </td>
 			</tr>
 			<tr>
  				<td>비빌번호</td> <td><input type="password" name="passwd" value="<%= dto.getPasswd() %>"> </td>
 			</tr>
 			<tr>
  				<td>이름</td> <td><input name="name" value="<%= dto.getName() %>"> </td>
 			</tr>
 			<tr>
  				<td>회원가입일자</td> <td><%= dto.getJoin_date() %> </td>
 			</tr>
 			<tr>
  				<td>이메일</td> <td><input name="email" value="<%= dto.getEmail() %>"> </td>
 			</tr>
 			<tr>
  				<td>휴대폰</td> <td><input name="hp" value="<%= dto.getHp() %>"> </td>
 			</tr>
 			<tr>
  				<td colspan="2" align="center">
   				<input type="hidden" name="userid" value="<%= dto.getUserid() %>">
   				<button type="button" id="btnUpdate">수정</button>
   				<button type="button" id="btnDelete">삭제</button>
   				<%//31-1. 이제 위 두 버튼(btnUpdate, btnDelete)이 어떤 기능을 하는지 위로 올라가서 찾아보자 %>
  				</td>
 			</tr>
</table>
</form>

</body>
</html>