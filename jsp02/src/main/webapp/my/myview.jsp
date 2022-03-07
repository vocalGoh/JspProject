<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
#form1{float: right;}
#navbar{
background-color:#00BFFF; 
height: 35px;
padding: 0;
}
.ul1{
list-style:none;
display: flex;
padding: 0px;
margin: 0px;
}
.li1{
padding-right: 1.5em;
padding-left: 1em;
margin: 0px;;
}
.li1 > a{color: white;}
.li1:hover > a{color: yellow;}
.li1:hover {background-color: #00A5FF;}
a{text-decoration: none; color: black;}
#footerimg{float: left;}
#loginField{ margin-top: 70px;}
#loginField > input{margin: 10px; width: 40%; height: 40px; }
#btnlogin{background-color: #00BFFF; }
th,td{padding: 10px;}
#myview1{border-bottom: 1px solid; border-top: 1px solid;}
</style>



</head>
<body>
 <div class="container">
  <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid==null}">
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/join.do">회원가입 </a>| </span>
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/login.do">로그인</a></span>
   </c:when>
   <c:otherwise>
    <span style="font-size: 0.9em;"><a href="${path}/my_member_servlet/view.do">내정보</a></span>
    <span style="font-size: 0.9em;"><a href="#">내글</a></span>
    <span><strong style="color: blue;">${sessionScope.result}</strong>님 </span>
    <span style="font-size: 0.9em;"><a href="${path}/my_member_servlet/logout.do">로그아웃</a></span>
   </c:otherwise>
  </c:choose>
  </div>
 </div>
 <hr>
 <div class="container">
  <a href="list.jsp"><img width="363px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" ></a>
  <div id="form1">
   <form action="" method="post" name="form1" >
    <input name="keyword">
    <button id="btnsearch">검색</button>
   </form>
  </div>
  <nav class="navbar" id="navbar"> 
   <ul class="ul1">
    <li class="li1"><a href="#">인기글</a></li>
    <li class="li1"><a href="#">유머/정보</a></li>
    <li class="li1"><a href="#">스포츠</a></li>
    <li class="li1"><a href="#">일반</a></li>
    <li class="li1"><a href="#">게임</a></li>
    <li class="li1"><a href="#">커뮤니티</a></li>
   </ul>
  </nav>
  <br>
  <h2>${dto.tab}</h2>
  <br>
  <table style="width: 100%; border-bottom: 1px solid;"  id="myview" >
   <tr id="myview1">
    <th  >${dto.subject}</th>
    <td  style="text-align: right;" ><fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd hh:mm"/> </td>
   </tr>
   <tr>
    <td style="width: 80%">닉네임 : ${dto.writer}</td>
    <td>조회수 ${dto.readcount} 추천수</td>
    
   </tr>
   <c:if test="${dto.filename != '-'}">
   <tr>
    <td>
     <img style="width: 100%"  src="../images/${dto.filename}">
    </td>
   </tr>
   </c:if>
   <tr>
    <td>${dto.content}</td>
   </tr>
  </table>
  
  
  
  
  <hr>
  <div class="container" id="footer" >
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  
 </div>

 
</body>
</html>