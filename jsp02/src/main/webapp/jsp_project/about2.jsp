<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>이 페이지는..</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <p><a href="about1.jsp">QT란?..</a></p>
      </div>
      <div class="well" id="well">
        <p><a href="about2.jsp">이 페이지는..</a></p>
      </div>
    </div>
    
    <div class="col-sm-8 text-center" id="contents">
				<h1>이 페이지는..</h1>
				<br> <br>
				<p>
				<p>매일 매일 성경을 읽고 그 깊은 뜻을 알아가시고 싶은 여러분~<br> 안녕하세요~ 고인수입니다.
					<br>
					<br>
				
				<p>
					이 페이지는 여러분들의 성경묵상을 돕기 위해 만들어졌습니다.<br> 제가 성경을 읽으면서 평소에 느끼던 "이런
					편리함이 있으면 참 좋겠다"는 기능들을 담은 페이지를 만들어보았습니다.<br>
				</p>

				<br>

				<p>
					오늘의 묵상 페이지에서는<br> 여러분들이 오늘 읽어야할 QT분량이 무엇인지 그 날 해당하는 분량의 말씀들을
					적어놨습니다.<br> 혹여나 읽으시다가 모르는 단어가 있으면 그 단어를 클릭해주세요~ 그럼 그 단어의 뜻,
					유래를 알려드립니다.<br> 어려운 내용들을 따로 찾아볼 필요없이 바로바로 그 자리에서 확인하세요!<br>
				</p>

				<br>

				<p>
					QT교재 페이지에서는 여러분들이 선호하는, 또 필요로 하는 교재들을 판매합니다.<br> 책의 설명들을 잘
					읽어보시고 여러분들이 원하시는 책, 필요로 하시는 책들을 구입하세요.<br>
				</p>

				<p>
					아 참! 저희 페이지에 회원이신 분들만 책을 구매하실 수 있습니다~ 로그인 페이지에서 회원가입을 하신 후 이용해주세요.<br>
				</p>

				<br>

				<p>
					제가 섬기는 교회의 위치는 CONTACT 페이지에 나와있습니다. 혹시나 궁금하신 분들은 참고해주시면 감사하겠습니다.<br>
				</p>

				<br>

				<p>
					오늘도 편안한 하루 되세요~<br>
				</p>



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