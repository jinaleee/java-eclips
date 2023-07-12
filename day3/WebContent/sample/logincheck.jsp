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
		String stat = request.getParameter("stat");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "' AND PWD = '" + pwd + "' AND STATUS = '"+stat+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
					if(rs.getString("BANYN").equals("Y")){
						out.println("정지된 회원입니다.");
					}else{
						if(rs.getInt("CNT")<5){
							session.setAttribute("userId", uId);
							session.setAttribute("userName", rs.getString("U_NAME"));
							session.setAttribute("status", rs.getString("STATUS"));
							String update = "UPDATE TBL_USER SET CNT = 0 WHERE U_ID ='"+ uId +"'";
							stmt.executeQuery(update);
							if(stat.equals("U")){
								response.sendRedirect("main.jsp");
							}else if(stat.equals("A")){
								response.sendRedirect("user.jsp");
							}
						}else{
							out.println("5회 오류로 로그인 불가");
					}
				}
			} else {
				String id = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "'";
				rs = stmt.executeQuery(id);
					if(rs.next()){
						if(rs.getInt("CNT")<5){
							String update = "UPDATE TBL_USER SET CNT = CNT+1 WHERE U_ID ='"+ uId +"'";
							stmt.executeQuery(update);
							out.println("비밀번호 오류");
						}else{
							out.println("5회 오류로 로그인 불가");
						}
					}else{
					response.sendRedirect("find.jsp");}
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</body>
</html>
<script>
function back(){
	location.href="login.jsp";
}
</script>