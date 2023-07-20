<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<header>
	<jsp:include page="home.jsp" />
</header>
<style>
	table {
		border-collapse : collapse;
		text-align: center;
		margin-botton : 20px;
		font-size : 15px;
	}
	th, td {
		padding : 5px 10px;
	}
	th{
		border-bottom : 2px double rgb(175, 160, 136);
		color : rgb(104, 95, 82);
	}
	td{
		border-bottom : 1px solid rgb(190, 190, 190);
	}
	.btn {
		margin-top : 20px;
	}
	#container{
		margin : 10px auto;
		width : 1100px;
	}
	legend{
		font-size : 22px;
		font-weight : bold;
	}
	fieldset {
		padding : 45px;
		margin : 30px 0px;
		border : 1px solid rgb(200, 200, 200);
	}
	h2{
		color : rgb(175, 160, 136);
	}
	hr{
		border-color : rgb(175, 160, 136);
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
	.btns{
		margin-top : 30px;
		text-align: center;
	}
	table {
  		margin: 0 auto;
	}
	legend{
		color : rgb(175, 160, 136);
	}
	input[type="button"]:hover {
	  	cursor: pointer;
	}
	#map{
		text-align:center;
	}
	#text{
		color:gray;
		margin:20px 10px;
	}
</style>
<body>
<div id="container">
	<%@ include file="../jdbc_set2.jsp"%>
	
	<h2>오시는 길</h2>
	<div id="text">MANGCHI HOTEL에 오신 걸 환영합니다.</div>
	<hr>
	<fieldset>
		<div id="map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3336.7228818808085!2d126.40553581180325!3d33.24756265967915!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350c5acf60a78955%3A0x9a7754729d339e2!2z7KCc7KO87Iug65287Zi47YWU!5e0!3m2!1sko!2skr!4v1689749335921!5m2!1sko!2skr" width="1000" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<div id="text">제주특별자치도 서귀포시 특별자치도, 중문관광로72번길 75</div>
		<div class="btns">
			<input class="btn" type="button" value="NAVER MAP" onclick="naver()">
			<input class="btn" type="button" value="KAKAO MAP" onclick="KAKAO()">
		</div>
	</fieldset>
</div>
</body>
</html>
<script>
	function naver(){
		location.href="https://naver.me/xqf5KIzG";
	}
	function KAKAO(){
		location.href="https://place.map.kakao.com/7967458";
	}
</script>