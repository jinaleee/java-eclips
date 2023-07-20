<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		request.setCharacterEncoding("UTF-8");
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName"); 
		String num = request.getParameter("num");
		
		ResultSet rs = null; 
		Statement stmt = null; 
		
			try {
				String sql = "";
				sql = "UPDATE JN_ROOM SET CANCEL = 'R' WHERE NUM='"+num+"'";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				%><div class="text">예약 취소 신청되었습니다.</div><%
			} catch (SQLException ex) {
				out.println("실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
	%>
	<div class="btns"><input class="btn" type="button" onclick="back()" value="닫기"></div>

</body>
</html>
<script>
	function back(){
		window.close();
		window.opener.location.reload();
	}
</script>