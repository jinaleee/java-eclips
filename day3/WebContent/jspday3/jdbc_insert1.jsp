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
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");

		Statement stmt = null;

		try {
			String sql = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE) VALUES('" + stuNo + "','" + stuName + "', '" + stuDept + "', '" + stuGrade + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			out.println("STUDENT ���̺� ������ �����߽��ϴ�.");
		} catch (SQLException ex) {
			out.println("STUDENT ���̺� ������ �����߽��ϴ�.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
</body>
</html>