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
		String kind = request.getParameter("kind");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String update = "UPDATE JN_USER SET BANYN = '" + kind + "' WHERE ID = '" + uId + "'";
			stmt.executeUpdate(update);
			if(kind.equals("Y")){
				out.println("정지되었습니다.");
			} else {
				out.println("해제되었습니다.");
			}
			
			
		} catch (SQLException ex) {
			out.println("테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<div><input type="button" onclick="back()" value="닫기"></div>
</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close();
	}
</script>