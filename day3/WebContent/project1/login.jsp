<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="logincheck.jsp">
		<h1>로그인</h1>
		<hr>
		<div><input placeholder="아이디" name="uId" required></div>
		<div><input placeholder="패스워드" type="password" name="pwd" required></div>
		<div><input type="submit" value="로그인"> <input type="button" value="메인으로" onclick="back()"></div>
	</form>
</body>
</html>
<script>
	function back(){
		location.href="home.jsp";
	}
</script>
