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
	
	<div>���̵� : <%= join.getId() %></div>
	<div>��й�ȣ : <%= join.getPwd() %></div>
	<div>�̸� : <%= join.getName() %></div>
	<div>���� : <%= join.getAge() %></div>
	
</body>
</html>