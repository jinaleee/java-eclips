<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   	#container{
		margin : 10px auto;
		width : 1200px;
	}
	fieldset {
		padding: 30px;
		margin-top : 30px;
		border : 1px solid rgb(200, 200, 200);
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
	input[type="button"],
	input[type="submit"]
	:hover {
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
</style>
<header>
    <jsp:include page="home.jsp" />
</header>
<body>
	<%@ include file="../jdbc_set2.jsp" %>
	<div id="container">
	<fieldset>
<form name="check">
	<%
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_USER WHERE ID = '" + uId + "' AND PWD = '" + pwd + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
					if(rs.getString("BANYN").equals("Y")){
						%><div class="text">정지된 회원입니다.</div><%
					}else{
						if(rs.getInt("CNT")<5){
							String status = rs.getString("STATUS");
							session.setAttribute("userId", uId);
							session.setAttribute("userName", rs.getString("NAME"));
							session.setAttribute("status", rs.getString("STATUS")); 
							String update = "UPDATE JN_USER SET CNT = 0 WHERE ID ='"+ uId +"'";
							stmt.executeUpdate(update);
							response.sendRedirect("main.jsp");
						}else{
							%><div class="text">5회 오류로 로그인 불가, 관리자에게 문의 바랍니다.</div><%
					}
				}
			} else {
				String id = "SELECT * FROM JN_USER WHERE ID = '" + uId + "'";
				rs = stmt.executeQuery(id);
					if(rs.next()){
						if(rs.getInt("CNT")<5){
							String update = "UPDATE JN_USER SET CNT = CNT+1 WHERE ID ='"+ uId +"'";
							stmt.executeUpdate(update);
							%><div class="text">비밀번호 오류입니다.</div><%
						}else{
							%><div class="text">5회 오류로 로그인 불가, 관리자에게 문의 바랍니다.</div><%
						}
					}else{
					out.print("로그인 정보를 확인해주세요.");
					}
			}
				
		}catch(SQLException e){
			out.println("test " + e.getMessage());
		}
	%>
	<div class="btns">
		<input class="btn" type="button" onclick="login()" value="로그인 재시도">
		<input class="btn" type="button" onclick="back()" value="메인으로">
	</div>
</form>
</fieldset>
</div>
</body>
</html>
<script>
function login(){
	location.href="login.jsp";
}
function back(){
	location.href="main.jsp";
}
</script>