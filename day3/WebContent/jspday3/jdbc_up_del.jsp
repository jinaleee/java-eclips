<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<form action="jdbc_update.jsp" method="post" name = "up">
		<div>학번 : <input type="text" name="stuNo"></div>
		<div>학과 : <input type="text" name="stuDept"></div>
		<div>학년 : <input type="text" name="stuGrade"></div>
		<div><input type="submit" value="확인"></div>
	</form>

</body>
</html>




