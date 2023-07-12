<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join_insert.jsp" name = "userForm" method="post">
		<div>아이디 : <input type="text" name="uId"><input type="button" onclick="idCheck();" value="중복체크"></div>
		<div>패스워드 : <input type="password" name="pwd1"></div>
		<div>패스워드 확인 : <input type="password" name="pwd2"></div>
		<div>이름 : <input type="text" name="uName"></div>
		<div>핸드폰번호 : <input type="text" name="phone"></div>
		<div>나이 : <input type="number" name="age"></div>
		<div>주소 : <input type="text" name="addr"></div>
		<div><input type="button" onclick="userJoin()" value="회원가입"></div>
	</form>
</body>
</html>
<script>
	var btnCheck = false; // 중복체크 버튼을 눌렀는지 확인
	var idFlg = false; // 아이디의 중복 여부(중복 아이디 있으면 false)
	
	function userJoin(){ // 회원가입 버튼
		if(btnCheck==false){
			alert("중복 확인 바람");
			return;
		}
		if(idFlg==false){
			alert("사용 중인 아이디입니다");
			return;
		}
	}
	
	function idCheck(){ // 중복체크 버튼
		btnCheck = true;
		var form = document.userForm;
		window.open("idCheck.jsp?uId="+form.uId.value,"","width=500, height=500");
		
	}
	
	function getReturn(val){
		if(val=="N"){
			idFlg = false;
		}else{
			idFlg = true;
		}
	}
</script>
