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
	<jsp:setProperty name="human" property="name" value="��ö��" />
	<div>
	<div>���̵� : <jsp:getProperty name="human" property="id"/></div>
	<% 
		out.println("���̵� : "+human.getId()+"<br>");
		out.println("�̸� : "+human.getName()+"<br>");
		out.println("���� : "+human.getAge()+"<br>");
		out.println("�ڹ����� : "+human.getJava()+"<br>");
		out.println("����Ŭ���� : "+human.getOracle()+"<br>");
	%>
	</div>
</body>
</html>