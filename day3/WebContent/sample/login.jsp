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
		<div><input placeholder="아이디" name="uId"></div>
		<div><input placeholder="패스워드" type="password" name="pwd"></div>
		<div>
		<input type="radio" name="stat" value="U" checked />일반회원
		<input type="radio" name="stat" value="A"/>관리자
		</div>
		<div><input type="submit" value="로그인"></div>
	</form>
</body>
</html>
<script>
	
</script>
