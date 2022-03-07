<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>QT란?...</title>
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
	padding: 3% 2% 0% 2%;
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
    
    <div class="col-sm-8 text-left" id="contents">
            <h1>QT란 무엇인가요?</h1>
            <br>
            <p>QT란 Quiet Time의 약자로 조용한 시간과 장소를 정하여 매일 하나님을 개인적으로 만나는 시간이며,</p>
            <p>성경 말씀을 통하여 나를 향하신 하나님의 음성(뜻과 계획)을듣고 묵상하며 삶에 적용함으로써 삶의 변화와 성숙을
               이루고자 하는 경건 훈련입니다.</p>
            <p>QT를 할 때 하나님과의 동행과 교재를 느끼고 인도하고 계신 하나님에 대한 예지와 그 뜻에 순종하고자하는
               마음이 있을 때 성숙된 QT삶을 즐기게 됩니다.</p>

            <img src="images/QT1.jpg" width=100% height="400px">

            <h3>QT의 네 가지 요소</h3>
            <p>1. 시간(Quiet time)
            
            <p>조용한 시간 : 예수님께서도 '새벽 오히려 미명'(막1:35)에 하나님과 깊은 교제를 나누셨습니다.</p>

            <p>약속된 시간 : 가급적이면 하나님께 시간을 약속해 드립니다.</p>

            <p>일정하고 규칙적인 시간</p>

            <p>2. 장소(Quite place)</p>

            <p>조용한 장소</p>

            <p>방해받지 아니하는 곳</p>

            <p>약속된 장소</p>

            <p>일정하고 규칙적인 장소</p>

            <p>3. 성경말씀</p>

            <p>성경말씀은 마음으로 듣는 것이 중요합니다.</p>
            <p>성경말씀을 선택할 때는 영적지도자나 안내서들을 활용하는 것이 중요합니다.</p>
            <p>안내서들은 신,구약을 절기와 계절 또는 연역적 방법에 따라 조화있게 편집해 두고 있으므로</p>
            <p>변덕스럽게 또는 편식으로 성경을 묵상하게 되는 것을 지양하게 해준다.</p>

            <p>4. 기도</p>

            <p>QT의 기도는 하나님을 알고자 하는 마음에서 시작하여 하나님을 알았으니 하나님의 뜻대로 행할 수 있게 해달라는
               간구로 끝나는 것입니다.</p>
               
            <img src="images/QT2.png" width=100% height="800px">


            <h3>QT의 실제적인 방법</h3>

            <p>QT의 방법중에 소위 PRESS법이라는 것이 있습니다.</p>
            <p>이것은 다음에 소개하는 다섯가지 순서의 영문자를 따서 일컷는 말입니다.</p> 
            <p>1 Prey for a moment(잠깐 기도하십시오)</p> 
            <p>2 Read His Word(말씀을 읽으십시오) </p>
            <p>3 Examine His Word(말씀을 묵상하십시오) </p>
            <p>4 Say back to God(말씀의 결과를 가지고 다시 기도하십시오) </p>
            <p>5 Share with others what you have found(발견한 사실을 다른 분과 나누십시오)</p>
            
            
            <img src="images/QT3.jpg" width=100% height="800px">
            
            <h3>적용의 정의와 실제</h3>

            <p>묵상의 3가지 원리 중에서 '적용'이라는 부분이 있음을 알았을 것입니다. </p> 
            <p>바로 이 '적용'의 부분은 묵상이 살아있는 것이 되게 하는 아주 중요한 활동이므로</p> 
            <p>적용이 구체적으로 드러나지 아니하는 QT는 열매맺지 못하는 QT라고 말할 수있습니다.</p> 

            <p>1) 적용은 개인적이어야 한다. </p> 
            <p>본문 속의 메시지가 바로 '나'에게 만 적용되어야 한다는 것입니다. </p> 
            <p>만약 나 이외에 다른 사람에게 적용하게 되면 메시지는 '설교'가 되기 때문입니다. </p> 
            <p>2) 적용은 구체적 이어야 합니다. 구체적 이라는 말은 '현실적'이라는 뜻입니다.</p>  
            
            <p>3) 적용은 가능한 것으로 함 성경이 적용하기가 불가능한 것을 나에게 가르치지는 않습니다.</p>
            <p>다만, 나에게 기이한 것을 다른 곳에서 허망히 찾을 따름입니다. 정직한 적용은 가까이에 있음을 인정하십시오 </p> 
            <p>4) 적용의 주의점 #</p> 
            <p>이기적이고 편협적이며 자기 합리화적인 적용을 피하십시오</p> 
            <p># 교리화 되는 적용을 주의하십시오 # 묵상 없는 적용을 남발하지 마십시오</p>
            <br>
            
            <hr>
            
      		<p style="text-align: center;"><a href="#navbar">위로가기</a></p>
            
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