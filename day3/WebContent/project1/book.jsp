<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#vip{
		font-weight : bold;
		text-decoration: underline;
	}
	#container{
		margin : 10px auto;
		width : 1100px;
	}
	fieldset {
		padding: 45px;
		margin-top : 30px;
		border : 1px solid rgb(200, 200, 200);
	}
	.put {
		border-style: none;
		border-bottom: 1px solid #ccc;
	}
	h2{
		color : rgb(175, 160, 136);
	}
	hr{
		border-color : rgb(175, 160, 136);
	}	
	#ul1, #ul2 {
		display: inline-block;
		vertical-align: top;
		line-height : 50px;
		margin-left : 100px;
	}
	#ul2{
		margin-left : 110px;
	}
	li{
		list-style:none;
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
	#vip{
		color:rgb(175, 160, 136);
	}
	#text{
        color:gray;
        font-size:16px;
    }
    input[type="button"]:hover {
	  	cursor: pointer;
	}
</style>
<header>
	<jsp:include page="home.jsp" />
</header>
<body>
<div id="container">
	<%@ include file="../jdbc_set2.jsp" %>
	<h2>객실 예약</h2>
	<hr>
	<fieldset>
	<form name="form" action="bookCheck.jsp">
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		%><span id="text"><%=uName%>님 예약을 감사드립니다.</span>
	<hr>
	<ul id="ul1">
		<li>날짜 선택</li>
		<li>객실 선택 </li>
		<li>인원수</li>
		<li>조식</li>
		<li>인피니티풀</li>
		<li>디너 레스토랑</li>
	</ul>
	
	<ul id="ul2">
		<li> <input class="put" name="start" type="date" onchange="updatelastDate()" />　 ~　 <input class="put" name="last" type="date"></li>
		<li>
			<select name="room" onchange="updatePaxOptions()" class="put">
				<option value="디럭스 더블">디럭스 더블</option>
				<option value="디럭스 트윈">디럭스 트윈</option>
				<option value="스위트 더블">스위트 더블</option>
				<option value="스위트 트윈">스위트 트윈</option>
				<option value="펜트하우스">펜트하우스</option>
			</select>
		</li>
		<li>
			<select name="pax" class="put">
			</select>
		</li>
		<li>신청 <input type="radio" name="bf" value="Y" /> 　미신청 <input type="radio" name="bf" value="N" checked /></li>
		<li>
			<% 
			ResultSet rs = null;
			Statement stmt = null;
		
			try {
				stmt = conn.createStatement();
				String sql = "SELECT * FROM JN_USER WHERE ID = '"+ uId + "'";
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					String grade = rs.getString("GRADE");
					if(grade.equals("VIP")){
						%><span id="vip"> VIP 회원 인피니티풀 무료 이용 </span>
						<input type="radio" name="pool" value="Y" checked/><%
					}else{
						%>이용 <input type="radio" name="pool" value="Y" /> 　이용 안 함 <input type="radio" name="pool" value="N" checked /><%
					}
				}
			} catch (SQLException ex) {
				out.println("SQLException: " + ex.getMessage());
			} 
			%>
		</li>
		<li>예약 <input type="radio" name="res" value="Y" /> 　예약 안 함 <input type="radio" name="res" value="N" checked /></li>
	</ul>
	<div class="btns"><input class="btn" type="button" value="예약신청" onclick="book()"/> <input class="btn" type="button" value="취소" onclick="back()" /></div>
</form>
</fieldset>
</div>
</body>
</html>
<script>
	function updatelastDate() {
		var form = document.form;
		const date1 = new Date(form.start.value);
		const date2 = new Date(date1.getTime() + 24 * 60 * 60 * 1000); // start 다음 날짜 계산 (24시간 이후)
		var yyyy = date2.getFullYear();
		var mm = String(date2.getMonth() + 1).padStart(2, '0');
		var dd = String(date2.getDate()).padStart(2, '0');
		form.last.value = yyyy + '-' + mm + '-' + dd; // last에 다음 날짜 설정
		}
	function updatePaxOptions() {
		  var roomSelect = document.form.room;
		  var paxSelect = document.form.pax;
		  
		  // 이전에 선택된 인원수 옵션 초기화
		  paxSelect.innerHTML = "";
		  
		  if (roomSelect.value == "펜트하우스") {
		    // 펜트하우스가 선택된 경우 1명부터 4명까지 옵션 추가
		    for (var i = 1; i <= 4; i++) {
		      var option = document.createElement("option");
		      option.value = i;
		      option.text = i + "명";
		      paxSelect.appendChild(option);
		    }
		  } else {
		    // 펜트하우스가 아닌 경우 1명과 2명의 옵션 추가
		    for (var i = 1; i <= 2; i++) {
		      var option = document.createElement("option");
		      option.value = i;
		      option.text = i + "명";
		      paxSelect.appendChild(option);
		    }
		 }
	}
	
	//예약하기 버튼
	function book() {
		var form = document.form;
		const date1 = new Date(form.start.value);
		const date2 = new Date(form.last.value);
		
		if (!form.start.value || !form.last.value) {
			alert("날짜를 선택해주세요."); // 날짜 선택하지 않았을 때 alert
			return;
		}
		
		if (date1 > date2) {
			alert("퇴실일이 입실일보다 빠릅니다.");
			return;
		}
		
		const today = new Date();
		date1.setHours(0, 0, 0, 0); // 시간을 0시 0분 0초로 설정
		today.setHours(0, 0, 0, 0); // 시간을 0시 0분 0초로 설정
		if (date1 < today){
			alert("오늘 날짜 이후로 선택 가능합니다.");
			return;
		}
		form.submit();
	}
	
	function back() {
		location.href = "main.jsp";
	}
	
	// 페이지 로드 시에 인원수 옵션 초기화
	updatePaxOptions();
</script>