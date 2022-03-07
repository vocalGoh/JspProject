<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
   function check() {
      
      //form1에서 값 받아오기
      var userid = document.form1.userid.value;
      var pwd = document.form1.pwd.value;
      
      //아이디나 비밀번호가 없을때의 대처
      if (userid == "") {
         alert("아이디를 입력하세요.");
         document.form1.userid.focus();
         return;
      }
      if (pwd == "") {
         alert("비밀번호를 입력하세요.");
         document.form1.pwd.focus();
         return;
      }
      
   }
   
   
   function find() {
	   location.href="find.jsp";
   }
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
    
    <h1>로그인</h1>
      
      <form name="form1" method="post" action="/jsp02/member_servlet/login.do">
        
      <table align="center">
         <tr> <td>아이디</td> <td><input type="text" name="userid"></td> </tr>
         <tr> <td>비밀번호</td> <td><input type="password" name="pwd"></td> </tr>
         <tr>
            <td><input type="submit" value="로그인" onclick="check()"></td>
              <td><input type="button" value="아이디/비밀번호 찾기" onclick="find()"></td>
         </tr>
      </table>
   </form>
   <br><br>
   
   <hr>
   
   <br><br>
   <h5>아직 회원가입을 안하셨다구요??</h5>
    <a href="login2.jsp">회원가입하러 가기</a>
   

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