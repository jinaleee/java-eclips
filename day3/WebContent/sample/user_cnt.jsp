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
<%
		request.setCharacterEncoding("EUC-KR");
		String uId = request.getParameter("uId");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String update = "UPDATE TBL_USER SET CNT = 0 WHERE U_ID = '" + uId + "'";
			stmt.executeUpdate(update);
			out.println("초기화 했습니다.");
		} catch (SQLException ex) {
			out.println("STUDENT 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close();
	}
</script>