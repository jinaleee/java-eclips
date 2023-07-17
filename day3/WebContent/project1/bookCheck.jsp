<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table{
		border-collapse: collapse;
		text-align : center;
		margin-botton : 20px;
	}
	th, td{
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
<body>
	<%@ include file="../jdbc_set2.jsp" %>
<form name="bookcheck" method="POST">
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
				%><input type="button" onclick="back()" value="돌아가기"><%
			}else{
				sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND LASTDATE = '" + lastdate + "'" ;
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					out.print("이미 예약된 날짜입니다.");
					%><input type="button" onclick="back()" value="돌아가기"><%
				}else{
					sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND (STARTDATE <= '" + startdate + "' AND LASTDATE >= '" + lastdate + "')"; // 수정된 쿼리
	                rs = stmt.executeQuery(sql);
	                if (rs.next()) {
	                    out.print("이미 예약된 날짜입니다.");
	                    %><input type="button" onclick="back()" value="돌아가기"><%
                	}else{

						String insert = "INSERT INTO JN_ROOM(ROOM,ID,NAME,STARTDATE,LASTDATE,PAX,BFYN,POOLYN,RES,BOOK) VALUES('"+ room +"', '" + uId + "', '"+ uName +"', '" + startdate + "', '"+ lastdate +"', '" + pax + "', '" + bf + "', '"+ pool +"','" + res + "','W')";
						stmt.executeUpdate(insert);
						%>
						<h2>예약 신청이 완료되었습니다.</h2>
						<div>
						<table>
							<tr>
								<th>룸</th>
								<th>예약일</th>
								<th>예약자 성함</th>
								<th>숙박 인원</th>
								<th>조식</th>
								<th>인피니티풀</th>
								<th>레스토랑</th>
							</tr>
							<tr>
								<td><%= room %></td>
								<td><%= startdate %> ~ <%= lastdate %></td>
								<td><%= uName %></td>
								<td><%= pax %></td>
								<td><% 
								if(bf.equals("N")){
									out.print("신청 안 함");
								}else{
									out.print("신청");
								}
								%></td>
								<td><%
								if(pool.equals("N")){
									out.print("신청 안 함");
								}else{
									out.print("신청");
								}
								%></td>
								<td><%
								if(res.equals("N")){
									out.print("신청 안 함");
								}else{
									out.print("신청");
								}
								%></td>
							</tr>
						</table>
						</div>
						<div><input type="button" onclick="home()" value="메인으로"></div>
						<%
					}
				}
			}
		}catch(SQLException e){
			out.println("test " + e.getMessage());
		}
	%>
	</form>
</body>
</html>
<script>
	function back(){
		location.href = "book.jsp";
	}
	function home(){
		location.href = "home.jsp";
	}
</script>