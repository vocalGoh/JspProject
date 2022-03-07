<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(function(){//7. 메인 페이지를 키자마자 바로 실행되는 함수
	list();//7-1. 메인 페이지를 키면 바로 list()함수가 실행되겠군. 8번으로 이동
	
	$("#btnSave").click(function() {//7-2. 확인버튼을 눌렀을때
		insert();//insert() 함수는 DB에 저장해주기'만'함. 갱신하기 위해서 list()함수를 다시 부름
	});
	$("#btnSearch").click(function() {//7-3. 검색 버튼을 눌렀을때
		list();//리스트 함수로 이동
	});
});




function insert(){//16. 리스트에 추가적인 데이터를 입력하게 하는 함수
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	var param="writer="+writer+"&memo="+memo;// 다 아래 8번과 같다
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/insert.do",//MemoController로 이동하자(17번)
		data: param,
		success: function(){
			list();
			$("#writer").val("");
			$("#memo").val("");
		}
	});
}


function list(){//8. DB에 저장되어 있는 리스트를 띄우는 함수
	//8-1. 검색옵션과 검색할 키워드를 전달 : MemoController 참조
	var param = "searchkey=" + $("#searchkey").val() + "&search=" + $("#search").val();
	//참조 : ex) $("#searchkey").val() : id가 searchkey인 곳에서 value값을 가져온다
	
	$.ajax({//8-2. 서블릿(MemberController)으로 전송
		type: "post",
		url: "${path}/memo_servlet/list.do", //11번으로 이동하자
		data: param,
		success: function(result){//요청보낸 응답이 성공적으로 도착한 경우
			$("#result").html(result);//결과(result)를 아래 아이디가 result인곳에 띄워준다.
			//result는 memo_list에서 보내준다. 즉, 테이블이 올거다
		}
	});
}

</script>

</head>
<body>
<h2>한줄메모장</h2>

이름 : <input id="writer" size="10"> <br>
메모 : <input id="memo" size="40">
<input type="button" id="btnSave" value="확인">

<br>

<!-- 검색기능을 추가하겠습니다~ -->
<select id="searchkey">
 <option value="writer">이름</option>
 <option value="memo">메모</option>
 <option value="writer_memo">이름+메모</option>
</select>

<input id="search" value="${search}">
<input type="button" id="btnSearch" value="조회">


<div id="result"></div>

</body>
</html>