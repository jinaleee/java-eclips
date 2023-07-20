<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<style>	
	.btns{
		margin : 40px;
		text-align: center;
	}
	.btn{
		border : none;
		background-color : rgb(175, 160, 136);
		border-radius : 5px;
		padding : 12px 30px;
		margin : 0px 10px;
		color : white;
		opacity: 1;
  		transition: opacity 0.3s;
	}
	.btn:hover{
		background-color : rgb(139, 124, 102);
		opacity: 0.7;
	}
	input[type="button"]:hover {
	  	cursor: pointer;
	}
	.text{
		text-align : center;
		margin : 70px;
		line-height : 30px;
	    color: rgb(133 123 107);
	    font-size: 20px;
	    font-weight: 100;
	}
</style>
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
					%><div class="text">삭제되었습니다.<div><%
				} else {
					%><div class="text">정지된 회원만 삭제할 수 있습니다.<div><%
				} 
			} else {
				%><div class="text">해당 회원이 존재하지 않습니다<div><%
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<div class="btns"><input class="btn" type="button" onclick="back()" value="닫기"></div>
</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close();
	}
</script>