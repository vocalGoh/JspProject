<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>QT 교재</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
	//cal의 기능 : 밑 체크박스에서 선택한 옵션을 더해 총합을 내줌
	function cal() {
		
		var basic = Number(document.getElementById("total").defaultValue); 

		for (var i = 1; i <= 10; i++) {

			var chkObj = document.getElementById("opt" + i);//id가 opt1,opt2,opt3

			if (chkObj.checked) {//체크 상자(checkbox)가 체크 상태(checked)이면

				basic += Number(chkObj.value); //옵션가격을 원래 디폴트 가격(0)에 추가
			}
		}
		document.getElementById("total").value = basic;
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
	.row.content {
		height: auto;
	}
}


/* 여기서부터 list css */
ul {list-style: none;}

	
ul li span p {font-family: italic;}	


/* 여기서부터 table css */
table {
	border-collapse: collapse; /* 표테두리와 셀(td)사이의 간격을 없앰 */
	border-spacing: 0; /* 테이블의 여백을 0로 만듦  */
}

h1 {
	text-align: center;
}

#calculate {
	width: 80%;
	margin: 0 auto;
	padding: 0px 5% 5% 5%;
}

#estimate {
	width: 600px;
}

#estimate th, td {
	border: 1px solid #b7aeae;
	height: 30px;
}

#estimate th {
	background-color: #e7e4e4;
	color: black;
}

#calculate td {
	text-align: center;
}

#calculate td a:hover {
	text-decoration: none;
}

tfoot {
	font-size: 15px;
	font-weight: bold;
}

#total {
	border: none 0;
	background: none;
	font-size: 1.5em;
	font-weight: bold;
	text-align: center;
}

/* 여기까지 table css */


#calculate p a:hover {
	text-shadow: 0px 2px 2px #000;
	color: #b3d9ff;
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
        <p><a href="about1.jsp">QT 교재</a></p>
      </div>
      <div class="well "id="well">
        <p><a href="#calculate">계산 목록</a></p>
      </div>
    </div>
    
    <div class="col-sm-8 text-left" id="contents">
    <div id="books">
				<h1>QT 교재</h1><hr>
				<ul>
					<li id="기도시작반"><span> <a href="#estimate"><img src="images/Book01.jpg"></a>
							<h3><a href="#estimate">[기도시작반]</a></h3>
							<p>
								| 프롤로그 중에서... |<br>
								<br> “이제는 기도하지 않는 게 더 어려워요!” <br> 매일 1시간씩 기도하는 삶으로의
								놀라운 변화 제 마음 한구석에는 주님께 기도의 삶을 드리고 싶은 소망이 늘 있었습니다. <br> 쉬지 않고
								기도하는 삶을 살아내보고 싶었지요. 그래서 몸부림을 치며 기도를 지속하기 위한 다양한 시도를 했습니다.<br>
								그러자 놀랍게도 성령께서 제 삶에 기도가 조금씩 자라나도록, 기도할 수 있는 여러 가지 방법을 깨닫게 해주셨습니다.
								<br> 그래서 이제는 기도하지 않는 게 더 어려워졌지요. 또 예전의 저처럼 기도해야 하는데 안 되고,
								기도하고 싶은데 못하는 사람들을 돕고 싶은 마음이 들었습니다.<br> ‘기도시작반’을 7년 동안 하면서
								많은 지체를 도왔습니다. 그리고 10분도 기도하기 힘들다던 지체가 매일 1시간씩 기도하는 삶으로 변화되는 것을
								지켜볼 수 있었습니다. <br> 기도하지 못하던 삶에서 기도하는 삶으로 바뀌고 비로소 깨달은진리가
								있습니다. <br> 쉬지 않고 기도할 때 항상 기뻐하고 범사에 감사하는 것이 가능하다는 것입니다.
							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>


					<li id="기도응답반"><span> <a href="#estimate"><img src="images/Book02.jpg"></a>
							<h3>
								<a href="#estimate">[기도응답반]</a>
							</h3>
							<p>
							<p>
								| 본문중에서... |<br>
								<br> 어느덧 비대면 예배가 익숙해지고 일상이 되었다. <br> 온라인에 기독교 콘텐츠가
								넘쳐나지만 주님의 얼굴을 주목하는 자녀는 과연 얼마나 될까? <br> 모든 것이 멈추고 막혀버린 듯한
								시대에 주님을 만나는 골방으로 나아갈 수밖에 없었던 처음 마음이 시들해지지는 않았는가? <br> -
								프롤로그 <br>
							</p>

							<p>
								‘저는 마음의 불임입니다. 엘리사벳을 치료하신 하나님, 저도 고쳐주세요!<br> 불임의 멍에와 두려움에서
								자유케 해주세요.’ 내 마음에 떠오르는 그림 하나가 있었다. <br> 자물쇠로 단단히 잠긴 불임의 빗장이
								풀리고 그 문이 활짝 열렸다! 동시에 자녀에 대한 소망이 꽃봉오리 터지듯 피어올랐다. <br> 마치 물이
								포도주로 바뀌듯 단번에 내 마음이 뒤집혔다. 그날 기도 시간에 봇물 터지듯 부르짖었다. <br> ‘주님,
								제가 엄마가 되길 간절히 소망합니다.’ <br> - 18,19쪽 <br>
							</p>

							<p>
								‘주님, 또 재정으로 마음이 어렵습니다. 돈 문제로 염려하는 게 지긋지긋합니다.’<br> 기도를 가장한
								원망을 늘어놓자 주님이 마음 깊은 곳에서 말씀하셨다. <br> ‘딸아, 지금까지 너를 먹이고 입힌 게
								누구니?<br> 재정의 어려움을 당할 때마다 내가 공급하여 건져낸 일들은 벌써 잊었니?<br>
								그때 했던 감사의 고백은 어디 가고 힘들었던 기억만 붙잡고 있구나.’<br> 오래 참으시는 주님이지만
								은혜는 잊은 채 또다시 울먹이며 불평하는 볼멘소리에 주님도 마음이 상하신 듯했다.<br> 죄송한 마음에
								눈물이 쏟아졌고, 이내 회개가 터져 나왔다. <br> - 79,80쪽 <br>
							</p>

							<p>
								원수는 ‘질병’이라는 가계에 반복되는 약점으로 나를 옭아맸다.<br> 하지만 이것은 결코 주님 안에서
								‘진리’가 아니다. … 내 믿음이 어디에 뿌리를 두느냐에 따라 다른 열매를 맺는다. <br> 기도의
								자리에서 이 말씀을 선포하며 기도했다. 질병이 나를 주장할 수 없으며, 나는 주님 안에서 새롭게 되었음을,
								두려움으로부터 자유케 되었음을 선포했다.<br> 점점 내 믿음이 진리를 향해 뿌리내리고 있음을 느꼈다. <br>
								- 148쪽 <br>
							</p>

							<p>
								에클레시아, 곧 교회 공동체를 음부의 권세가 이기지 못한다고 약속해주셨다.<br> 공동체를 세우신 건
								전적인 하나님의 생각이며 하나님도 공동체로 존재하신다. <br> 하나님, 예수님, 성령님은 세 분
								하나님이시며, 또 완전한 하나라고 말씀하신다. … 그런데 사단 또한 연합의 비밀을 우리보다 잘 아는 듯, <br>
								우리를 하나 되지 못하게 막는다. 공동체에서 떼어놓기 위해 유혹하며 최선을 다한다. … 공동체 안에 들어가 함께
								믿음을 지켜가고, 함께 기도하라.<br> 하나님 안에서 공동체를 이루고 신앙생활을 이어간다는 건 크나큰
								축복이다. <br> - 184,185쪽<br>
							</p>

							<p>
								당신은 야베스인가, 르우벤인가? <br> 혹시 르우벤처럼 하나님의 자녀라는 엄청난 유업을 보지 못한 채
								욕심에 이끌려 살지는 않는가?<br> 원수가 유혹하는 헛된 욕심에 붙들려 하나님의 유업을 쉽게 내던지지는
								않는가?<br> 아니면 흙수저로 태어난 삶을 비관하며 염세적으로 세상을 바라보진 않는가? <br>
								눈을 들어 주님을 바라보자. 모든 생사화복의 주관자는 오직 우리 주님이시다.<br> 영원히 목마르지 않은
								솟아나는 샘물을 부어주시는 분이 내 아버지 하나님이시다. <br> 우리 하나님만이 나를 도우시고 환난에서
								벗어나 근심이 없게 하시는 분임을 믿고 기도하자.<br> 고통의 삶이 귀한 삶으로 변화될 것이다. <br>
								- 223,224쪽
							</p>

							<p>
								기도하지 않고는 세상의 주관자, 악의 영들을 상대할 수 없다. <br> 원수는 우리가 잠들기를 원한다.
								기도 시간을 타협하라고<br> 끊임없이 유혹한다. … 이 계략에 힘없이 끌려가는 사람이 되지 말자. <br>
								최소 하루 한 시간 기도하는 삶에 생명을 걸자.<br> 기도의 자리를 지켜내는 자에게 하나님께서 소원을
								두시고, 하나님나라의 귀한 일꾼으로 그 삶을 쓰실 것이다. <br> - 260,261쪽<br>
							</p>

							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>

					<li id="어_성경"><span> <a href="#estimate"><img src="images/Book03.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[어? 성경이 읽어지네!]</a>
							</h3>
							<p>
								| 도서소개 |<br>
								<br> 새해만 되면 성경을 여시지요? <br> "올해는 꼭 한 번 읽어보고야 말겠다~~!"<br>
								그러면서 흘러온 세월에 창세기 앞만 여러 번 읽고 또 읽었던 그 흔적, 쫀 자리 빅뱅, 진화론을 배웠던 우리 앞에
								에덴동산, 선악과, 노아홍수, 바벨탑... <br> 이런 신화같은 내용부터 해독되지 않았기 때문입니다.
								"왜 선악과를 만들어서 인간이 죄를 짓게 하셨을까? 그 다음부터는 진도가 안나가네~~ㅠㅠ" <br> 그런데
								바로 그 쫀 자리, 거기가 생장점 부위랍니다. 거기만 터뜨리면 "어? 성경이 읽어지네!" 당신도 그럴 걸요?<br>

							</p>
					</span></li>

				<br><br><br><br><br><br><br>
					<hr>

					<li id="참_신앙"><span> <a href="#estimate"><img src="images/Book04.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[참 신앙과 거짓신앙]</a>
							</h3>
							<p>

								| 도서소개 | <br>
								<br> 온전한 그리스도인으로 자라게 하는 14가지 점검 질문 『우리가 하나님을 오해했다』의 저자 김형익
								목사의 신간!<br> 이찬수 목사, 이정규 목사, 심성현 강도사, 서자선 집사 추천! “이 책으로 많은
								사람이 자신의 신앙과 삶을 돌아보면 좋겠습니다.”<br> “참된 신앙이 주는 ‘믿고 말할 수 없는
								영광스러운 즐거움으로 기뻐하기를 원하는 성도’라면 이 책을 통해 배부름을 경험하게 될 것입니다.” <br>

								“18세기의 탁월한 걸작 『신앙감정론』을 통해 누릴 수 있는 유익을 21세기 한국의 독자들은 이 책을 통해 누릴 수
								있을 것입니다.”<br> 2014년, 『우리가 하나님을 오해했다』 출간으로 하나님에 대한 바른 이해가
								신앙에 어떻게 영향을 미치는지 보여 준 김형익 목사가 <br> 이번에는 『참 신앙과 거짓 신앙』이라는
								주제로 한국 교회 안에 만연한 기독교 신앙에 대한 오해들을 짚어 준다. <br> 이 책을 통해 저자는
								마지막 날 모든 사람이 직면하게 될 “당신은 참된 그리스도인입니까?”라는 질문을 시작으로 <br> 우리
								모두가 가장 중요하고 시급하게 여겨야 할 회심과 구원의 문제를 다룬다. <br> 또한 자신이 진정으로
								거듭났는지, 자신의 구원을 어떻게 확인할 수 있는지 궁금해하는 성도들을 위해 <br> 성경이 말하는 참
								신앙의 표지를 14개의 질문과 함께 설명함과 동시에, 영접 기도를 하고, 부흥회 때 강단 앞으로<br>
								나가서 결신하고, 세례를 받고, 오랫동안 교회에 다니고, 성경을 많이 알고 있는 것 등의 가시적인 증거만으로 구원을
								확신하는 사람들의 오해를 바로잡아 준다. <br> 많은 사람이 교회에 다니는 것이 곧 예수를 믿는 것이라는
								안일한 생각을 가지고 있지만 성경은 결코 그렇게 말하지 않는다. <br> 심지어 주의 이름으로 사역하고
								헌신한 사람들도 “불법을 행하는 자들아 내게서 떠나가라”는 엄중한 심판을 받을 수 있다(마 7:23).<br>

								물론 참 신앙과 거짓 신앙은 겉으로 쉽게 구분되지 않고 분별에 있어서도 신중을 기해야 하지만<br> 성경은
								“너희는 믿음 안에 있는가 너희 자신을 시험하고 너희 자신을 확증하라”(고후 13:5)는 말씀과 함께 자신의 영혼을
								살필 수 있는 선명한 기준들을 제시한다. <br> 정곡을 찌르는 질문과 그에 대한 성경적인 통찰, 그리고
								목회자의 따뜻한 마음을 담아 저자는 모든 성도들이 참된 신앙의 길로 들어설 것을 간곡히 권면한다.<br>
								이 땅에 사는 동안 선하신 하나님을 바르게 알고, 사랑하고, 잘 믿는 것보다 중요한 일은 없다. <br>

								하나님 앞에서 겸손히 자신을 돌아보며, 매일 매 순간 복음 안에서 그리스도를 향해 나아가는 성도들만이<br>
								“주를 두려워하는 자를 위하여 쌓아두신 은혜 곧 주께 피하는 자를 위하여 인생 앞에 베푸신 은혜”(시 31:19)를
								풍성히 누리게 될 것이다.<br>
							</p>

					</span></li>

				<br><br><br><br><br><br><br>
					<hr>

					<li id="팬인가_제자인가"><span> <a href="#estimate"><img src="images/Book05.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[팬인가, 제자인가]</a>
							</h3>
							<p>
								| 도서 소개 |<br>
								<br>
							<p>
								핵심만 간추린 《팬인가, 제자인가》<br> 스페셜 에디션 남김 없이, 후퇴 없이, 후회 없이 살려는 예수의
								제자들을 위한 필독서<br>
							</p>

							<p>
								“나는 더 이상 팬이 아니다!” “참 좋은 책입니다. ‘나를 따르라’라고 하시는 예수님의 충격적인 부르심은 때로는
								고통스럽습니다. <br> 하지만 결국은 그것이 가장 행복한 부르심입니다. 제자의 삶은, 바로 예수님과
								사랑에 빠진 삶으로의 초대이기 때문입니다. <br> 저는 이 책의 메시지처럼 제자로 예수님을 따르고
								싶습니다. 뜨겁게 예수님을 사랑하고 싶습니다.” _ 유기성 선한목자교회 담임목사 <br>
							</p>

							<p>
								당신은 예수님의 제자인가, 아니면 단순한 팬인가?<br> 카일 아이들먼은 요즘 교회에서 좀처럼 듣기 힘든
								솔직한 어조로, 크리스천의 진정한 의미가 무엇인지를 다시 생각해볼 것을 촉구하고 있다.<br> 예수님을
								따르는 길은 급진적으로 보일 수 있다. 그 길의 방점은 용서보다 회개, 구원보다 항복, 생명보다 죽음에 있다. 그
								길은 편안하고 쉬운 길이 아니다. <br> 사이드라인 밖에 앉아 있는 삶과는 거리가 멀다. 이 책은 자기
								십자가를 지고 예수님을 따라 참된 기쁨과 생명으로 이어지는 길로 가라는 초대의 메시지다.<br>
							</p>

							<p>
								예수 팔로워들을 위한 최고의 책 《팬인가, 제자인가》의 에센셜 에디션 《팬인가, 제자인가》는 <br>
								예수님의 팬인 것으로 만족하고 살던 수많은 크리스천들을 깨우며 큰 반향을 일으켰다.<br> 그 메시지에
								도전을 받아 예수님의 제자로 살기를 결단한 이들이 늘어나면서 전 세계적으로 ‘not a fan’ 운동이 확산되고
								있다.<br> 이 책은 《팬인가, 제자인가》의 핵심 메시지를 더욱 분명하고 명료하게 담았다. <br>
							</p>

							<p>
								제자, 가장 행복한 부르심 당신이 진짜 패인지 제자인지 진단하라 예수님을 ‘믿기로’ 결단했는가, 아니면 예수님을
								‘따르기로’ 결단했는가? <br> ‘믿기로 결단만’ 하는 것과 ‘따르기로 결단’하는 것은 차이가 있다.
								예수님을 믿기로 결단하고 따르지 않는 사람은 팬에 불과하다. <br> 성경적 믿음은 단순히 머리로
								받아들이거나 말로 인정하는 데서 끝나는 것이 아니다. 믿기로 결단하고 따르는 이가 제자다.<br>
							</p>
							</p>
					</span></li>

				<br><br><br><br><br><br><br>
					<hr>

					<li id="매일성경_2021_11/12"><span> <a href="#estimate"> <img src="images/Book06.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[매일성경 2021 11/12]</a>
							</h3>
							<p>
								| 책 소개 | <br>
								<br>
							<p>
								묵상과 설교 지도자를 위한 묵상 자료 「묵상과 설교」는 <br> 「매일성경」을 통해 바른 성경묵상(QT)의
								기준을 제시해온 성서유니온선교회가 <br> 성경묵상을 기반으로 말씀 중심의 목회를 추구하는 사역자들을
								도우려고 만들었습니다. <br>
							<p>
								「묵상과 설교」는 「매일성경」의 본문 순서를 따라 본문 분석, 적용 착안점, 설교 아웃라인 등<br>
								묵상에서 설교까지의 과정을 체계적으로 제시하며, 그룹큐티나눔에서 좀 더 상세한 해설을 제공하여 풍성한 나눔이
								이루어지도록 돕습니다.<br>
							</p>

							<p>
								「묵상과 설교」를 통해 목양과 말씀사역이 통합을 이루며 더 깊은 성경 연구와 <br> 실천목회의 체험을
								나눌 수 있는 목회자들의 연대가 형성되도록 성서유니온선교회가 함께하겠습니다. <br>
							</p>

							<p>
								많은 설교와 목양으로 바쁜 목회자들이 더욱 효율적으로 깊이 있는 묵상과 개인 성경 연구를 하도록 돕습니다. <br>
								본문에 대한 분석과 주해, 적용 착안점, 설교 아웃라인 등 묵상에서 설교까지의 과정을 체계 있게 제시함으로써 설교를
								돕습니다.<br>
							</p>

							<p>
								최근 연구 경향을 반영한 전공 교수들의 꼼꼼한 본문 주해를 통해 역사적 의미에 기초한 적용을 할 수 있도록
								돕습니다. <br> 핵심을 짚어주는 설교가이드는 설교자의 독특한 설교 구상과 전개를 방해하지 않으면서
								충실한 설교를 작성할 수 있도록 돕습니다. <br>
							</p>

							<p>
								성경교사와 소그룹 인도자에게도 소그룹 인도 준비를 위한 세밀한 가이드를 제공하며 개인 묵상을 위한 참고서로도
								손색없습니다.<br> 「묵상과 설교」는 더 깊은 성경 이해, 더 깊은 묵상, 더 깊은 설교를 돕습니다.<br>
							</p>
							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>

					<li id="매일성경_2022_01/02"><span> <a href="#estimate"><img src="images/Book07.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[매일성경 2022 01/02]</a>
							</h3>
							<p>
								| 책 소개 | <br>
								<br>
							<p>
								묵상과 설교 지도자를 위한 묵상 자료 「묵상과 설교」는 <br> 「매일성경」을 통해 바른 성경묵상(QT)의
								기준을 제시해온 성서유니온선교회가 <br> 성경묵상을 기반으로 말씀 중심의 목회를 추구하는 사역자들을
								도우려고 만들었습니다. <br>
							<p>
								「묵상과 설교」는 「매일성경」의 본문 순서를 따라 본문 분석, 적용 착안점, 설교 아웃라인 등<br>
								묵상에서 설교까지의 과정을 체계적으로 제시하며, 그룹큐티나눔에서 좀 더 상세한 해설을 제공하여 풍성한 나눔이
								이루어지도록 돕습니다.<br>
							</p>

							<p>
								「묵상과 설교」를 통해 목양과 말씀사역이 통합을 이루며 더 깊은 성경 연구와 <br> 실천목회의 체험을
								나눌 수 있는 목회자들의 연대가 형성되도록 성서유니온선교회가 함께하겠습니다. <br>
							</p>

							<p>
								많은 설교와 목양으로 바쁜 목회자들이 더욱 효율적으로 깊이 있는 묵상과 개인 성경 연구를 하도록 돕습니다. <br>
								본문에 대한 분석과 주해, 적용 착안점, 설교 아웃라인 등 묵상에서 설교까지의 과정을 체계 있게 제시함으로써 설교를
								돕습니다.<br>
							</p>

							<p>
								최근 연구 경향을 반영한 전공 교수들의 꼼꼼한 본문 주해를 통해 역사적 의미에 기초한 적용을 할 수 있도록
								돕습니다. <br> 핵심을 짚어주는 설교가이드는 설교자의 독특한 설교 구상과 전개를 방해하지 않으면서
								충실한 설교를 작성할 수 있도록 돕습니다. <br>
							</p>

							<p>
								성경교사와 소그룹 인도자에게도 소그룹 인도 준비를 위한 세밀한 가이드를 제공하며 개인 묵상을 위한 참고서로도
								손색없습니다.<br> 「묵상과 설교」는 더 깊은 성경 이해, 더 깊은 묵상, 더 깊은 설교를 돕습니다.<br>
							</p>
							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>

					<li id="어린이_매일성경_2022_01/02"><span> <a href="#estimate"><img src="images/Book08.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[어린이 매일성경 2022 01/02]</a>
							</h3>
							<p>
							<p>
								| 책 소개 | <br> ‘스스로 성경을 읽는 초등학생 매일성경’<br>
							</p>


							<p>
								"고학년 어린이 매일성경"은 초등학생 어린이가 날마다 성경을 재미있게 읽으면서 하나님과 하나님이 나와
								우리에게 바라시는 모습을 찾게 합니다.<br>
							</p>

							<p>
								* 주중큐티 성경 본문: 쉬운성경 7-8절 읽고 발견해요: 소리 내어 읽기,<br> 밑줄을 그으면서
								능동적으로 읽기, 본문 심화 질문에 답하며 읽기 말씀을 이해해요:<br>
							</p>

							<p>
								오늘 본문을 어린이의 눈높이로 쉽게 풀이 기도하고 실천해요: 기도문을 스스로 써서 기도하고, 묵상한 말씀을 실제
								생활에서 실천하기<br>
							</p>

							<p>
								* 주말큐티 토요큐티: 영어로 한 문장 큐티, QR 코드로 원어민 발음 듣기, 생각하기, 활동하기, 기도하기 주일
								큐티: 함께 읽기,<br> 온 가정이 함께 예배하는 큐티<br>
							</p>

							<p>
								* 함께 읽는 주일 공과 읽기 중심의 주일 공과 평소에 스스로 성경을 읽고 묵상을 하도록 <br> 주일에는
								다함께 말씀을 읽고 나누기 주일 설교 PPT, 교사지도안 특별자료(성서유니온 홈페이지 온라인 제공)<br>
							</p>
							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>

					<li id="청소년_매일성경_2022_01/02"><span> <a href="#estimate"><img src="images/Book09.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[청소년 매일성경 2022 01/02]</a>
							</h3>
							<p>
							<p>
								| 책 소개 |<br>
								<br> 대한민국의 첫 큐티책 「매일성경」과 함께 큐티운동을 이끌어 온 성서유니온선교회에서<br>
								중고등학생들과 함께 질문하고 고민하고 기도하며 만드는, 청소년 대표 큐티책!<br>
							</p>

							<p>
								청소년 매일성경의 특징<br> - 장년매일성경과 동일한 본문을 묵상하여, 6년 동안 성경 66권을 단 한
								절도 빠짐없이 큐티하도록 돕습니다.<br>
							</p>
							<p>
								- 성서유니온의 묵상법인 “하나님은 어떤 분입니까?”와 “나(우리)에게 주시는 교훈은 무엇입니까?”를 중심으로,
								청소년 눈높이에 맞는 쉬운 해설과 질문을 이끄는 적용을 수록해 놓았습니다.<br>
							</p>
							<p>
								- 성서유니온 홈페이지(www.su.or.kr)에서 공과해설과 설교자료를 제공하고, 성서유니온의 강사진들이 필요한
								곳이면 어디든지 달려가 청소년 매일성경의 활용법을 가르칩니다.<br>
							</p>
							<p>
								- 주중에 개인적으로 묵상한 말씀을 주일에 교회에서 함께 묵상할 수 있도록, 주일공과교재를 함께 수록해 놓았습니다.<br>
							</p>
							<p>
								- 신앙과 진로에 관한 읽을거리와 만화, 다양한 이벤트가 수록되어 있습니다.<br>
							</p>

							</p>
					</span></li>

					<br><br><br><br><br><br><br>
					<hr>

					<li id="큐티아이_2022_01/02"><span> <a href="#estimate"><img src="images/Book10.jpg" width="345px" height="500px"></a>
							<h3>
								<a href="#estimate">[큐티아이 2022 01/02]</a>
							</h3>
							<p>
							<p>
								| 도서소개 |<br>
							<p>
								우리 아이를 큐티하는 아이로!<br> 엄마랑 아빠랑 같이 하는 유아 매일성경<br> 우리 아이의
								큐티 시작, 큐티아이로!<br>
							</p>

							<p>
								소개 엄마랑 아빠랑 같이 하는 유아매일성경! <br> 큐티아이는 7세 이하의 유아들이 하나님 말씀인 성경을
								배우며, <br> 하나님을 사랑하고 이웃을 사랑하는 하나님의 백성으로 자라도록 돕기 위해 탄생했습니다. <br>
								이 책은 무엇보다 어려서부터 우리 자녀들이 성경적인 가치관을 품고 자라가도록 <br> 창세기에서
								요한계시록까지 성경의 이야기를 들려주면서 하나님을 만나도록 도와줄 것입니다.<br>
							</p>

							<p>
								큐티아이는 가정에서 부모와 함께, 교회에서 친구들과 함께 공과로 사용할 수 있습니다.<br> 매일성경과
								같은 본문으로, 온 교회, 온 연령이 같은 말씀으로 가정과 교회에서 함께 묵상하고 나눌 수 있게 구성되어 있습니다.<br>
							</p>

							<p>
								특히 큐티아이는 성경 이야기를 한글, 미술, 노래, 영어, 놀이, 숫자 등 다양한 활동과 함께 배울 수 있어<br>
								신앙과 더불어 유아의 전인격적인 성장에 유익합니다. <br> 큐티아이는 언약의 말씀인 하나님의 말씀을 일곱
								가지 다양한 방식(읽기, 외우기, 깨닫기, 반복하기, 함께하기)으로 배웁니다. <br> 매일 숙제하듯
								성경을 읽는 게 아니라, 큐티아이와 함께 조금씩 놀다 보면, 어느 순간 성경의 이야기 속에 젖어드는 특별한 방식으로
								성경 이야기를 만납니다. <br> 유아를 둔 부모라면, 지금이야말로 자녀의 신앙교육을 시작하기 가장 좋을
								때입니다. <br> 이 시간을 흘려보내지 말고, 최고의 시기에 큐티아이와 함께 시작할 수 있는 것을 큰
								즐거움으로 여기시길 바랍니다.<br>
							</p>

							<br><br><br><br><br><br><br>
							<hr>

					</span></li>
				</ul>
				</div>
				
				
	
				
	 <div id="calculate">
    <h1>계산목록</h1>
	
		<table id="estimate" align="center">
			
			<colgroup> <!-- 1. colgroup :  태그를 그룹으로 관리. 행이 아닌 열단위로 스타일 제어 가능 -->
				<col width="380px"> <col width="160px"> <col width="*"> <!-- * : 나머지 사이즈 -->
			</colgroup>
			
			<!--2. 테이블 헤드-->
			<thead>
				<tr> <th>선택하신 책</th> <th>가격</th> <th>선택</th> </tr>
			</thead>
			
			<!--3. 테이블 푸터 -->
			<tfoot>
				<tr> <th>총합</th> <td colspan="2"><input type="text" name="total" id="total" value="0" readonly></td> </tr>
			</tfoot>
			
			<!--4. 테이블 본문 : onclick의 함수로 다 car()를 해놓은게 인상적이다. car()의 기능은 위에서 확인해보자-->
			<tbody>
				<tr>
					<td><label for="opt1"><a href="#기도시작반">기도시작반</a></label></td> <td>12,600원</td> <td><input type="checkbox" name="opt1" id="opt1" value="12600" onclick="cal()"></td>
				</tr>
				<tr>
					<td><label for="opt2"><a href="#기도응답반">기도응답반</a></label></td> <td>12,600원</td> <td><input type="checkbox" name="opt2" id="opt2" value="12600" onclick="cal()"></td>
				</tr>
				<tr>
					<td><label for="opt3"><a href="#어_성경">어?성경이 읽어지네!</a></label></td> <td>20,700원</td> <td><input type="checkbox" name="opt3" id="opt3" value="20700" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt4"><a href="#참_신앙">참 신앙과 거짓신앙</a></label></td> <td>16,200원</td> <td><input type="checkbox" name="opt4" id="opt4" value="16200" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt5"><a href="#팬인가_제자인가">팬인가, 제자인가</a></label></td> <td>13,500원</td> <td><input type="checkbox" name="opt5" id="opt5" value="13500" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt6"><a href="#매일성경_2021_11/12">매일성경 2021 11/12</a></label></td> <td>4,280원</td> <td><input type="checkbox" name="opt6" id="opt6" value="4280" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt7"><a href="#매일성경_2022_01/02">매일성경 2022 01/02</a></label></td> <td>4,280원</td> <td><input type="checkbox" name="opt7" id="opt7" value="4280" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt8"><a href="#어린이_매일성경_2022_01/02">어린이 매일성경 2022 01/02</a></label></td> <td>3,800원</td> <td><input type="checkbox" name="opt8" id="opt8" value="3800" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt9"><a href="#청소년_매일성경_2022_01/02">청소년 매일성경 2022 01/02</a></label></td> <td>3,800원</td> <td><input type="checkbox" name="opt9" id="opt9" value="3800" onclick="cal()"></td>
				</tr>
				
				<tr>
					<td><label for="opt10"><a href="#큐티아이_2022_01/02">큐티아이 2022 01/02</a></label></td> <td>5,700원</td> <td><input type="checkbox" name="opt10" id="opt10" value="5700" onclick="cal()"></td>
				</tr>
				
			</tbody>
			
		</table>
		<p style="text-align: center;"><a href="test.jsp">계산하시겠습니까?</a></p><!--로그인 창으로 이동-->
		<br><br><br>
		<p style="text-align: center; text-decoration: underline;"><a href="#navbar"> 책 목록을 다시 볼래요~ </a></p><!--맨 위로 이동-->
		
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