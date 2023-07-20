<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
</head>
<style>
	.btns{
		margin : 40px;
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
	input[type="button"]:hover {
	  	cursor: pointer;
	}
	.text{
		text-align : center;
		margin : 70px;
		line-height : 30px;
	    color: rgb(133 123 107);
	    font-size: 20px;
	    font-weight: 100;
	}
	#ul1, #ul2 {
		display: inline-block;
		vertical-align: top;
		line-height : 50px;
		margin-left : 30px;
	}
	li{
		list-style : none;
	}
</style>
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
		<ul id="ul1">
			<li>예약 번호</li>
			<li>ID</li>
			<li>성함</li>
			<li>룸</li>
			<li>입실일</li>
			<li>퇴실일</li>
			<li>인원수</li>
			<li>조식</li>
			<li>인피니티풀</li>
			<li>레스토랑</li>
		</ul>
		
		<ul id="ul2">
			<li><%= num %></li>
			<li><input name="uId" value="<%=userID%>"></li>
			<li><input name="uName" value="<%=userName%>"></li>
			<li>
			<select name="room" onchange="updatePaxOptions()">
				<option value="디럭스 더블">디럭스 더블</option>
				<option value="디럭스 트윈">디럭스 트윈</option>
				<option value="스위트 더블">스위트 더블</option>
				<option value="스위트 트윈">스위트 트윈</option>
				<option value="펜트하우스">펜트하우스</option>
			</select>
			</li>
			<li>
			<input type="date" name="startdate" value="<%=startdate%>" onchange="updatelastDate()">
			</li>
			<li><input type="date" name="lastdate" value="<%=lastdate%>"></li>
			<li>
			<select name="pax">
			</select>
			</li>
			<li>
			신청 <input type="radio" name="bf" value="Y" checked> 　미신청 <input type="radio" name="bf" value="N">
			</li>
			<li>
			신청 <input type="radio" name="pool" value="Y" checked> 　미신청 <input type="radio" name="pool" value="N">
			</li>
			<li>
			신청 <input type="radio" name="res" value="Y" checked> 　미신청 <input type="radio" name="res" value="N">
			</li>
		</ul>
		<%
		}
		} catch (SQLException e) {
		out.println(e.getMessage());
		}
		%>
		<div class="btns">
			<input class="btn" type="button" value="수정" onclick="a_update()">
			<input class="btn" type="button" value="취소" onclick="cancel()">
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