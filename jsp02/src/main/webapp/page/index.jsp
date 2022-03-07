<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {//4. 바로 켜지는 함수가 list()함수를 실행
	list('1');//1페이지란 뜻
});


function list(curPage){//5.
	var param="curPage="+curPage; //5-1. curPage : 현재 페이지
	$.ajax({
		type: "post",
		url: "${path}/page_servlet/list.do", //5-2. PageController로 이동
		data: param,
		success: function(result){
			$("#result").html(result);
		}
	});
}

</script>
</head>
<body>
<h2>페이지 나누기</h2>

<div id="result"></div>

</body>
</html>