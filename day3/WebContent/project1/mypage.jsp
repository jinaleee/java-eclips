<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table {
		border-collapse : collapse;
		text-align: center;
		margin-botton : 20px;
		font-size : 15px;
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
	.btn {
		margin-top : 20px;
	}
	#container{
		margin : 10px auto;
		width : 1100px;
	}
	legend{
		font-size : 22px;
		font-weight : bold;
	}
	fieldset {
		padding : 45px;
		margin : 30px 0px;
		border : 1px solid rgb(200, 200, 200);
	}
	h2{
		color : rgb(175, 160, 136);
	}
	hr{
		border-color : rgb(175, 160, 136);
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
	.btns{
		margin-top : 30px;
		text-align: center;
	}
	table {
  		margin: 0 auto;
	}
	legend{
		color : rgb(175, 160, 136);
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
	<%@ include file="../jdbc_set2.jsp"%>
	<h2>마이페이지</h2>
	<% 
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName"); 
	%>
	<hr>
	<fieldset>
	<legend> 예약 확인 </legend>
	<form name="bookcheck">
		<table>
			<tr>
				<th>　　</th>
				<th>예약번호</th>
				<th>룸</th>
				<th>예약일</th>
				<th>숙박 인원</th>
				<th>조식</th>
				<th>인피니티풀</th>
				<th>디너 레스토랑</th>
				<th>예약현황</th>
				<th>예약취소</th>
			</tr>
			<%
ResultSet rs = null; // 검색 결과를 담기 위한 객체
Statement stmt = null; // 쿼리 호출을 위한 객체

try {
    String sql = "SELECT * FROM JN_ROOM WHERE ID = '"+ uId +"' ORDER BY STARTDATE ASC";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    if (rs.next()) { // 예약 내역이 있는 경우에만 테이블을 출력
        rs.beforeFirst(); // 커서를 첫 번째 레코드 이전으로 이동

        while (rs.next()) {
            String num  = rs.getString("NUM");
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
                    if(book.equals("W")){
                    	if(cancel.equals("N")){
                        %><input type="radio" name="numCheck" value="<%=num%>"> <%
                    	}
                    }%>
				</td>
				<td><%=num%></td>
				<td><%=room%></td>
				<td><%
					java.util.Date today = new java.util.Date();
					java.util.Date startDate = java.sql.Date.valueOf(startdate);
					if (startDate.before(today)) {
						%><span style="text-decoration:line-through; color:gray;"><%=startdate%> ~ <%=lastdate%></span><%
					}else{
						%><%=startdate%> ~ <%=lastdate%><%
					}
				%></td>
				<td><%=pax%></td>
				<td><%=bf%></td>
				<td><%=pool%></td>
				<td><%=res%></td>
				<td>
					<% 
                if(book.equals("W")){
                    out.print("대기");
                }else if(book.equals("N")){
                    out.print("취소");
                }else{
                    out.print("확정");
                }
                %>
				</td>
				<td>
					<%
                if(cancel.equals("R")){
                    out.print("취소 신청");
                }else if(cancel.equals("Y")){
                    %><span style="color: red;">취소 완료</span> <%
                }
                %>
				</td>
			</tr>
			<%    
        }
    } else { // 예약 내역이 없는 경우 빈 값을 출력
        %>
			<tr>
				<td colspan="10">예약한 내역이 없습니다.</td>
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
			<input class="btn" type="button" value="예약 정보 수정" onclick="b_update()">
			<input class="btn" type="button" value="예약 취소 신청" onclick="cancel()">
		</div>
		</fieldset>

		<fieldset>
		<legend> 회원 정보 </legend>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>메일수신</th>
				<th>문자수신</th>
				<th>회원등급</th>
			</tr>
			<%
		rs = null; // 검색 결과를 담기 위한 객체
		stmt = null; // 쿼리 호출을 위한 객체
		
		try {
			String sql = "SELECT * FROM JN_USER WHERE ID = '"+ uId +"'" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String name  = rs.getString("NAME");
				String phone  = rs.getString("PHONE");
				String email = rs.getString("EMAIL");
				String birth = rs.getString("BIRTH");
				String mailyn = rs.getString("MAILYN").equals("Y") ? "수신" : "미수신";
				String msyn = rs.getString("MSYN").equals("Y") ? "수신" : "미수신";
				String grade = rs.getString("GRADE").equals("M") ? "일반회원" : "VIP회원";
				%>
			<tr>
				<td><%=uId%></td>
				<td><%=name%></td>
				<td><%=phone%></td>
				<td><%=birth%></td>
				<td><%=email%></td>
				<td><%=mailyn%></td>
				<td><%=msyn%></td>
				<td><%=grade%></td>
			</tr>
			<%
			}
		} catch (SQLException ex) {
			out.println("테이블 호출이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
		</table>
	</form>
	<div class="btns">
		<input class="btn" type="button" value="회원정보수정" onclick="u_update()">
	</div>
	</fieldset>
</div>
</body>
</html>
<script>
	function b_update(){
		window.open("user_b_event.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=500, height=700");
	}
	function cancel(){
		window.open("user_cancel.jsp?num="+document.bookcheck.numCheck.value, "popup", "width=600, height=300");
	}
	function u_update(){
		window.open("user_event.jsp", "popup", "width=500, height=550");
	}
	function back(){
		location.href="main.jsp";
	}
</script>