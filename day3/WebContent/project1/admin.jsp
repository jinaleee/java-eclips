<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 페이지</h1>
<hr>
<div><input type="button" value="회원 관리" onclick="a_user()"> <input type="button" value="예약 관리" onclick="a_book()"> <input type="button" value="메인으로" onclick="back()"></div>
</body>
</html>
<script>
	function a_user(){
		location.href = "a_user.jsp";
	}
	function a_book(){
		location.href = "a_book.jsp";
	}
	function back(){
		location.href = "home.jsp";
	}
</script>