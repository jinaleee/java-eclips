<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	input[type="button"],
	input[type="submit"]:hover {
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
	#ul1, #ul2 {
		display: inline-block;
		vertical-align: top;
		line-height : 50px;
		margin-left : 30px;
	}
	li{
		list-style : none;
	}
</style>
<body>
	<form name = "updateForm" action="user_update.jsp">
	<%@ include file="../jdbc_set2.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName"); 
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_USER WHERE ID = '" + uId +"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String phone = rs.getString("PHONE");
				String email = rs.getString("EMAIL") != null ? rs.getString("EMAIL") : "";
				String birth = rs.getString("BIRTH");
			%>
				<input name="uId" value="<%= uId %>" hidden/>
				<ul id="ul1">
					<li>이　　름</li>
					<li>비밀번호</li>
					<li>전화번호</li>
					<li>생년월일</li>
					<li>이메일</li>
					<li>메일수신여부</li>
					<li>문자수신여부</li>
					
				</ul>
				<ul id="ul2">
					<li><input name="uName" value="<%= rs.getString("NAME") %>"></li>
					<li><input name="pwd" type="password"></li>
					<li><input name="phone" value="<%= phone %>"></li>
					<li><input type=date name="birth" value="<%= birth %>"></li>
					<li><input name="email" value="<%= email %>"></li>
					<li>수신 <input type=radio name="mailYN" value="Y" checked>　 미수신 <input type=radio name="mailYN" value="N"></li>
					<li>수신 <input type=radio name="msYN" value="Y" checked> 　미수신 <input type=radio name="msYN" value="N"></li>
				</ul>
			
			<%
			}
		} catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div class="btns">
		<input class="btn" type="submit" value="수정">
		<input class="btn" type="button" onclick="window.close()" value="취소">
	</div>
	</form>
	
</body>
</html>