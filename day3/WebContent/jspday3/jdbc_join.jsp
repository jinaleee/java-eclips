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
		<div>�й� : <input type="text" name="stuNo"></div>
		<div>�̸� : <input type="text" name="stuName"></div>
		<div>�а� : <input type="text" name="stuDept"></div>
		<div>�г� : <input type="text" name="stuGrade"></div>
		<div><input type="submit" value="�л��߰�" onclick="check();")></div>
	</form>
</body>
</html>
<script>
	function check(){
		var add = document.add;
		if(add.stuNo.value.length!=8){
			alert("�ٽ� �Է��ϼ���.");
			add.stuNo.select();
			return;
		}
	}
</script>