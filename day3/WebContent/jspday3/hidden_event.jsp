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
	<form action="hidden_update.jsp">
	<%@ include file="../jdbc_set.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String stuNo = request.getParameter("stuNo");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
			rs = stmt.executeQuery(sql);
			if(rs.next()){
	%>
		<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
		<div> 이름 : <input name="stuName" value="<%= rs.getString("STU_NAME") %>"></div>
		<div> 학과 : <input name="stuDept" value="<%= rs.getString("STU_DEPT") %>"></div>
		<div> 학년 : <input name="stuGrade" value="<%= rs.getString("STU_GRADE") %>"></div>
		<div> 키　 : <input name="stuHeight" value="<%= rs.getString("STU_HEIGHT") %>"></div>
	<%
			} else {
				out.println("없는 학번");
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div><input type="submit" value="변경"></div>
	</form>
	
</body>
</html>