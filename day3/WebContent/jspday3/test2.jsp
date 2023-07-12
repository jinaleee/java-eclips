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
<%
	request.setCharacterEncoding("EUC-KR");
	String btnKind = request.getParameter("btnKind");
	String stuNo = request.getParameter("stuNo");
	Statement stmt = null;


	%>
</body>
</html>