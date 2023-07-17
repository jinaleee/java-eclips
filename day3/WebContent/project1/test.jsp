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
<form name="bookcheck">
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String startdate = request.getParameter("start");
		String lastdate = request.getParameter("last");
		String room = request.getParameter("room");
		String pax = request.getParameter("pax");
		String bf = request.getParameter("bf");
		String pool = request.getParameter("pool");
		String res = request.getParameter("res");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND STARTDATE = '" + startdate + "'" ;
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.print("이미 예약된 날짜 입니다.");
			}else{
				sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND LASTDATE = '" + lastdate + "'" ;
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					out.print("이미 예약된 날짜입니다.");
				}else{
					String insert = "INSERT INTO JN_ROOM(ROOM,ID,STARTDATE,LASTDATE,PAX,BFYN,POOLYN,RES,BOOK) VALUES('"+ room +"', '" + uId + "', '" + startdate + "', '"+ lastdate +"', '" + pax + "', '" + bf + "', '"+ pool +"','" + res + "','W')";
					stmt.executeUpdate(insert);
					out.print("예약 완료되었습니다.");
				}
			}
		}catch(SQLException e){
			out.println("test " + e.getMessage());
		}
	%>
</body>
</html>
<script>
</script>