<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="home">
<h1>HOME</h1>
<input type="button" onclick="booking()" value="예약하기" />
	<hr>
	<%@ include file="../jdbc_set2.jsp" %>
	<%	
		int mi = session.getMaxInactiveInterval()/60;
		session.setMaxInactiveInterval(60*60);
		
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String status = (String) session.getAttribute("status");
		
		if(uName!=null){		
			out.println(uName + "님 환영합니다."); %>
			<input type="button" value="로그아웃" onclick="user_logout()" />
			<% if(!uName.equals("관리자")){
				%><input type="button" value="마이페이지" onclick="mypage()" /> <%
			}%><%
		}else{
			%>
			<input type="button" value="회원가입" onclick="join()" />
			<input type="button" value="로그인" onclick="user_login()"/><%
		}
	%>
	
	<%
		if(request.isRequestedSessionIdValid()){
			if(status != null && status.equals("A")){		
				%><div><input type="button" value="관리자 페이지로 이동" onclick="admin()"></div><%
			}
		}
	
	%>

</form>
</body>
</html>
<script>
	//회원가입
	function join(){
		location.href="join.jsp";
	}
	//로그인
	function user_login(){
		location.href="login.jsp";
	}
	//로그아웃
    function user_logout() {
        location.href = "logout.jsp";
    }
	//
	function mypage(){
		location.href = "mypage.jsp"	
	}
	//예약
	function booking(){
	    <% if (uName!=null) { %>
        location.href = "book.jsp";
    <% } else { %>
        alert("로그인 후 예약 가능합니다");
    <% } %>
	}
	
	//관리자페이지
	function admin(){
		location.href="admin.jsp";
	}

</script>