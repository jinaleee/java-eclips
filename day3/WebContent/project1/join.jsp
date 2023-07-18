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
		border-color : rgb(175, 160, 136);
	}
	fieldset {
		padding: 50px;
		margin-top : 30px;
		border-color : #ccc; 
	}
	.put {
		border-style: none;
		border-bottom: 1px solid #ccc;
		width : 285px;
	}
	.put2 {
		border-style: none;
		border-bottom: 1px solid #ccc;
		width : 120px;
	}
	.put3 {
		border-style: none;
		border-bottom: 1px solid #ccc;
		width : 137px;
	}
	.put_b {
		border-style: none;
		border-bottom: 1px solid #ccc;
		width : 93px;
	}
	span{
		color : red;
	}
	li{
		list-style:none;
	}
	#ul-container {
		display: flex;
		margin-left : 50px;
	}
	#ul1, #ul2 {
		display: inline-block;
		vertical-align: top;
		line-height : 50px;
		margin-left : 30px;
	}
	#phone{
		width : 85px;
	}
	input{
		margin : 2px;
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
	#checkbtn{
		border : none;
		background-color : rgb(175, 160, 136);
		border-radius : 5px;
		padding : 2px 5px;
		margin : 0px 10px;
		color : white;
		opacity: 1;
  		transition: opacity 0.3s;
	}
	#checkbtn:hover{
		background-color : rgb(139, 124, 102);
		opacity: 0.7;
	}
	input[type="button"]:hover {
	  cursor: pointer;
	}
	#text{
		color:gray;
	}
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
<div id="container">
	<form action="join_insert.jsp" name="userForm" method="post">
		<h2>회원가입</h2>
		<div id="text">
		MANGCHI HOTEL의 리워즈 멤버십 회원만을 위한 다양한 혜택과 서비스를 누려보세요.
		</div>
		<hr>
		<fieldset>
		<div id="ul-container">
			<ul id="ul1">
				<li>
					아이디 <span>*</span> 
				</li>
				<li>
					비밀번호 <span>*</span> 
				</li>
				<li>
					비밀번호 확인 <span>*</span> 
				</li>
				<li>
					이름 <span>*</span> 
				</li>
				<li>
					핸드폰번호 <span>*</span> 
				</li>
				<li>
					이메일
				</li>
				<li>
					생년월일 <span>*</span>
				</li>
				<li>
					안내 메일
				</li>
				<li>
					안내 문자
				</li>
			</ul>
			<ul id="ul2">
				<li>
				<input class="put" type="text" name="uId"
					placeholder="영문, 숫자만 사용 가능" required autofocus /> <input type="button" onclick="idCheck();" value="중복확인" id="checkbtn">
				</li>
				<li>
				<input class="put" type="password" name="pwd1" required>
				</li>
				<li>
				<input class="put" type="password" name="pwd2" required>
				</li>
				<li>
				<input class="put" type="text" name="uName" required>
				</li>
				<li>
				<input class="put" type="text" name="phone1" id="phone">-<input class="put" type="text" name="phone2" id="phone">-<input class="put" type="text" name="phone3" id="phone">
				</li>
				<li>
				<input class="put2" type="email" name="eMail1"> @ 
				<select name="eMail2" class="put3">
					<option value="@naver.com">naver.com</option>
					<option value="@gmail.com">gmail.com</option>
					<option value="@daum.net">daum.net</option>
					<option value="@daum.net">nate.com</option>
				</select>
				</li>
				<li>
				<select name="b_year" class="put_b">
					<% for(int i=2003; i>=1950; i--){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select> 
				<select name="b_month" class="put_b">
					<% for(int i=1; i<=12; i++){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select> 
				<select name="b_day" class="put_b">
					<% for(int i=1; i<=31; i++){
						%> 
						<option value="<%= i %>"><%= i %></option>
					<%}%>
				</select>
				</li>
				<li>
					수신　<input type="radio" name="mailYn" value="Y" />　　　수신 안 함　<input type="radio" name="mailYn" value="N" checked>
				</li>
				<li>
					수신　<input type="radio" name="msYn" value="Y">　　　수신 안 함　<input type="radio" name="msYn" value="N" checked>
				</li>
			</ul>
			</div>

			<div class="btns">
				<input type="button" onclick="userJoin()" value="회원가입" class="btn"> <input
					type="button" onclick="back()" value="돌아가기" class="btn">
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