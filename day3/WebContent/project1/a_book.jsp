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
		padding : 10px 15px;
	}
	.btn{
		margin-top : 20px;
	}
	#container{
		margin : 10px auto;
		width : 1100px;
	}
</style>
<body>
<div id="container">
<h1>예약 관리</h1>
<hr>
	<%@ include file="../jdbc_set2.jsp" %>
	<% 
	String uId = (String) session.getAttribute("userId");
	String uName = (String) session.getAttribute("userName"); 
	%>
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
					java.util.Date today = new java.util.Date();
					java.util.Date startDate = java.sql.Date.valueOf(startdate);
					if(book.equals("W")){
						if(startDate.after(today)){
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
					if (startDate.before(today)) {
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
	<input type="button" value="예약정보수정" onclick="a_update()"/>
	<input type="button" value="체크인" onclick="a_approval()"/>
	<input type="button" value="예약 취소" onclick="a_cancel()"/>
	</form>
	<hr>
<input type="button" value="이전으로" onclick="back()" />
</div>
</body>
</html>
<script>
	function back(){
		location.href="admin.jsp";
	}
	function a_update(){
		window.open("a_bookEvent.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
	function a_approval(){
		window.open("a_approval.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
	function a_cancel(){
		window.open("a_cancel.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
</script>