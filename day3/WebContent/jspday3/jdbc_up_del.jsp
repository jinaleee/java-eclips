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
		<div>�й� : <input type="text" name="stuNo"></div>
		<div>�а� : <input type="text" name="stuDept"></div>
		<div>�г� : <input type="text" name="stuGrade"></div>
		<div><input type="submit" value="Ȯ��"></div>
	</form>

</body>
</html>




