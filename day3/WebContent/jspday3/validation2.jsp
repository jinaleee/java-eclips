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
	    <div>���̵� : <input name="id" type="text"></div>
	    <div>�н����� : <input name="pwd" type="text"></div>
	    <input type="submit" value="����" onclick="check(); return false;" />
    </form>
</body>
</html>
<script>
	// check �Լ� ����
	// ���̵� ���� ��ҹ��ڸ� �Է� �����ϵ���
	// ����, Ư������, �ѱ۵��� �Էµǰ� ������ ������ '���� ��ҹ��ڸ� ����' �˸�
	// �н������ ���ڸ� �����ϵ��� �ƴ� ��� '�н������ ���ڸ� ����' �˸�
	
	function check(){
		var login = document.login;
		var regExp = /^[a-z|A-Z]+$/;
		var regExp2 = /^[0-9]*$/;
		
        if(!regExp.test(login.id.value)){
            alert("���� ��ҹ��ڸ� ����")
            login.id.select();
            return;
        }else if(!regExp2.test(login.pwd.value)){
            alert("���ڸ� ����")
            login.pwd.select();
            return;
        }
        if(login.id.value==undefined || login.id.value==""){
            alert("���̵� �Է�");
            login.id.focus();
            return;
        }else if(login.pwd.value=="" || login.pwd.value==undefined){
            alert("��й�ȣ �Է�");
            login.pwd.focus();
            return;
        }
		login.submit();
		
	}
</script>