<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
      body{
      width:500px;
      margin: auto;
      }
      h2{
         background-color: yellow;
      }
</style>
<body>
<form method="post" action="insert_student.do">
<table >
	<tr>
		<th colspan="2">
			<h2> 학생 정보</h2>
   		</th>
   	</tr>
   	
   		<tr>
   			<th>
   				학생 아이디 : 
   			</th>
   			<td>
   				<input type = text name= "name" size =16>
   			</td>
   		</tr>
   		<tr>
   			<th>
   				학생 이름 : 
   			</th>
   			<td>
   				<input type = text name= "id" size =16>
   			</td>
   		</tr>
   		<tr>
   			<th>
   				학생 번호 : 
   			</th>
   			<td>
   				<input type = text name= "num" size =16>
   			</td>
   		</tr>
   		<tr>
   			<th>
   				태어난 해 :
   			</th>
   			<td>

   				<select id ="year" name="year">
   					<% for(int i=1990;i<=2040;i++){
						%><option><%= i %></option>
   					<% }
   					%>
   				</select>
   			</td>
   		</tr>
   		<tr>
   			<th>
   				암호 :
   			</th>
   			<td>
   				<input type =password name = "pw" size = 16>
   			</td>
   		</tr>
   		<tr>
   			<th>
   				전자메일 :
   			</th>
   			<td>
   				<input type = email name = "email" size = 16><br>
   			</td>
   		</tr>
   		<tr>
   			<th><input type = "submit" value="입력완료"></th>
   			<th><input type = "reset" value ="다시쓰기"></th>
   		</tr>
   </table>
  </form>
</body>
</html>