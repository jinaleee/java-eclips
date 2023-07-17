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
fieldset {
	padding: 30px;
}

.put {
	border-style: none;
	border-bottom: 1px solid #ccc;
}
span{
	color : red;
}
</style>
<body>
<div id="container">
	<form action="join_insert.jsp" name="userForm" method="post">
		<h1>회원가입</h1>
		<hr>
		<fieldset>
			<div>
				아이디 <span>*</span> <input class="put" type="text" name="uId"
					placeholder="영문, 숫자만 사용 가능" required autofocus /> <input type="button"
					onclick="idCheck();" value="중복체크">
			</div>
			<div>
				비밀번호 <span>*</span> <input class="put" type="password" name="pwd1" required>
			</div>
			<div>
				비밀번호 확인 <span>*</span> <input class="put" type="password" name="pwd2" required>
			</div>
			<div>
				이름 <span>*</span> <input class="put" type="text" name="uName" required>
			</div>
			<div>
				핸드폰번호 <span>*</span> 
				<input class="put" type="text" name="phone1">-<input class="put" type="text" name="phone2">-<input class="put" type="text" name="phone3">
			</div>
			<div>
				이메일 <span>*</span> <input class="put" type="email" name="eMail1"> @ 
				<select name="eMail2" class="put">
					<option value="@naver.com">naver.com</option>
					<option value="@gmail.com">gmail.com</option>
					<option value="@daum.net">daum.net</option>
					<option value="@daum.net">nate.com</option>
				</select>
			</div>
			<div>
				<label for="b_year">생년월일 <span>*</span></label> 
				<select name="b_year" class="put">
					<% for(int i=2003; i>=1950; i--){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select> 
				<select name="b_month" class="put">
					<% for(int i=1; i<=12; i++){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select> 
				<select name="b_day" class="put">
					<% for(int i=1; i<=31; i++){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select>
			</div>
			<div>
				안내 메일 수신 <input type="radio" name="mailYn" value="Y" /> 수신 안 함 <input
					type="radio" name="mailYn" value="N" checked>
			</div>
			<div>
				안내 문자 수신 <input type="radio" name="msYn" value="Y"> 수신 안 함 <input
					type="radio" name="msYn" value="N" checked>
			</div>
			<div>
				<input type="button" onclick="userJoin()" value="회원가입"> <input
					type="button" onclick="back()" value="돌아가기">
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	function userJoin(){
		var form = document.userForm;
		if(!check1){
			alert("아이디 중복 확인 바랍니다.");
			return;
		}
		if(!check2){
			alert("중복된 아이디가 있습니다.");
			return;
		}
		var regType1 = /^[A-Za-z0-9]+$/;
		if(!regType1.test(form.uId.value) ){
			alert("아이디는 영문, 숫자의 조합으로 가능합니다.");
			return;
		}
		if(form.pwd1.value != form.pwd2.value){
			alert("비밀번호가 다릅니다.");
			return;
		}
		if(form.uId.value == "" || form.uId.value == undefined){
			alert("아이디를 입력해주세요.");
			form.uId.focus();
			return;
		}
		if(form.pwd1.value == "" || form.pwd1.value == undefined){
			alert("비밀번호를 입력해주세요.");
			form.pwd1.focus();
			return;
		}
		if(form.uName.value == "" || form.uName.value == undefined){
			alert("이름을 입력해주세요.");
			form.uName.focus();
			return;
		}
		if(form.phone1.value == "" || form.phone1.value == undefined){
			alert("핸드폰 번호를 입력해주세요.");
			form.phone.focus();
			return;
		}
		form.submit();
	}
	function idCheck(){
		check1 = true;
		var form = document.userForm;
		if(form.uId.value =="" || form.uId.value.length < 0){
			alert("아이디를 입력해주세요.")
			form.uId.focus();
		}else{
			window.open("idCheck.jsp?uId="+form.uId.value, "check","width=500, height=300");
		}
	}
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}
	function back(){
		location.href="home.jsp";
	}
</script>