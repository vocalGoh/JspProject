<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Enumeration"%> <!-- page import -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 가져오기 : getAttribute</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%
	//JSP 내장 객체인 request, session, application, pageContext 객체는 
	//setAttribute(), getAttribute() 를 통해 속성 값들을 저장하거나 얻을 수 있습니다. 
	//어떤 속성들이 저장 되어 있는지 확인할 때에는
	//getAttributeNames() 메서드를 통해 속성명들을 문자열로 담은 Enumeration<String> 객체를 얻을 수 있습니다.
	Enumeration<String> attr = session.getAttributeNames();
	while (attr.hasMoreElements()) {//다음 요소가 있으면
		String key = attr.nextElement();//다음 요소를 읽음
		Object value = session.getAttribute(key);//return type이 Object이기 때문
		out.print("변수명 : " + key);
		out.print(", 값 : " + value + "<br>");
	}//2. Enumeration을 사용해서 세션의 key set을 가져옴

	//3. 이제 key를 이용해 세션의 값들을 가져오자
	String id = (String) session.getAttribute("id");
	
	int age = 0; //age를 먼저 0으로 대충 처리해준 다음
	//session을 지운 후 NullPointerException이 안나오게 하려면 if문 처리하는게 좋음
	if (session.getAttribute("age") != null) {
		age = (int) session.getAttribute("age");
	}//세션에 저장되어 있던 age값을 가져옴

	double height = 0; //age와 방식이 같다
	if (session.getAttribute("height") != null) {
		height = (double) session.getAttribute("height");
	}
	%>
	<!--4. 가져온 세션값들 출력 -->
	아이디 : <%=session.getAttribute("id")%> <br> 
	나이 : <%=age%> <br> 
	키 : <%=height%> <br> 
	아이디 : ${sessionScope.id} <br> <!-- EL버젼으로 출력 -->
	<a href="deleteSession.jsp">세션 삭제</a>
</body>
</html>