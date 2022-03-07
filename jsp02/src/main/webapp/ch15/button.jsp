<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 1. 이거 켜 줘야함 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>버튼 : 이름마다 색깔이 다 다른걸 확인할 수 있다.</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>

	<h2>일반버튼</h2>
	<button type="button">버튼</button>

	<h2>부트스트랩 버튼</h2>
	<!-- 2. 부트스트랩에 만들어진 css를 적용한 버튼들 -->
	<button type="button" class="btn">버튼</button>
	<button type="button" class="btn btn-default">버튼</button>
	<button type="button" class="btn btn-primary">Primary</button>
	<button type="button" class="btn btn-secondary">Secondary</button>
	<button type="button" class="btn btn-success">Success</button>
	<button type="button" class="btn btn-danger">Danger</button>
	<button type="button" class="btn btn-warning">Warning</button>
	<button type="button" class="btn btn-info">Info</button>
	<button type="button" class="btn btn-light">Light</button>
	<button type="button" class="btn btn-dark">Dark</button>
	<button type="button" class="btn btn-link">Link</button>

	<br>
	<br>

	<!-- 3. 큰 버튼 -->
	<button type="button" class="btn btn-default btn-lg">버튼</button>
	<button type="button" class="btn btn-primary btn-lg">Primary</button>
	<button type="button" class="btn btn-secondary btn-lg">Secondary</button>
	<button type="button" class="btn btn-success btn-lg">Success</button>
	<button type="button" class="btn btn-danger btn-lg">Danger</button>
	<button type="button" class="btn btn-warning btn-lg">Warning</button>
	<button type="button" class="btn btn-info btn-lg">Info</button>
	<button type="button" class="btn btn-light btn-lg">Light</button>
	<button type="button" class="btn btn-dark btn-lg">Dark</button>

	<br>
	<br>

	<!-- 4. 작은 버튼 -->
	<button type="button" class="btn btn-default btn-sm">버튼</button>
	<button type="button" class="btn btn-primary btn-sm">Primary</button>
	<button type="button" class="btn btn-secondary btn-sm">Secondary</button>
	<button type="button" class="btn btn-success btn-sm">Success</button>
	<button type="button" class="btn btn-danger btn-sm">Danger</button>
	<button type="button" class="btn btn-warning btn-sm">Warning</button>
	<button type="button" class="btn btn-info btn-sm">Info</button>
	<button type="button" class="btn btn-light btn-sm">Light</button>
	<button type="button" class="btn btn-dark btn-sm">Dark</button>



</body>
</html>
