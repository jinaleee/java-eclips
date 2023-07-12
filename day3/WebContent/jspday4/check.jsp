<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
<form name="check">
	<%
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "' AND PWD = '" + pwd + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				session.setAttribute("userId", uId);
				session.setAttribute("userName", rs.getString("U_NAME"));
				session.setAttribute("status", rs.getString("STATUS"));
				response.sendRedirect("main.jsp");
			} else {
				response.sendRedirect("find.jsp");
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</body>
</html>