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
<form name="check">
	<%
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_USER WHERE ID = '" + uId + "' AND PWD = '" + pwd + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
					if(rs.getString("BANYN").equals("Y")){
						out.println("정지된 회원입니다.");
					}else{
						if(rs.getInt("CNT")<5){
							String status = rs.getString("STATUS");
							session.setAttribute("userId", uId);
							session.setAttribute("userName", rs.getString("NAME"));
							session.setAttribute("status", rs.getString("STATUS")); 
							String update = "UPDATE JN_USER SET CNT = 0 WHERE ID ='"+ uId +"'";
							stmt.executeUpdate(update);
							response.sendRedirect("home.jsp");
						}else{
							out.println("5회 오류로 로그인 불가");
					}
				}
			} else {
				String id = "SELECT * FROM JN_USER WHERE ID = '" + uId + "'";
				rs = stmt.executeQuery(id);
					if(rs.next()){
						if(rs.getInt("CNT")<5){
							String update = "UPDATE JN_USER SET CNT = CNT+1 WHERE ID ='"+ uId +"'";
							stmt.executeUpdate(update);
							out.println("비밀번호 오류");
						}else{
							out.println("5회 오류로 로그인 불가");
						}
					}else{
					out.print("로그인 정보를 확인해주세요.");
					}
			}
				
		}catch(SQLException e){
			out.println("test " + e.getMessage());
		}
	%>
	<input type="button" onclick="login()" value="로그인 재시도">
	<input type="button" onclick="back()" value="메인으로">
</form>
</body>
</html>
<script>
function login(){
	location.href="login.jsp";
}
function back(){
	location.href="home.jsp";
}
</script>