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
	<%@ include file="../jdbc_set.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String phone = rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
				String age = rs.getString("AGE") != null ? rs.getString("AGE") : "";
				String addr = rs.getString("ADDR") != null ? rs.getString("ADDR") : "";
			%>
				<input name="uId" value="<%= uId %>" hidden/>
				<div> 이　　름 : <input name="uName" value="<%= rs.getString("U_NAME") %>"></div>
				<div> 비밀번호 : <input name="pwd" type="password"></div>
				<div> 전화번호 : <input name="phone" value="<%= phone %>"></div>
				<div> 나　　이 : <input name="age" value="<%= age %>"></div>
				<div> 주　　소 : <input name="addr" value="<%= addr %>"></div>
			<%
			}
		} catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div><input type="submit" value="수정"></div>
	</form>
	
</body>
</html>
<script>
function back(){
	location.href="user.jsp";
}
</script>