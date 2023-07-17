<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set2.jsp" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String uId = request.getParameter("uId");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String select = "SELECT * FROM JN_USER WHERE ID = '" + uId + "'";
			ResultSet rs = stmt.executeQuery(select);
			if(rs.next()){
				if("Y".equals(rs.getString("BANYN"))){
					String delete = "DELETE FROM JN_USER WHERE ID = '" + uId + "'";
					stmt.executeUpdate(delete);
					out.println("삭제되었습니다.");
				} else {
					out.println("정지된 회원만 삭제할 수 있습니다.");
				} 
			} else {
				out.println("해당 회원이 존재하지 않습니다.");
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<div><input type="button" onclick="back()" value="닫기"></div>
</body>
</html>
<script>
	function back(){
		window.close();
	}
</script>