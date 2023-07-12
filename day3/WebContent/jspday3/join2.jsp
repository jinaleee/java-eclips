<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<jsp:useBean id="join" class="day3.com.dao.Join"/>
	<jsp:setProperty property="*" name="join" />
	
	<div>아이디 : <%= join.getId() %></div>
	<div>비밀번호 : <%= join.getPwd() %></div>
	<div>이름 : <%= join.getName() %></div>
	<div>나이 : <%= join.getAge() %></div>
	
</body>
</html>