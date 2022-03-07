<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표현법 : 뜬금없는 $는 EL이다</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<!--

1) EL의 특징 : JSP에 내장되어 있다. 코드가 깔끔하다. 
   단, 제어문(반복문,조건문)의 기능은 없다. 간단한 계산은 가능하다. 따라서 JSTL과 같이 사용한다.
2) JSTL의 특징 : 외부라이브러리(jar파일)가 필요하다. 제어문연산이 가능하다. 
   따라서 EL은 단독으로 쓰지 않고 JSTL과 혼합해서 쓴다.

-->

<!-- EL의 형식 : ${변수 or 식} -->
${2 + 5} <br>
${4 / 5} <br>
${7 mod 5} <br> <!-- 나머지 -->
${2 < 3} <br>
${3.1 le 3.2} <br> <!-- LEss(작다) -->
${(5>3) ? 5 : 3} <br> <!-- 삼항연산자  -->

</body>
</html>