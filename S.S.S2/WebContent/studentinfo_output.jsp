<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="ex)dbconn.jsp" %>
<%
		PreparedStatement pstmt = null;
		ResultSet resultSet =null;
		try{
		String sql1 = "select * from student2";
		
		pstmt = conn.prepareStatement(sql1);
		resultSet = pstmt.executeQuery();
		%>
		<table border="1">
			<tr>
				<th>학생ID</th>
				<th>학생이름</th>
				<th>학생번호</th>
				<th>생년월일</th>
				<th>비밀번호</th>
				<th>전자메일</th>
			</tr>
		<%while (resultSet.next()){
			%>
			<tr>
				<td><%=resultSet.getString("ID")%></td>
				<td><%=resultSet.getString("NAME")%></td>
				<td><%=resultSet.getString("NUM")%></td>
				<td><%=resultSet.getString("YEAR")%></td>
				<td><%=resultSet.getString("PW")%></td>
				<td><%=resultSet.getString("EMAIL")%></td>
			</tr>
	<%}%>
	</table><%
	}catch (SQLException ex){
		out.println("오류발생.");
		out.println("SQLException: "+ex.getMessage());

	}finally{
		if(pstmt != null){
			pstmt.close();
		}
		if(conn!= null){
			conn.close();
		}
		if(resultSet!= null){
			resultSet.close();
		}
	}%>
</body>
</html>