<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<style>
	#container{
		margin : 10px auto;
		width : 1200px;
	}
	table {
		border-collapse : collapse;
		text-align: center;
		margin-botton : 20px;
		font-size : 14px;
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
	fieldset {
		padding: 30px;
		margin-top : 30px;
		border : 1px solid rgb(200, 200, 200);
	}
	h2{
		color : rgb(175, 160, 136);
	}
	hr{
		border-color : rgb(175, 160, 136);
	}	
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
</style>
<header>
    <jsp:include page="home.jsp" />
</header>
<body>
<div id="container">
<h2>예약 관리</h2>
<hr>
	<%@ include file="../jdbc_set2.jsp" %>
	<% 
	String uId = (String) session.getAttribute("userId");
	String uName = (String) session.getAttribute("userName"); 
	%>
	<fieldset>
<form name="bookcheck">
<table>
	<tr>
		<th></th>
		<th>예약번호</th>
		<th>ID</th>
		<th>성함</th>
		<th>예약일</th>
		<th>룸</th>
		<th>숙박 인원</th>
		<th>조식</th>
		<th>인피니티풀</th>
		<th>레스토랑</th>
		<th>예약현황</th>
		<th>고객취소요청</th>
	</tr>
	<%
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try {
			String sql = "SELECT * FROM JN_ROOM ORDER BY STARTDATE ASC" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String num  = rs.getString("NUM");
				String userID  = rs.getString("ID");
				String userName  = rs.getString("NAME");
				String room  = rs.getString("ROOM");
				String startdate  = rs.getString("STARTDATE");
				String lastdate  = rs.getString("LASTDATE");
				String pax = rs.getString("PAX");
				String bf = rs.getString("BFYN").equals("Y") ? "신청" : "신청 안 함";
				String pool = rs.getString("POOLYN").equals("Y") ? "신청" : "신청 안 함";
				String res = rs.getString("RES").equals("Y") ? "신청" : "신청 안 함";
				String book = rs.getString("BOOK");
				String cancel = rs.getString("CANCEL");
				%>
				<tr>
					<td>
					<%
					java.util.Calendar calendar = java.util.Calendar.getInstance();
					calendar.setTime(new java.util.Date()); // 현재 날짜와 시간을 설정
					
					// 현재 날짜에서 하루를 뺀 전일 날짜로 변경
					calendar.add(java.util.Calendar.DAY_OF_MONTH, -1);
					java.util.Date yesterday = calendar.getTime();
					%>
					<% 
					java.util.Date startDate = java.sql.Date.valueOf(startdate);
					if (book.equals("W")) {
					    if (startDate.after(yesterday)) { // 전일 날짜를 사용하여 비교
					        %><input type="radio" name="numCheck" value="<%=num%>"><%
					    }
					}
					%>
					</td>
					<td><%=num%></td>
					<td><%=userID%></td>
					<td><%=userName%></td>
					<td>
					<%
					if (startDate.before(yesterday)) {
						%><span style="text-decoration:line-through;"><%=startdate%> ~ <%=lastdate%></span><%
					}else{
						%><%=startdate%> ~ <%=lastdate%><%
					}
					 %>
					</td>
					<td><%=room%></td>
					<td><%=pax%></td>
					<td><%=bf%></td>
					<td><%=pool%></td>
					<td><%=res%></td>
					<td><% 
					if(book.equals("W")){
						out.print("예약");
					}else if(book.equals("N")){
						%><span style="color:red;">취소</span><%
					}else{
						out.print("체크인 완료");
					}
					%></td>
					<td><%				
					if(cancel.equals("R")){
						%><span style="color:red;">취소요청</span><%
					}else if(cancel.equals("Y")){
						out.print("취소승인");
					}
					%></td>
				</tr>
			<%
			}
		} catch (SQLException ex) {
			out.println("테이블 호출이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	</table>
		<div class="btns">
			<input class="btn" type="button" value="예약정보수정" onclick="a_update()"/>
			<input class="btn" type="button" value="체크인" onclick="a_approval()"/>
			<input class="btn" type="button" value="예약 취소" onclick="a_cancel()"/>
		</div>
	</form>
	<hr>
	<div class="btns">
		<input class="btn" type="button" value="이전으로" onclick="back()" />
	</div>
</fieldset>
</div>
</body>
</html>
<script>
	function back(){
		location.href="admin.jsp";
	}
	function a_update(){
		window.open("a_bookEvent.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=500, height=700");
	}
	function a_approval(){
		window.open("a_approval.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
	function a_cancel(){
		window.open("a_cancel.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
</script>