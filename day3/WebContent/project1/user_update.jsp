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
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		String uName = request.getParameter("uName");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String mailYN = request.getParameter("mailYN");
		String msYN = request.getParameter("msYN");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null;

		try {
			String sql = "";
			if(pwd.equals("")||pwd==null){
				sql = "UPDATE JN_USER SET NAME = '"+ uName +"', PHONE = '"+ phone +"', BIRTH ='"+ birth +"', EMAIL='"+email+"', MAILYN='"+mailYN+"', MSYN='"+msYN+"' WHERE ID = '" + uId + "'";
			}else{
				sql = "UPDATE JN_USER SET NAME = '"+ uName +"', PHONE = '"+ phone +"', PWD = '"+ pwd +"', BIRTH ='"+ birth +"', EMAIL='"+email+"', MAILYN='"+mailYN+"', MSYN='"+msYN+"' WHERE ID = '" + uId + "'";
			}
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			session.setAttribute("userId", uId);
			session.setAttribute("userName", uName);
		} catch (SQLException ex) {
			out.println("테이블 삽입에 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
</body>
</html>
<script>
	alert("수정되었습니다");
	/* window.close();	 */
</script>