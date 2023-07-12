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
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd1");
		String uName = request.getParameter("uName");
		String phone = request.getParameter("phone");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "INSERT INTO TBL_USER VALUES('"+ uId +"', '" + pwd + "', '" + uName + "', '" + phone + "', '" + age + "', '" + addr + "')";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			out.println(uName + "님 가입을 축하합니다!!");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>