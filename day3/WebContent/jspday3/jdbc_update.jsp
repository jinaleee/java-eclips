<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set.jsp" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String stuNo = request.getParameter("stuNo");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		Statement stmt = null;

		try {
			/* stmt = conn.createStatement();
			String select = "SELECT COUNT(*) AS CNT FROM STUDENT WHERE STU_NO = '" + stuNo + "' AND STU_DEPT = '" + stuDept + "' AND STU_GRADE = '" + stuGrade + "'";
			ResultSet rs = stmt.executeQuery(select);
			rs.next();
			int cnt = Integer.parseInt(rs.getString("CNT"));
			if(cnt == 0){
				String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "' WHERE STU_NO = " + stuNo;
				stmt.executeUpdate(update);
				out.println("STUDENT 테이블 업데이트 성공했습니다.");
			} else {
				String delete = "DELETE FROM STUDENT WHERE STU_NO = " + stuNo;
				stmt.executeUpdate(delete);
				out.println("STUDENT 테이블 삭제 성공했습니다.");
			} */
			stmt = conn.createStatement();
			String select = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
			ResultSet rs = stmt.executeQuery(select);
			if(rs.next()){
				if(stuNo.equals(rs.getString("STU_NO").trim()) && stuDept.equals(rs.getString("STU_DEPT")) && stuGrade.equals(rs.getString("STU_GRADE"))){
					String delete = "DELETE FROM STUDENT WHERE STU_NO = " + stuNo;
					stmt.executeUpdate(delete);
					out.println("STUDENT 테이블 삭제 성공했습니다.");
				} else {
					String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "' WHERE STU_NO = " + stuNo;
					stmt.executeUpdate(update);
					out.println("STUDENT 테이블 업데이트 성공했습니다.");
				}
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
			
		} catch (SQLException ex) {
			out.println("STUDENT 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
</body>
</html>