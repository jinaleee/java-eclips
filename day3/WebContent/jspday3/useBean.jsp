<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h4>구구단 출력하기</h4>
	<jsp:useBean id="gugudan" class="day3.com.dao.GuGuDan" />
	
	<% for(int i=1;i<=9;i++){
		out.print(gugudan.process(5,i)+"<br>");
		}
	%>
</body>
</html>