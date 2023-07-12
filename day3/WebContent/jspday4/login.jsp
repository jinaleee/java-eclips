<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*session.removeAttribute("userId");
		session.removeAttribute("userName"); */
		/* session.invalidate(); */
		if(request.isRequestedSessionIdValid()){
			out.println("세션 있다");
			session.invalidate();
		}else{
			out.print("세선 엾다");
		}
	%>
	<form action="check.jsp">
		<div><input placeholder="아이디" name="uId"></div>
		<div><input placeholder="패스워드" type="password" name="pwd"></div>
		<div><input type="submit" value="로그인"></div>
	</form>
</body>
</html>