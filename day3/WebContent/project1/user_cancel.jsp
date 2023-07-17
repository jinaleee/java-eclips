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
	<form name = "updateForm" action="user_update.jsp">
	<%@ include file="../jdbc_set2.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName"); 
		String num = request.getParameter("num");
		
		ResultSet rs = null; 
		Statement stmt = null; 
		
			try {
				String sql = "";
				sql = "UPDATE JN_ROOM SET CANCEL = 'R' WHERE NUM='"+num+"'";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
			} catch (SQLException ex) {
				out.println("테이블 삽입에 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
	%>
	<div><input type="submit" value="수정"></div>
	</form>
	
</body>
</html>
<script>
	alert("취소 요청되었습니다");
	window.close();
</script>