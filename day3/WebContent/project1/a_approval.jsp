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
		String num = request.getParameter("num");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String select = "SELECT * FROM JN_ROOM WHERE NUM = '" + num + "'";
			ResultSet rs = stmt.executeQuery(select);
				if(rs.next()){
				String sql = "UPDATE JN_ROOM SET BOOK= 'Y' WHERE NUM = '" + num + "'";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				out.println("예약이 확정되었습니다.");
				} else {
					out.println("승인 실패.");
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
		window.opener.getReturn();
	}
</script>