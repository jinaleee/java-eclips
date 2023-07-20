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
	.put {
		border-style: none;
		border-bottom: 1px solid #ccc;
	}
	h2{
		color : rgb(175, 160, 136);
	}
	hr{
		border-color : rgb(175, 160, 136);
	}	
	#ul1, #ul2 {
		display: inline-block;
		vertical-align: top;
		line-height : 50px;
		margin-left : 100px;
	}
	#ul2{
		margin-left : 110px;
	}
	li{
		list-style:none;
	}
	.btns{
		margin-top : 40px;
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
	#vip{
		color:rgb(175, 160, 136);
	}
	#text{
        color : gray;
        font-size : 16px;
        margin : 20px 0px;
    }
    input[type="button"]:hover {
	  	cursor: pointer;
	}
	#text2{
    	color:gray;
    	margin : 10px auto;
    	text-align:center;
    }
    img{
    	width:100%;
    }
    legend{
		color : rgb(175, 160, 136);
		font-size : 24px;
	}
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
	<div id="container">
	<h2>HOTEL</h2>
	<hr>
		<fieldset>
		<legend> 　전경　 </legend>
			<div>
			<img src="pool2.jpg">
			</div>
		</fieldset>
		
		<fieldset>
		<legend> 　객실　 </legend>
			<div>
			<img src="bokdo.jpg">
			<img src="room4.jpg">
			<img src="room3.jpg">
			<img src="room1.jpg">
			</div>
		</fieldset>
		
		<fieldset>
		<legend> 　부대시설　 </legend>
			<div>
			<img src="pool1.jpg">
			<img src="pool5.jpg">
			</div>
		</fieldset>
		
		<fieldset>
		<legend> 　조식 서비스　 </legend>
			<div>
			<img src="bf.jpg">
			</div>
			<div id="text">레스토랑, 풀, 룸에서 모두 이용 가능합니다.</div>
		</fieldset>
	</div>
</body>
</html>