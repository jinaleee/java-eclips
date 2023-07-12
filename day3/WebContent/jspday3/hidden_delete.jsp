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
		String stu[] = request.getParameterValues("stu");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			for(int i=0; i<stu.length; i++){
				String sql = "DELETE FROM STUDENT WHERE STU_NO = '" + stu[i] + "'";
				rs = stmt.executeQuery(sql);
			}
			out.println("삭제되었습니다.");
			
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div><input type="button" onclick="back()" value="뒤로가기"></div>
	</form>
	
</body>
</html>
<script>
	function back(){
		location.href = "jdbc_checkbox.jsp";
	}
	
</script>