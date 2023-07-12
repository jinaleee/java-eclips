<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");
	String stuNo = request.getParameter("stuNo");
	String stuName = request.getParameter("stuName");
	String stuDept = request.getParameter("stuDept");
	String stuGrade = request.getParameter("stuGrade");
	String stuHeight = request.getParameter("stuHeight");
	ResultSet rs = null; 
	Statement stmt = null; 
	try{
		stmt = conn.createStatement();
		String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "', STU_NAME = '" + stuName + "', STU_HEIGHT = '" + stuHeight + "' WHERE STU_NO = " + stuNo;
		out.println("<div> 학번 : "+stuNo+"</div>");
		out.println("<div> 이름 : "+stuName+"</div>");
		out.println("<div> 학년 : "+stuGrade+"</div>");
		out.println("<div> 학과 : "+stuDept+"</div>");
		stmt.executeUpdate(update);
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>