<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	div{
		color:blue;
		font-size:30px;
	}
</style>
<body>
	<jsp:useBean id="calc" class="day3.com.dao.Calc"/>
	<%
		int num = calc.process(3);
		out.println(num + "<br>");
	
	%>
	<jsp:useBean id="human" class="day3.com.dao.Human"/>
	<jsp:setProperty name="human" property="name" value="김철수" />
	<div>
	<div>아이디 : <jsp:getProperty name="human" property="id"/></div>
	<% 
		out.println("아이디 : "+human.getId()+"<br>");
		out.println("이름 : "+human.getName()+"<br>");
		out.println("나이 : "+human.getAge()+"<br>");
		out.println("자바점수 : "+human.getJava()+"<br>");
		out.println("오라클점수 : "+human.getOracle()+"<br>");
	%>
	</div>
</body>
</html>