<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="member.MemberDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 베이스에 등록되어 있는 회원정보를 표로 보여주기</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

/* 30. 28번에서 봤던 view()라는 함수다. 매개변수로 들어온 userid를 form1이라는 곳의 value에다 넣고 제출을 해주는 함수다. */
/* form1이 뭘 하는곳인지 알기 위해 member_view로 넘어가보자. */
function view(userid){
	document.form1.userid.value = userid;
	document.form1.submit();
}

</script>
</head>
<body>

	<%//27. 압축 저장되어 있던 데이터들 풀어내기 시작 
	
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
	//27-1. 24-2번에서 setAttribute로 저장된 값("map")을 가져옴. 그 "map"을 변수 map에 저장
	
	   List<MemberDTO> list = (List<MemberDTO>) map.get("list");
	   //27-2. 변수 map에서 저장되어 있던 "list"를 꺼내어 새 변수 list에 저장
	   int count = (int) map.get("count"); 
	   //27-2. 변수 map에 저장되어 있던 "count"를 꺼내어 새 변수 count에 저장
	   %>

	등록된 회원수 : <%=count%>명
	<table border="1" width="100%">
		<tr>
			<th>이름</th> <th>아이디</th> <th>가입일자</th> <th>이메일</th> <th>핸드폰</th>
		</tr>
		
		<% for (MemberDTO dto : list) { %> <!-- 27-3. 표를 만들어 list안에 있던 데이터들마저 풀어냄 -->
	
		<%//28번부터는 새로운 테마가 시작됩니다. 회원정보 수정/삭제하는 기능을 추가하기 위해서죠. %>
		<tr>
			<%//28. 클릭을 하면 회원 정보가 변경될 수 있게 하기 위해 view()라는 함수를 쓰고 매개변수는 아이디로 잡음. 위로 올라가서 view()함수가 뭐하는질 보자 %>
			<%//매개변수를 아이디로 잡은 이유는 이름이나, 가입일자는 동명이인등 같은 값이 존재할 수 있지만 아이디는 오직 하나만 존재하기 때문 %>
			<td>
			<a href="#" onclick="view('<%= dto.getUserid() %>')"> <%= dto.getName() %></a> 
			</td>
			 
			<td><%=dto.getUserid()%></td> 
			<td><%=dto.getJoin_date()%></td> 
			<td><%=dto.getEmail()%></td> 
			<td><%=dto.getHp()%></td>
		</tr>
		<% } %>
	</table>
	
	<form name="form1" method="post" action="/jsp02/member_servlet/view.do">
	<%//29. 가상의 URI로 view.do를 붙여줌. view.do가 들어왔을때 어떤 반응이 일어나는지 확인하기 위해 MemberController.java로 이동하자 %>
	<%//참조 : 오늘 공부 순서 : 어기선가 새로운 URI를 넣어줌 - 서블릿으로 이동후 추가된 URI기능 넣어주기 - 그에 해당하는 함수 만들어주기 %>
 		<input type="hidden" name="userid">
	</form>
	
</body>
</html>