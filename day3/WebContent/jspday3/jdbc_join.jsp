<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("EUC-KR"); %>
	<form action="jdbc_insert1.jsp" method="post" name = "add">
		<div>학번 : <input type="text" name="stuNo"></div>
		<div>이름 : <input type="text" name="stuName"></div>
		<div>학과 : <input type="text" name="stuDept"></div>
		<div>학년 : <input type="text" name="stuGrade"></div>
		<div><input type="submit" value="학생추가" onclick="check();")></div>
	</form>
</body>
</html>
<script>
	function check(){
		var add = document.add;
		if(add.stuNo.value.length!=8){
			alert("다시 입력하세요.");
			add.stuNo.select();
			return;
		}
	}
</script>