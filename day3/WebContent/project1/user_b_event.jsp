<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="updateForm" action="user_bookUpdate.jsp">
		<%@ include file="../jdbc_set2.jsp"%>
		<%
		String num = request.getParameter("num");

		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체

		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JN_ROOM WHERE NUM = '" + num + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String userID = rs.getString("ID");
				String userName = rs.getString("NAME");
				String room = rs.getString("ROOM");
				String startdate = rs.getString("STARTDATE");
				String lastdate = rs.getString("LASTDATE");
				String pax = rs.getString("PAX");
				String bf = rs.getString("BFYN").equals("Y") ? "신청" : "신청 안 함";
				String pool = rs.getString("POOLYN").equals("Y") ? "신청" : "신청 안 함";
				String res = rs.getString("RES").equals("Y") ? "신청" : "신청 안 함";
		%>

		<input name="num" value="<%=num%>" hidden />
		<div>예약 번호 : <%= num %></div>
		<div>
			ID : <input name="uId" value="<%=userID%>">
		</div>
		<div>
			성함 : <input name="uName" value="<%=userName%>">
		</div>
		<div>
			룸 : <select name="room" onchange="updatePaxOptions()">
				<option value="디럭스 더블">디럭스 더블</option>
				<option value="디럭스 트윈">디럭스 트윈</option>
				<option value="스위트 더블">스위트 더블</option>
				<option value="스위트 트윈">스위트 트윈</option>
				<option value="펜트하우스">펜트하우스</option>
			</select>
		</div>
		<div>
			입실일 : <input type="date" name="startdate" value="<%=startdate%>"
				onchange="updatelastDate()">
		</div>
		<div>
			퇴실일 : <input type="date" name="lastdate" value="<%=lastdate%>">
		</div>
		<div>
			인원수 : <select name="pax">
			</select>
		</div>
		<div>
			조식 : 신청 <input type="radio" name="bf" value="Y" checked> 미신청
			<input type="radio" name="bf" value="N">
		</div>
		<div>
			인피니티풀 : 신청 <input type="radio" name="pool" value="Y" checked>
			미신청 <input type="radio" name="pool" value="N">
		</div>
		<div>
			레스토랑 : 신청 <input type="radio" name="res" value="Y" checked>
			미신청 <input type="radio" name="res" value="N">
		</div>
		<%
		}
		} catch (SQLException e) {
		out.println(e.getMessage());
		}
		%>
		<div>
			<input type="button" value="수정" onclick="a_update()">
			<input type="button" value="취소" onclick="cancel()">
		</div>
	</form>

</body>
</html>
<script>
	function cancel() {
		window.close();
	}

	function updatelastDate() {
		var form = document.updateForm;
		const date1 = new Date(form.startdate.value);
		const date2 = new Date(date1.getTime() + 24 * 60 * 60 * 1000);
		var yyyy = date2.getFullYear();
		var mm = String(date2.getMonth() + 1).padStart(2, '0');
		var dd = String(date2.getDate()).padStart(2, '0');
		form.lastdate.value = yyyy + '-' + mm + '-' + dd;
	}

	function updatePaxOptions() {
		var roomSelect = document.updateForm.room;
		var paxSelect = document.updateForm.pax;

		paxSelect.innerHTML = "";

		if (roomSelect.value == "펜트하우스") {
			for (var i = 1; i <= 4; i++) {
				var option = document.createElement("option");
				option.value = i;
				option.text = i + "명";
				paxSelect.appendChild(option);
			}
		} else {
			for (var i = 1; i <= 2; i++) {
				var option = document.createElement("option");
				option.value = i;
				option.text = i + "명";
				paxSelect.appendChild(option);
			}
		}
	}

	function a_update() {
		var form = document.updateForm;
		const date1 = new Date(form.startdate.value);
		const date2 = new Date(form.lastdate.value);

		if (!form.startdate.value || !form.lastdate.value) {
			alert("날짜를 선택해주세요.");
			return;
		}

		if (date1 > date2) {
			alert("퇴실일이 입실일보다 빠릅니다.");
			return;
		}

		/* const today = new Date();
		date1.setHours(0, 0, 0, 0);
		today.setHours(0, 0, 0, 0);
		if (date1 < today) {
			alert("오늘 날짜 이후로 선택 가능합니다.");
			return;
		} */
		form.submit();
	}
	
	updatePaxOptions();
</script>