<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<body>
<%
    session.invalidate();
%>
</body>
</html>
<script>
	alert("로그아웃 되었습니다.");
	location.href = "main.jsp";
</script>