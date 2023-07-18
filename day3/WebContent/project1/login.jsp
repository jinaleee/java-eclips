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
        margin: 10px auto;
        width: 1000px;
    }
    h2{
        color : rgb(175, 160, 136);
    }
    hr{
        margin : 20px 0px;
        border-color : rgb(175, 160, 136);
    }
    fieldset {
        padding: 50px;
        margin-top : 30px;
        border-color : #ccc; 
    }
    #text{
        color:gray;
        font-size:16px;
    }
    li{
        list-style : none;
    }
    .login_input{
        width : 250px;
        height : 30px;
        margin : 3px;
        padding : 5px;
    }
    .btn1{
        border : none;
        background-color : rgb(175, 160, 136);
        padding : 12px 30px;
        margin : 3px 0px 0px 3px;
        color : white;
        width : 264px;
    }
    input[type="button"],
    input[type="submit"]:hover {
        cursor: pointer;
    }
    #loginbox {
        display : flex;
    }
    #loginbox > div {
        flex: 1;
    }
    #loginbox ul {
        display : inline-block;
        padding-right : 5px;
    }
    #text2{
    	color:gray;
    	margin : 42px 40px;
    }
    #joinbox{
        padding :51px 40px;
        padding-left: 90px;
        border-left : 1px solid gray;
    }
    #loginboxin{
    	padding : 40px;
    	padding-right : 65px;
    }
</style>
<header>
    <jsp:include page="home.jsp" />
</header>
<body>
    <div id="container">
        <form action="logincheck.jsp">
        
            <h2>로그인</h2>
            <div id="text">
            MANGCHI HOTEL에 오신 것을 환영합니다.<br>
            로그인 하시고 더 편리하게 이용하세요.
            </div>
            <hr>
            <fieldset>
            <div id="loginbox">
                <div id="loginboxin">
                    <ul>
                        <li><input class="login_input" placeholder="아이디" name="uId" required></li>
                        <li><input class="login_input" placeholder="패스워드" type="password" name="pwd" required></li>
                        <li><input type="submit" value="로그인" class="btn1"></li>
                    </ul>
                </div>
                <div id="joinbox">
                    <div id="text2">아직 회원이 아니신가요?</div>
                    <input type="button" value="회원가입" onclick="join()" class="btn1"/>
                </div>
            </div>
            </fieldset>
        </form>
    </div>
</body>
</html>
<script>
    function join(){
        location.href="join.jsp";
    }
</script>