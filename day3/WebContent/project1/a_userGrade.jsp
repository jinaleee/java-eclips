<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	input[type="button"]:hover {
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
<body>
	<%@ include file="../jdbc_set2.jsp" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String uId = request.getParameter("uId");
		String kind = request.getParameter("kind");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String update = "UPDATE JN_USER SET GRADE = '" + kind + "' WHERE ID = '" + uId + "'";
			stmt.executeUpdate(update);
			if(kind.equals("M")){
				%><div class="text">일반멤버로 변경되었습니다.</div><%
			} else {
				%><div class="text">VIP멤버로 변경되었습니다.</div><%
			}
			
			
		} catch (SQLException ex) {
			out.println("테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<div class="btns"><input class="btn" type="button" onclick="back()" value="닫기"></div>
</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close();
	}
</script>