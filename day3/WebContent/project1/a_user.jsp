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
	#container{
		margin : 10px auto;
		width : 1100px;
	}
	fieldset {
		padding: 45px;
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
	table {
  		margin: 0 auto;
	}
	input[type="button"]:hover {
	  	cursor: pointer;
	}
	.btn2{
		border : none;
		background-color : rgb(175, 160, 136);
		border-radius : 5px;
		padding : 2px 5px;
		margin : 0px 10px;
		color : white;
		opacity: 1;
  		transition: opacity 0.3s;
	}
	.btn2:hover{
		background-color : rgb(139, 124, 102);
		opacity: 0.7;
	}
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<div id="container">
<h2>회원 관리</h2>
<hr>
<form name="list">
<fieldset>
	<table>
		<tr>
			<th></th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>VIP전환</th>
			<th>정지여부</th>
			<th>정지전환</th>
			<th>시도횟수</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "SELECT * FROM JN_USER WHERE STATUS = 'U' ORDER BY ID ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uId = rs.getString("ID");
					String uName = rs.getString("NAME");
					String email = rs.getString("EMAIL");
					String grade = rs.getString("GRADE");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String banYn 
						= rs.getString("BANYN").equals("Y") ? "정지" : "";
					String btnYn 
						= rs.getString("BANYN").equals("Y") ? "해제" : "정지";
					
		%>
			<tr>
				<td>
					<input type="radio" name="user" value="<%=uId%>">
				</td>
				<td><%=uId%></td>
				<td><%=uName%></td>
				<td><%=phone%></td>
				<td><%=email%></td>
				<td><%=grade%></td>
				<td><input class="btn2" type="button" value="전환" onclick="gradeChange('<%=rs.getString("GRADE")%>', '<%=uId%>')"></td>
				<td style="color:red"><%=banYn%></td>
				<td><input class="btn2" type="button" value="<%=btnYn%>" onclick="banChange('<%=rs.getString("BANYN")%>', '<%=uId%>')"></td>
				<td>
				<% if(rs.getInt("CNT") >= 5){ %>	
					<input class="btn2" type="button" value="초기화" onclick="cntChange('<%=uId%>')">
				<% } %>
				</td> 
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
	<input class="btn" type="button"  onclick="userUpdate()" value="수정" />
	<input class="btn" type="button" onclick="userRemove()" value="삭제"/>
	<input class="btn" type="button" onclick="back()" value="이전으로"/>
	</div>
	</fieldset>
</form>
</div>
</body>
</html>
<script>
	function back(){
		location.href="admin.jsp";
	}
	//삭제
	function userRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		var form = document.list;
		window.open("a_userDel.jsp?uId=" + form.user.value,"popup","width=600, height=300");
	}
	
	//유저 정보 수정(관리자)
	function userUpdate(){
		var form = document.list;
		window.open("a_userEvent.jsp?uId="+form.user.value,"popup","width=500, height=550");
	}
	
	//멤버등급
	function gradeChange(kind,uId){
		if(kind == "M"){
			kind = "VIP";
		}else{
			kind = "M";
		}
		window.open("a_userGrade.jsp?uId="+uId+"&kind="+kind,"popup","width=500, height=300");
	}
	
	//정지 여부
	function banChange(kind, uId){
		if(kind == "N"){
			kind = "Y";
		} else {
			kind = "N"
		}
		window.open("a_userBan.jsp?uId="+uId+"&kind="+kind,"popup","width=500, height=300");
	}
	
	//로그인 시도 횟수
	function cntChange(uId){
		window.open("a_userCnt.jsp?uId="+uId, "popup"
				,"width=500, height=500");
	}
	
	//팝업리턴
	function getReturn(){
		location.reload();
	}
</script>