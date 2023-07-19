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
		margin-bottom:50px;
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
        color:gray;
        font-size:16px;
    }
    input[type="button"]:hover {
	  	cursor: pointer;
	}
	#text2{
    	color:gray;
    	margin : 50px auto;
    	text-align:center;
    }
    img{
    	width:100%;
    }
    #text3{
    	color:gray;
    	margin : 50px auto;
    	text-align:center;
    	font-size:30px;
    }
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
	<div id="container">
	<h2>고객 서비스</h2>
	<hr>
		<fieldset>
			<img src="mang.jpg">
			<div id="text3">준 비 중 입 니 다.</div>
			<div id="text2">MANGCHI는 저희집 고양이입니다.</div>
			<div id="text2">고양이 보고 가세요.🐱<div>
		</fieldset>
	</div>
</body>
</html>