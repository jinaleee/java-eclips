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
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
<div id="container">
	<%@ include file="../jdbc_set2.jsp" %>
<h2>관리자 페이지</h2>
<hr>
<fieldset>
<div class="btns"><input class="btn" type="button" value="회원 관리" onclick="a_user()"> <input class="btn" type="button" value="예약 관리" onclick="a_book()"></div>
</fieldset>
</div>
</body>
</html>
<script>
	function a_user(){
		location.href = "a_user.jsp";
	}
	function a_book(){
		location.href = "a_book.jsp";
	}
</script>