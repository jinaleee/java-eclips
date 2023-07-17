<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
				out.print("이미 예약된 날짜입니다.");
				%><input type="button" onclick="back()" value="돌아가기"><%
				
			} else {
				sql = "UPDATE JN_ROOM SET ID = '"+ uId +"', NAME = '"+ uName +"', ROOM = '"+ room +"', STARTDATE ='"+ startdate +"', LASTDATE='"+lastdate+"', PAX='"+pax+"', BFYN='"+bf+"', POOLYN = '"+pool+"', RES = '"+res+"' WHERE NUM = '" + num + "'";
				stmt.executeUpdate(sql);
				out.print("수정되었습니다.");
				%><input type="button" onclick="window.close();" value="닫기"><%
			}
		} catch (SQLException ex) {
			out.println("수정 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		}
	%>
	</body>
</html>
<script>
	function back(){
		location.href = "a_event.jsp?num=<%= num %>";
		
	}
</script>