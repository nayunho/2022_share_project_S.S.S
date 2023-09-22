<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>회원가입</title>
    <style>
        body{
            background-color:antiquewhite;

        }
        body>h1{
            font-size: 50px;
            text-align: center;
        }
        .id_pw{
            margin:auto;
            width:500px;
            background-color:#fff;
            height:550px;
            border-radius: 10px;
        }
        input[type="text"]{
            width:200px;
            height: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        input[type="tel"]{
            width:200px;
            height: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        input[type="email"]{
            width:200px;
            height: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        label{
            line-height: 2;
        }
        input[type="button"]{
            width:200px;
            border-radius: 10px;
        }
        input[value="중복확인"]{
            margin-right:-8px;
            float: right;
            width:70px;
            border-radius: 10px;
        }
        .frame{
            width:200px;
            margin:auto;
        }
        .text_email_1{
        	display:none;
            color:red;
        }
        .text_email_2{
        	display:none;
            color:blue;
        }
        .text_name_1{
        	display:none;
            color:red;
        }
        .text_name_2{
        	display:none;
            color:blue;
        }
    </style>
</head>
<body>
<%
	Connection conn = null;
	Connection conn2 = null;
	String url="jdbc:mysql://localhost:3306/s.s.s";
	String user = "root";
	String password = "skdbsgh4520";
	String query = "SELECT email FROM login";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	conn2 = DriverManager.getConnection(url,user,password);
	%>
    <script>
    </script>
    <h1>S.S.S</h1>
   <form  action="join.do">
    <div class="id_pw">
        <div class="frame">
        <br>
            <label for="ID">이메일</label><br>
            <input id="ID" type="email" placeholder="e-mail" name="id" required="required"><br>
 
            <input type="button" value="중복확인" onclick="check_double_email();" required="required">
            <small class="text_email_1">아이디 중복!</small>
            <small class="text_email_2">사용 가능한 이메일입니다.</small>
            <br><br>

            <label for="PW">패스 워드</label><br>
            <input id="PW" type="text" placeholder="패스워드" name="pw" required="required"><br>
            
            <label for="NICNAME">닉네임</label><br>
            <input id="NICNAME" type="text" placeholder="닉네임" name="nicname" required="required"><br>
            <input type="button" value="중복확인" onclick="check_double_nicname();"><br><br>
            
            <small class="text_name_1">닉네임 중복!</small>
            <small class="text_name_2">사용 가능한 닉네임입니다.</small><br><br>
            <label for="NICNAME">전화번호</label><small> '-'포함해서 쓰세요!</small><br>
            <input id="NICNAME" type="tel" placeholder="전화번호" name="number" required="required"><br>
            <input type="submit" value="가입하기">
            
        </div>
    </div>
    </form>
    <script>
    function check_double_email() {
        $(".text_email_1").css("display", "none");
        $(".text_email_2").css("display", "none");
        var userID = $("#ID").val();
        var emailList = [];

        <% 
        PreparedStatement pstmt1 = null;
        ResultSet resultSet1 = null;
        try {
            String sql1 = "select email from login";
            pstmt1 = conn.prepareStatement(sql1);
            resultSet1 = pstmt1.executeQuery();
            while (resultSet1.next()) {
        %>
                emailList.push('<%= resultSet1.getString("email") %>');
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt1 != null) {
                pstmt1.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (resultSet1 != null) {
                resultSet1.close();
            }
        }
        %>

        var emails = emailList;
        for (var i = 0; i < emails.length; i++) {
            if (userID === emails[i]) {
                $(".text_email_1").css("display", "inline");
                $(".text_email_2").css("display", "none");
                $("#ID").val()=null;
                return;
            }
        }

        $(".text_email_2").css("display", "inline");
    }
    function check_double_nicname() {
        $(".text_name_1").css("display", "none");
        $(".text_name_2").css("display", "none");
        var userNAME = $("#NICNAME").val();
        var nameList = [];

        <% 
        PreparedStatement pstmt2 = null;
        ResultSet resultSet2 = null;
        try {
            String sql1 = "select name from login";
            pstmt2 = conn2.prepareStatement(sql1);
            resultSet2 = pstmt2.executeQuery();
            while (resultSet2.next()) {
        %>
        		nameList.push('<%= resultSet2.getString("name") %>');
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt2 != null) {
                pstmt2.close();
            }
            if (conn2 != null) {
                conn2.close();
            }
            if (resultSet2 != null) {
                resultSet2.close();
            }
        }
        %>

        var names = nameList;
        for (var i = 0; i < names.length; i++) {
            if (userNAME === names[i]) {
                $(".text_name_1").css("display", "inline");
                $(".text_name_2").css("display", "none");
                return;
            }
        }

        $(".text_name_2").css("display", "inline");
    }


    	
    </script>
</body>
</html>