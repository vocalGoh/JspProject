<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="emp.EmpDAO" %> <!-- import 했노 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transaction</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
EmpDAO dao=new EmpDAO();


//dao.insert();

dao.insert_batch();
%>


</body>
</html>