<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="member.dto.MemberDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>회원정보 보는 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#memberUpdate").click(function(){
		location.href="/jsp02/member_servlet/updateData.do";
	})
});
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
        <p><a href="/jsp02/member_servlet/view.do">회원정보보기</a></p>
      </div>
      <div class="well "id="well">
        <p><a href="/jsp02/member_servlet/logout.do">로그아웃</a></p>
      </div>
      
    </div>
<div class="col-sm-8 text-center" id="contents">
    
   <h1>회원 정보 보기</h1>
  <table style="width: 30%" border='1' align="center">
   <tr>
    <th  colspan="2" style="text-align: center; ">기본 정보</th>
   </tr>
   <tr>
    <td><strong>이름</strong></td><td>${dto.name}</td>
   </tr>
   <tr>
    <td><strong>생일</strong></td> <td>${dto.birth}</td>
   </tr>
   <tr>
    <td><strong>이메일</strong></td> <td>${dto.email}</td>
   </tr>
    <tr>
    <td><strong>핸드폰 </strong></td> <td>${dto.phone}</td>
   </tr>
   <tr>
    <td><strong>아이디</strong></td> <td>${dto.userid}</td>
   </tr>
   <tr>
    <td><strong>가입일</strong></td> <td>${dto.join_date}</td>
   </tr>
  </table>
  <div id="btn" align="center">
   <input type="button" value="회원정보수정" id="memberUpdate" >
   <input type="button" value="회원탈퇴" id="memberDelete">
  </div>
  
   

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