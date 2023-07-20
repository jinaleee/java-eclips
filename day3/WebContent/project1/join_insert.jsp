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
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<div id="container">
	<h2>회원가입</h2>
	<hr>
	<fieldset>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd1");
		String uName = request.getParameter("uName");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String eMail1 = request.getParameter("eMail1");
		String eMail2 = request.getParameter("eMail2");
		String b_year = request.getParameter("b_year");
		String b_month = request.getParameter("b_month");
		String b_day = request.getParameter("b_day");
		String mailYn = request.getParameter("mailYn");
		String msYn = request.getParameter("msYn");
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "INSERT INTO JN_USER(ID,PWD,NAME,PHONE,EMAIL,BIRTH,MAILYN,MSYN) VALUES('"+ uId +"', '" + pwd + "', '" + uName + "', '" + phone1+phone2+phone3 + "', '" + eMail1+eMail2 + "', '" + (b_year)+"."+(b_month)+"."+(b_day) + "','" + mailYn + "','" + msYn + "')";
			stmt.executeUpdate(sql);
			%>
			<div class="text">회원 가입이 완료되었습니다.<br>
			<%=uName%>님 회원 가입을 환영합니다.</div>
			<%
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div class="btns"><input class="btn" type="button" value="메인으로" onclick="back()"></div>
	</fieldset>
	</div>
</body>
</html>
<script>
	function back(){
		location.href="main.jsp";
	}
</script>