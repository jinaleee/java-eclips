<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
      #container {
        width:600px;
        margin:10px auto;
      }
      fieldset {
        margin-bottom: 20px;
      }
      ul {
        list-style: none;
        padding-left: 0;
      }
      li {
        margin:10px;
      }
      .li_label {
        width:120px;
        line-height: 36px;
        float:left;
        font-weight:bold;
      }
      .txt_input {
        width:300px;
        height:30px;
      }
      #buttons {
        width:400px;
        margin:20px auto;
        text-align: center;
      }
      .btn_input {
        width:150px;
        height:50px;
        font-size:20px;
      }
      select {
        width:100px;
        height:30px;
      }
       input[required]{
        border-color: red;
      } 
       li label{
        font-style: italic;
        color: red;
      } 
      input:checked + label{
        font-weight: bold;
      }
    </style>
    
  </head>
  <body> 
  <%@ include file="../jdbc_set.jsp" %>
  <% request.setCharacterEncoding("EUC-KR"); %>
    <div id="container">
      <h1>회원 가입</h1>
      <form>
        <fieldset class="field1">
          <legend>사용자 정보</legend>    
          <ul>
            <li>
              <label class="li_label" for="U_ID">아이디</label>
              <input class="txt_input" type="text" id="U_ID" autofocus placeholder="영문, 숫자만 입력" required> 
              <input type="button" onclick="check()" value="중복확인">
            </li>
            <li>
              <label class="li_label" for="pwd">비밀번호</label>
              <input class="txt_input" type="password" id="pwd" required> 
            </li> 
            <li>
              <label class="li_label" for="pwd2">비밀번호 확인</label>
              <input class="txt_input" type="password" id="pwd2" required> 
            </li>        
            <li>
              <label class="li_label" for="u_name">이름</label>
              <input class="txt_input" type="text" id="u_name" required> 
            </li>
            <li>
              <label class="li_label" for="phone">핸드폰 번호</label>
              <input class="txt_input" type="text" id="phone"> 
            </li>
            <li>
              <label class="li_label" for="age">나이</label>
              <input class="txt_input" type="number" id="age"> 
            </li>
            <li>
              <label class="li_label" for="addr">주소</label>
              <input class="txt_input" type="text" id="addr"> 
            </li>
          </ul>      
        </fieldset>
        <div id="buttons">
          <input class="btn_input" type="button" value="가입하기" onclick="join()">
          <input class="btn_input" type="reset" value="취소">
        </div>
      </form>
    </div>
    
   
  </body>
</html>
<script>
  function join(){
	var regExp = /^[a-z|A-Z|0-9]*$/;
		
    var U_ID = document.querySelector('#U_ID')
    
    if(!regExp.test(U_ID.value)){
        alert("영어+숫자만 가능")
        login.id.select();
        return;
    }
    
    if(U_ID.value==''||U_ID.value==undefined){
      alert("아이디를 입력해주세요.");
      return;
    }
    var pwd = document.querySelector('#pwd')
    if(pwd.value==''||pwd.value==undefined){
      alert("패스워드를 입력해주세요.");
    }
    
    var pwd2 = document.querySelector('#pwd2')
    if(pwd2.value==''||pwd2.value==undefined){
      alert("비밀번호 확인을 입력해주세요.");
      return;
    }else if(pwd.value!=pwd2.value){
      alert("비밀번호가 일치하지 않습니다.");
      return;
    }
    var u_name = document.querySelector('#u_name')
    if(u_name.value==''||u_name.value==undefined){
      alert("이름을 입력해주세요.");
    }
    
    <%
	String U_ID = request.getParameter("U_ID");
    String pwd = request.getParameter("pwd");
    String u_name = request.getParameter("u_name");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
    String addr = request.getParameter("addr");
	Statement stmt = null;

	try {
		String sql = "INSERT INTO TBL_USER(U_ID, PWD, U_NAME, PHONE, AGE, ADDR) VALUES('" + U_ID + "','" + pwd + "', '" + u_name + "', '" + phone + "', '"+ age +"', '"+addr+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		%>alert("회원 가입이 완료되었습니다.");<%
	} catch (SQLException ex) {
		out.println("SQLException: " + ex.getMessage());
	} 
%>
  }
  
  function check(){
		<%
		stmt = conn.createStatement();
		try {
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = " + U_ID;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				if(U_ID.equals(rs.getString("U_ID"))){
					%>alert("중복된 아이디입니다.");<%
				} else {
					%>alert("사용가능한 아이디입니다.");<%
				}
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>   
	console.log(U_ID.value);
}

</script>
