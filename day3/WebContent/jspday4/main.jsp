<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<%
		String uName = (String) session.getAttribute("userName");
		out.println(uName + "님 환영합니다.");
		int mi = session.getMaxInactiveInterval()/60;
		/* out.println(mi+"분"); */
		
		session.setMaxInactiveInterval(60*60);
		mi = session.getMaxInactiveInterval()/60;
		/* out.println(mi+"분"); */
		
		String status = (String) session.getAttribute("status");
		if(status.equals("A")){
			%><input type="button" value="관리자 화면 이동"><%
		}
	%>
	
	<input type="button" value="로그아웃" onclick="logout()" />
	
</body>
</html>
<script>
	
	function logout(){
		location.href=("login.jsp");
	}

</script>