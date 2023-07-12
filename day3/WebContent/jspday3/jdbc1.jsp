<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
<style>
	table{
		border-collapse : collapse;
	}
</style>
</head>
<body>
<%@ include file="../jdbc_set.jsp" %>
<form action="hidden_event.jsp" name="list">
	<table width="300" border="1">
	<input name="stuNo" hidden />
		<tr>
			<th></th>
			<th>이름</th>
			<th>학번</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "select * from student";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String name = rs.getString("STU_NAME");
					String stuNo = rs.getString("STU_NO");
		%>
			<tr>
				<td><input type="radio" name="stu" value="<%= stuNo %>"></td>
				<td><%=name%></td>
				<td><%=stuNo%></td>
			</tr>
		<%
				}
			} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	<input type="button" onclick="update()" value="수정" />
	</form>
</body>
</html>
<script>
	function update(){
		var form = document.list;
		$("input:radio[name=stu]:checked").each(function(i,val) {
			form.stuNo.value = val.value;
			form.submit();
		});
	}
</script>