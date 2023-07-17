<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set2.jsp" %>
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
			out.println("회원 가입이 완료되었습니다.");
			out.println(uName + "님 회원 가입을 환영합니다.");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<div><input type="button" value="메인으로" onclick="back()"></div>
</body>
</html>
<script>
	function back(){
		location.href="home.jsp";
	}
</script>