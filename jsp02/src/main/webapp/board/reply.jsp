<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>묵상 나눔 페이지</title>
<%@ include file="../include/header.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

function updateReply(){
	var writer=$("#writer").val();
	var passwd=$("#passwd").val();
	if(writer==""){
		alert("이름을 입력하세요.");
		$("#writer").focus();
		return;
	}
	if(passwd==""){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		return;
	}
	document.form1.submit();
}
</script>



<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

#well {
	padding-top: 5px;
	padding-bottom: 5px;
}

#well a:hover, .navi a:active {
	text-shadow: 0px 1px 1px #000;
	color: #b3d9ff;
	text-decoration: none;
}

#contents {
	padding: 3% 2% 3% 2%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse" id="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="contemplation.jsp">My_QT</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="../jsp_project/about1.jsp">ABOUT</a></li>
        			<li><a href="../jsp_project/contemplation.jsp">오늘의 묵상</a></li>
        			<li><a href="../jsp_project/book1.jsp">QT 교재</a></li>
        			<li><a href="../jsp_project/board2.jsp">묵상 나눔</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
      <c:choose>
        <c:when test="${sessionScope.userid == null}">
   			<span><a href="../jsp_project/login1.jsp" style="color: gray;">로그인 | </a></span>
   		</c:when> 
   	<c:otherwise>
    	<span style="color: white;"><strong style="color: white;">${sessionScope.result}</strong>님 </span>
    	<span><a href="/jsp02/member_servlet/view.do" style="color: gray;"> | 회원정보</a></span>
   	</c:otherwise>
      </c:choose>
				</ul>

			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav">
				<div class="well " id="well">
					<p>
						<a href="login1.jsp">묵상 나눔</a>
					</p>
				</div>
			</div>



			<div class="col-sm-8 text-center" id="contents">

				<h2>답변쓰기</h2>
				<hr>
				<form name="form1" method="post" action="${path}/board_servlet/insertReply.do">
					<table  border="1" style=" width: 100%;">
						<tr>
							<td>이름</td>
							<td><input name="writer" id="writer"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input name="subject" id="subject"
								value="Re: ${dto.subject}" size="60"></td>
						</tr>
						<tr>
							<td>본문</td>
							<td><textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd" id="passwd">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="hidden"
								name="num" value="${dto.num}"> <input type="button"
								value="확인" onclick="updateReply()"></td>
						</tr>
					</table>



				</form>


			</div>

		</div>
	</div>

	<footer class="container-fluid text-center">
		<p style="font-size: 12px;">서울특별시 서초구 헌릉로</p>
		<h6>
			02-572-0691 <a href="thechurchinlove@gmail.com">thechurchinlove@gmail.com</a>
		</h6>
		<p style="font-size: 12px;">Copyright &copy; thechurchinlove</p>
	</footer>

</body>
</html>