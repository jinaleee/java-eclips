<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form name="login" action="success.jsp">
	    <div>아이디 : <input name="id" type="text"></div>
	    <div>패스워드 : <input name="pwd" type="text"></div>
	    <input type="submit" value="전송" onclick="check(); return false;" />
    </form>
</body>
</html>
<script>
	// check 함수 생성
	// 아이디에 영어 대소문자만 입력 가능하도록
	// 숫자, 특수문자, 한글등이 입력되고 전송을 누르면 '영어 대소문자만 가능' 알림
	// 패스워드는 숫자만 가능하도록 아닐 경우 '패스워드는 숫자만 가능' 알림
	
	function check(){
		var login = document.login;
		var regExp = /^[a-z|A-Z]+$/;
		var regExp2 = /^[0-9]*$/;
		
        if(!regExp.test(login.id.value)){
            alert("영어 대소문자만 가능")
            login.id.select();
            return;
        }else if(!regExp2.test(login.pwd.value)){
            alert("숫자만 가능")
            login.pwd.select();
            return;
        }
        if(login.id.value==undefined || login.id.value==""){
            alert("아이디 입력");
            login.id.focus();
            return;
        }else if(login.pwd.value=="" || login.pwd.value==undefined){
            alert("비밀번호 입력");
            login.pwd.focus();
            return;
        }
		login.submit();
		
	}
</script>