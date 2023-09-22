<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <% request.setCharacterEncoding("utf-8"); %>
   <%@ include file="ex)dbconn.jsp" %>
   <%
		request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String num= request.getParameter("num");
		String year= request.getParameter("year");
		String pw= request.getParameter("pw");
		String email= request.getParameter("email");
		PreparedStatement pstmt = null;
		ResultSet resultSet =null;
		try{
			String sql = "INSERT INTO student2(ID,NAME,NUM,YEAR,PW,EMAIL) VALUES(?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, num);
			pstmt.setString(4, year);
			pstmt.setString(5, pw);
			pstmt.setString(6, email);
			pstmt.executeUpdate();
			out.println("student2 테이블 삽입이 성공했습니다.");
			response.sendRedirect("studentinfo_output.jsp");
		}catch (SQLException ex){
			out.println("student2 테이블 삽입이 실패했습니다.");
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
		}
	%>
   </body>
</html>