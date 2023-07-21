<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String num = request.getParameter("num");
		String uId = request.getParameter("uId");
		String uName = request.getParameter("uName");
		String room = request.getParameter("room");
		String startdate = request.getParameter("startdate");
		String lastdate = request.getParameter("lastdate");
		String pax = request.getParameter("pax");
		String bf = request.getParameter("bf");
		String pool = request.getParameter("pool");
		String res = request.getParameter("res");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND (STARTDATE <= '" + lastdate + "' AND LASTDATE >= '" + startdate + "') AND NUM != '" + num + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				%>
				<div class="text">이미 예약된 날짜입니다.</div>
				<div class="btns"><input class="btn" type="button" onclick="back()" value="돌아가기"></div><%
				
			} else {
				sql = "UPDATE JN_ROOM SET ID = '"+ uId +"', NAME = '"+ uName +"', ROOM = '"+ room +"', STARTDATE ='"+ startdate +"', LASTDATE='"+lastdate+"', PAX='"+pax+"', BFYN='"+bf+"', POOLYN = '"+pool+"', RES = '"+res+"' WHERE NUM = '" + num + "'";
				stmt.executeUpdate(sql);
				%>
				<div class="text">수정되었습니다.</div>
				<div class="btns"><input class="btn" type="button" onclick="clo()" value="닫기"></div><%
			}
		} catch (SQLException ex) {
			out.println("수정 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		}
	%>
	</body>
</html>
<script>
	function clo(){
		window.close();
		window.opener.location.reload();
	}
	function back(){
		location.href = "user_b_event.jsp?num=<%= num %>";
		
	}
</script>