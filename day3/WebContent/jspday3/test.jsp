<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="test2.jsp" name="test">
		<input type="text" name="btnKind" value="" hidden/>
		<input type="text" name="stuNo" />
		<div>
			<button onclick="kind('search')">�˻�</button>
			<button onclick="kind('insert')">����</button>
			<button onclick="kind('remove')">����</button>
		</div>
	</form>
</body>
</html>
<script>
	function kind(text){
		document.test.btnKind.value = text;
		document.test.submit();
	}
</script>