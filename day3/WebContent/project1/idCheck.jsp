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
<form name="check">
	<% 
		String uId = request.getParameter("uId");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_USER WHERE ID = '"+ uId +"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				%>
				<div class="text">중복된 아이디가 있습니다.</div>
				<div class="btns"><input class="btn" name="flg" value="N" hidden /></div>
				<%
			}else{
				%>
				<div class="text">사용 가능한 아이디입니다.</div>
				<div class="btns"><input class="btn" name="flg" value="Y" hidden /></div>
				<%
			}
			
		} catch(SQLException e){
			out.print(e.getMessage());
		}
		 
	%>
	<div class="btns"><input class="btn" type="button" value="되돌아가기" onclick="back()" /></div>
</form>

</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>