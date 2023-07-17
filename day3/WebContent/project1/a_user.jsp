<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		text-align : center;
	}
	th, td{
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</head>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<h1>회원 관리</h1>
<hr>
<form name="list">
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
				<td><input type="button" value="전환" onclick="gradeChange('<%=rs.getString("GRADE")%>', '<%=uId%>')"></td>
				<td style="color:red"><%=banYn%></td>
				<td><input type="button" value="<%=btnYn%>" onclick="banChange('<%=rs.getString("BANYN")%>', '<%=uId%>')"></td>
				<td>
				<% if(rs.getInt("CNT") >= 5){ %>	
					<input type="button" value="초기화" onclick="cntChange('<%=uId%>')">
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
	<input type="button"  onclick="userUpdate()" value="수정" />
	<input type="button" onclick="userRemove()" value="삭제"/>
	<input type="button" onclick="back()" value="이전으로"/>
</form>
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
		window.open("user_del.jsp?uId=" + form.user.value,"popup1","width=600, height=300");
	}
	
	//유저 정보 수정(관리자)
	function userUpdate(){
		var uId = document.list.user.value;
		window.open("user_event.jsp?uId="+uId,"popup2","width=600, height=300");
	}
	
	function gradeChange(kind,uId){
		if(kind == "M"){
			kind = "VIP";
		}else{
			kind = "M";
		}
		window.open("user_grade.jsp?uId="+uId+"&kind="+kind,"popup","width=500, height=500");
	}
	
	//정지 여부
	function banChange(kind, uId){
		if(kind == "N"){
			kind = "Y";
		} else {
			kind = "N"
		}
		window.open("user_ban.jsp?uId="+uId+"&kind="+kind,"popup","width=500, height=500");
	}
	
	//로그인 시도 횟수
	function cntChange(uId){
		window.open("user_cnt.jsp?uId="+uId, "popup2"
				,"width=500, height=500");
	}
	
	//팝업리턴
	function getReturn(){
		location.reload();
	}
</script>