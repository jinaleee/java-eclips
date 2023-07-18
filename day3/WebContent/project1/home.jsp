<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 9999;
		background-color: rgb(43, 43, 43);
		box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
	}
	body{
		margin-top : 160px;
		background-width : 500px;
	}
	.top_menu_a{
		border : none;
		border-radius: 20px;
		font-size : 13px;
		color : white;
		margin : 0px 5px;
	}
	.top_menu_a:hover{
		color: rgb(190, 167, 124);
	}
	#topMenu{
		position: absolute;
	    top: 15px;
	    right: 30px;
	    float: none;
	    margin-right: 0;
	}
	hr{
	    position: relative;
	}
	#title{
		font-family: math;
	    position: relative;
	    font-size: 35px;
	    margin-top :5px;
	    margin : 30px;
	    margin-bottom : 40px;
	    width : 400px;
	    color : white;
	}
	a{
		text-decoration : none;
		color : white;
	}
	.menu_li{
		list-style:none;
		display:inline;
		position: relative;
		margin-right : 100px;
		color : white;
	}
	.menu_li a:hover{
		color: rgb(190, 167, 124);
	}
	.menu_li a:after {
		content: "";
		display: block;
		position: absolute;
		bottom: -15px; /* 밑줄을 아래로 띄우는 위치 조정 */
		left: 0;
		width: 100%;
		height: 3px;
		background-color: rgb(190, 167, 124); 
		opacity: 0; /* 기본적으로 투명한 상태로 숨김 */
		transition: opacity 0.2s; /* 페이드 인/아웃 효과를 위한 트랜지션 설정 */
	}
	.menu_li a:hover:after {
		opacity: 1;
	}
	.menu_ul{
		position: absolute;
		top : 72px;
	    right : 50px;
	    float : none;
	    margin-right: 0;	
	    font-size : 18px;
	}
	#logo{
		position: relative;
		top : 11px;
		right : 5px;
		width : 50px;
	}
	#middle{
		background : 
	}
	.hello{
		color : white;
		font-size:12px;
	}
	#admin{
		font-size:12px;
		font-weight:bold;
	}
	.line{
		color : rgb(104, 104, 104);
		font-size:12px;
	}
</style>
<header>
<div id="title"><a href="home.jsp" id="title_a"><img id="logo" src="logo_white.png"> MANGCHI HOTEL</a></div>

	<div id="topMenu">
	<%	
		int mi = session.getMaxInactiveInterval()/60;
		session.setMaxInactiveInterval(60*60);
		
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String status = (String) session.getAttribute("status");
		
		if(request.isRequestedSessionIdValid()){
			if(status != null && status.equals("A")){		
				%><a class="top_menu_a" id="admin" href="admin.jsp" onclick="admin()">관리자 페이지로 이동</a><span class="line">　|　</span><%
			}
		}

		if(uName!=null){		
			%><span class="hello"><%= uName%>님 환영합니다.　</span> 
			<a class="top_menu_a" href="logout.jsp" onclick="user_logout()"> logout </a><span class="line">　|　</span>
			<%
		}else{
			%>
			<a class="top_menu_a" href="join.jsp" onclick="join()"> join </a><span class="line">　|　</span>
			<a class="top_menu_a" href="login.jsp" onclick="user_login()"> login </a><span class="line">　|　</span>
	<%
		}
	%>
	<a class="top_menu_a" href="mypage.jsp" onclick="mypage()"> my page </a>
	</div>
	
	<div>
	<ul class="menu_ul">
		<li class="menu_li"><a class="menu" href="">HOTEL</a></li>
		<li class="menu_li"><a class="menu" href="">DINING</a></li>
		<li class="menu_li"><a class="menu" href="book.jsp" onclick="checkBooking()">RESERVATION</a></li>
		<li class="menu_li" style="margin-right:0px;"><a class="menu" href="">CUSTOMER SUPPORT</a></li>
	</ul>
	</div>
</header>
<body>
<%@ include file="../jdbc_set2.jsp" %>
	<div id="middle">

	</div>
</body>
</html>
<script>
	//회원가입
	function join(){
		event.preventDefault();
		location.href="join.jsp";
	}
	//로그인
	function user_login(){
		event.preventDefault();
		location.href="login.jsp";
	}
	//로그아웃
    function user_logout() {
    	event.preventDefault();
        location.href = "logout.jsp";
    }
	//
	function mypage(){
		event.preventDefault();
	<% if (uName!=null) { %>
        location.href = "mypage.jsp";
    <% } else { %>
    	location.href = "login.jsp";
    <% } %>
	}
	//예약 
	function checkBooking() {
		event.preventDefault(); // 기본 동작(링크 이동) 막기
		
		<% if (uName != null) { %>
			location.href = "book.jsp";
		<% } else { %>
			alert("로그인 후 예약 가능합니다.");
		<% } %>
	}
	
	//관리자페이지
	function admin(){
		location.href="admin.jsp";
	}

</script>