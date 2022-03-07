<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>25. 수정과 삭제하는 페이지 : 해당 메모를 클릭하면 내가 쓴 메모가 보이게 새로운 페이지</title>

<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


//25-1. 이 페이지에는 메모를 수정하고 삭제할 기능을 추가할 것이다.
//25-2. 먼저 수정하는 기능을 보자
function updateMemo(){
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	if(writer==""){
		alert("이름을 입력하세요.");
		$("#writer").focus();
		return;
	}
	if(memo==""){
		alert("메모를 입력하세요.");
		$("#memo").focus();
		return;
	}
	document.form1.action="${path}/memo_servlet/update.do"; //25-3. 가상의 URL이 들어왔으므로 MemberController로 이동
	document.form1.submit();
}


//29. 삭제 기능
function deleteMemo(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="{path}/memo_servlet/delete.do";//가상의 URL이 들어왔으므로 MemberController로 이동(30번)
		document.form1.submit();
	}
}

</script>
</head>





	<body>
	<h2>메모 수정</h2>
	<form name="form1" id="form1" method="post">
	<table>
 	<tr>
 		<td>이름</td>
 		<td><input name="writer" id="writer" value="${dto.writer}"></td>
 		<!--${dto.writer} :  getter호출 -->
  		<!-- 컨트롤러의 request.setAttribute("dto", dto)의 "dto"와 ${dto.writer} 의 dto가 같아야한다.-->
 	</tr>
 
	 <tr>
 		<td>메모</td>
 		<td><input name="memo" id="memo" size="50" value="${dto.memo}"></td>
 	</tr>
 	<tr>
 		<td colspan="2" align="center">
  			<input type="hidden" name="idx" id="idx" value="${dto.idx}">
   			<input type="button" value="수정" onclick="updateMemo()">
   			<input type="button" value="삭제" onclick="deleteMemo()">
 		</td>
	 </tr>
	</table>
	</form>
	</body>
	</html>