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
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '"+ uId +"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.println("중복된 아이디 있음");
				%>
				<input name="flg" value="N" hidden />
				<%
			}else{
				out.println("사용 가능!");
				%>
				<input name="flg" value="Y" hidden />
				<%
			}
			
		} catch(SQLException e){
			out.print(e.getMessage());
		}
		 
	%>
	<input type="button" value="되돌아가기" onclick="back()" />
</form>

</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>