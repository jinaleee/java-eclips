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
	<form name = "updateForm" action="a_userUpdate.jsp">
	<%@ include file="../jdbc_set2.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_USER WHERE ID = '" + uId +"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String phone = rs.getString("PHONE");
				String email = rs.getString("EMAIL") != null ? rs.getString("EMAIL") : "";
				String birth = rs.getString("BIRTH");
			%>
				<input name="uId" value="<%= uId %>" hidden/>
				<div> 이　　름 : <input name="uName" value="<%= rs.getString("NAME") %>"></div>
				<div> 비밀번호 : <input name="pwd" type="password"></div>
				<div> 전화번호 : <input name="phone" value="<%= phone %>"></div>
				<div> 생년월일 : <input type=date name="birth" value="<%= birth %>"></div>
				<div> 이메일 : <input name="email" value="<%= email %>"></div>
				<div> 메일수신여부 : 수신 <input type=radio name="mailYN" value="Y" checked> 미수신 <input type=radio name="mailYN" value="N"></div>
				<div> 문자수신여부 : 수신 <input type=radio name="msYN" value="Y" checked> 미수신 <input type=radio name="msYN" value="N"></div>
			<%
			}
		} catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div><input type="submit" value="수정">
	<input type="button" onclick="window.close()" value="취소"></div>
	</form>
	
</body>
</html>
<script>
</script>