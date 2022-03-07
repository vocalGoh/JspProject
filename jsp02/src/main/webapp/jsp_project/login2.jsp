<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 <script type="text/javascript">

	function check() {
		
		//1. 입력검증
		
		//이름 체크
		var name = document.getElementById("name");
		if (name.value == "") {
			alert("이름은 필수 입력입니다.");
			name.focus();
			return;
		}
		var exp3 = /^[가-힣]+$/;
		if (!exp3.test(name.value)) {
			alert("이름은 한글만 가능합니다.");
			name.focus();//
			return;//종료
		}
		
		//생년월일 체크
		var birth = document.getElementById("birth");
		var exp6 = /^[0-9]+$/; 
		
		if (!birth.value.match(exp6)) {
			alert("숫자만 입력하세요."); 
			birth.focus();
			return;//종료
		}

		//이메일 체크
		var email = document.getElementById("email");
		
		var exp4 = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
		
		if (!exp4.test(email.value)) {
			alert("이메일 형식이 잘못되었습니다. ex)abc@abc.com");
			email.focus();
			return;//종료
		}

		//전화번호 체크
		var phone = document.getElementById("phone");
		var exp5 = /^[0-9]+$/; 
		
		if (!phone.value.match(exp5)) {
			alert("숫자만 입력하세요."); 
			phone.focus();
			return;//종료
		}

		//아이디 체크
		var userid = document.getElementById("userid");
		
		if (userid.value == "") {
			alert("아이디는 필수 입력입니다.");
			userid.focus();
			return;
		}

		var exp1 = /^[A-Za-z0-9]{4,10}$/;

		if (!exp1.test(userid.value)) {			
			alert("아이디는 영문자, 숫자를사용해서 4~10자리로 입력하세요.");
			userid.focus();
			return;//종료
		}

		//비밀번호 체크
		var pwd = document.getElementById("pwd");
		
		if (pwd.value == "") {
			alert("비밀번호는 필수 입력입니다.");
			pwd.focus();
			return;
		}

		var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d).{8,12}/;
		
		if (!exp2.test(pwd.value)) {
									
			alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두" + "혼합사용하여 8~12자리로 입력하세요.");
			pwd.focus();
			return;//종료
		}
		
		
		
		//2. DB에 회원추가
		var param = "userid=" + $("#userid").val() + "&pwd=" + $("#pwd").val() + "&name=" + $("#name").val() + "&email=" + $("#email").val() + "&phone=" + $("#phone").val() + "&birth=" + $("#birth").val();

		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/join.do",
			data : param,
			success : function() {
				list();//5-1. 회원목록 갱신
				//입력값 초기화
				$("#userid").val(""); $("#pwd").val(""); $("#name").val(""); $("#email").val(""); $("#phone").val(""); $("#birth").val("");
			}
		});
		


		alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요~");
		
		location.href="login1.jsp";

	}//function check()
</script>
 
 
 
 
 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
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
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse" id="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="contemplation.jsp">My_QT</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="about1.jsp">ABOUT</a></li>
        <li><a href="contemplation.jsp">오늘의 묵상</a></li>
        <li><a href="book1.jsp">QT 교재</a></li>
        <li><a href="../board/index.jsp">묵상 나눔</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
        <c:when test="${sessionScope.userid == null}">
   			<span><a href="login1.jsp" style="color: gray;">로그인 | </a></span>
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
      <div class="well "id="well">
        <p><a href="login1.jsp">로그인</a></p>
      </div>
      <div class="well" id="well">
        <p><a href="login2.jsp">회원가입</a></p>
      </div>
	</div>
    
    <div class="col-sm-8 text-center" id="contents">
    	<h1>회원가입</h1>
			<form>

				<table align="center">
					<tr>
						<td>이름</td>
						<td><input type="text" id="name"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" id="birth"
							placeholder="주민번호 앞자리를 적어주세요"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="email"
							placeholder="kim12@korea.com"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="phone" placeholder="숫자만 입력해주세요"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="userid"
							placeholder="사용하실 아이디를 입력해주세요"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="pwd"
							placeholder="사용하실 비밀번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" id="btnSave" onclick="check()" value="입력완료">
						</td>
					</tr>
				</table>
			</form>

	</div>
    
  </div>
</div>

<footer class="container-fluid text-center">
  <p style="font-size: 12px;">서울특별시 서초구 헌릉로</p>
         <h6> 02-572-0691 <a href="thechurchinlove@gmail.com">thechurchinlove@gmail.com</a> </h6>
         <p style="font-size: 12px;">Copyright &copy; thechurchinlove</p>
</footer>

</body>
</html>