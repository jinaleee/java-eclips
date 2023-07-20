<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<style>
	table{
		border-collapse: collapse;
		text-align : center;
		margin-botton : 20px;
	}
	#container{
		margin : 10px auto;
		width : 1100px;
	}
	th, td {
		padding : 5px 10px;
	}
	th{
		border-bottom : 2px double rgb(175, 160, 136);
		color : rgb(104, 95, 82);
	}
	td{
		border-bottom : 1px solid rgb(190, 190, 190);
	}
	.btns{
		margin-top : 40px;
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
  		margin-bottom:30px;
	}
	.btn:hover{
		background-color : rgb(139, 124, 102);
		opacity: 0.7;
	}
	h2{
		color : rgb(175, 160, 136);
	}
	h3{
		color : rgb(175, 160, 136);
		text-align:center;
		margin-bottom: 40px;
	}
	hr{
		border-color : rgb(175, 160, 136);
	}
	.text{
		text-align : center;
		margin:100px;
	}
	fieldset {
		padding : 45px;
		margin : 30px 0px;
		border : 1px solid rgb(200, 200, 200);
	}
	table {
  		margin: 0 auto;
	}
</style>
<header>
    <jsp:include page="home.jsp" />
</header>
<body>
	<%@ include file="../jdbc_set2.jsp" %>
	
	<div id="container">
		<h2>예약</h2>
	<hr>
	<fieldset>
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
				%><div class="text">이미 예약된 날짜 입니다.</div>
				<div class="btns"><input class="btn" type="button" onclick="back()" value="돌아가기"></div><%
			}else{
				sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND LASTDATE = '" + lastdate + "'" ;
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					%><div class="text">이미 예약된 날짜 입니다.</div>
					<div class="btns"><input class="btn" type="button" onclick="back()" value="돌아가기"></div><%
				}else{
					sql = "SELECT * FROM JN_ROOM WHERE ROOM = '"+ room +"' AND (STARTDATE <= '" + startdate + "' AND LASTDATE >= '" + lastdate + "')"; // 수정된 쿼리
	                rs = stmt.executeQuery(sql);
	                if (rs.next()) {
	                	%><div class="text">이미 예약된 날짜 입니다.</div>
	                    <div class="btns"><input class="btn" type="button" onclick="back()" value="돌아가기"></div><%
                	}else{

						String insert = "INSERT INTO JN_ROOM(ROOM,ID,NAME,STARTDATE,LASTDATE,PAX,BFYN,POOLYN,RES,BOOK) VALUES('"+ room +"', '" + uId + "', '"+ uName +"', '" + startdate + "', '"+ lastdate +"', '" + pax + "', '" + bf + "', '"+ pool +"','" + res + "','W')";
						stmt.executeUpdate(insert);
						%>
						<h3>예약 신청이 완료되었습니다.</h3>
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
						<div class="btns"><input class="btn" type="button" onclick="main()" value="메인으로"></div>
						<%
					}
				}
			}
		}catch(SQLException e){
			out.println("test " + e.getMessage());
		}
	%>
	</form>
	</fieldset>
	</div>
</body>
</html>
<script>
	function back(){
		location.href = "book.jsp";
	}
	function main(){
		location.href = "main.jsp";
	}
</script>