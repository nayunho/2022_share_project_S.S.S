<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script>
    function logincheck() {
		alert("로그인후 이용가능합니다.");
		location.href="main.jsp";
	}
    </script>
    <title>S.S.S</title>
    <style>
        .main_Logo_menu{
            border:5px double black; 
            float:left;
            width:85%;
            height:60px;
            background-color:navajowhite;
            margin:-8px -8px;
        }
        .main_Logo_menu>a{
           padding-left:50px;
           font-size:25px; 
           float:left;
           overflow:hidden;
           margin: 12px 0px;
        }
        .category{
            float:left;
        }
        .category>li{
            float:left;
            list-style-type: none;
            line-height: 0px;
            margin-top: 15px;
            padding-left:50px;
            position: relative;
        }
        .category>li>ul{
            position: absolute;
            padding:20px;
            list-style-type: none;
            margin: 30px;
            margin-top:40px;
            padding:0px;
            left:0px;
            opacity: 0;
        }
        .category>li>ul>li{
            border-bottom: 1px dotted brown;
            padding:20px;
            width:70px;
            height: 5px;
        }
        .category>li:hover>a{
            color:white;
        }
        .category>li:hover>ul{
        opacity: 1;
        transition: 1s;
        }
        .search{
            float:right;
            line-height: 58px;
            margin-right:10px;
        }
        input[name="search"]{
            height: 35px;
            border-radius:10px;
        }
        input[name="searchbutton"]{
            height: 35px;
            border-radius:10px;
        }
        .Login{
            float:right;
            width:15%;
            height:60px;
            margin-top:-8px;
            margin-right:-8px;
            margin-left:-8px;
            border:5px double black; 
            background-color:navajowhite;
        }
        input[name="email"]{
            border-radius: 10px;
            margin-left:8px;
            margin-top:8px;
            width:150px;
        }
        input[name="pw"]{
            border-radius: 10px;
            margin-left:8px;
            margin-top:5px;
            width:150px;
        }
        input[name="loginbutton"]{
            border-radius: 10px;
            margin-left:8px;
            width:100px;
        }
        input[name="loginmake"]{
            border-radius: 10px;
            margin-left:8px;
            width:100px;
        }
        .section{
            clear:both;
            width:100%;
            text-align: center;
            background-color:rgb(250,236,197);
            font-size:5em;
            height: 450px;
            margin-left:-8px;
            padding-right:16px;
            line-height: 180px;
        }
        .explanation{
            text-align: center;
            width:100%;
           margin:0px -8px ;
            height:450px;
            line-height: 50px;
            float:left;
        }
        .explanation>h1{
            font-size:3em;
        }
        .explanation>h3{
            font-size:2em;
        }
        #registration{
            border-radius:10px;
            height: 50px;
        }
        .footer{
            clear:both;
            text-align: center;
            margin-left: -8px;
            width:100%;
            border-top:1px solid black;
            padding-right:8px;
        }
        .Logo{
        	text-decoration:none;
        	color:black;
        }
       } #popular_items{
        float:left;
        width:80%;}
        .stuff_main{
        border:1px solid black;
        border-radius: 5px;
        height: 365px;
        float:left
        
        }
        .stuff_main .card .img{
        	height:200px;
        }
        .stuff_main .card .text p{
        	font-size:14px;
        	opacity: .8;
        }
        .stuff_main .card .text a{
        	background: black;
        	color:white;
        	border:2px solid white;
        	border-radius: 5px;
        	padding:5px 10px;
        	font-size:10px;
        	transition:.5s ease;
        }
        .stuff_main .card .text a:hover{
        	transition:.5s ease;
        	border:2px solid black;
        	background: transparent;
        	color:black;
        }
        .popular_search{
            float:right;
            width:17%;
            height:54px;
            margin-top:-55px;

        }
    </style>
</head>
<body>
<%
	Connection conn = null;
	
	String url="jdbc:mysql://localhost:3306/s.s.s";
	String user = "root";
	String password = "skdbsgh4520";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	%>
	
<div class="total_main">
    <!-- nav-->
    <div class="main_Logo_menu">
        <a class="Logo" onclick="logincheck();">S.S.S</a>
    
        <ul class="category">
            <li>
                <a>물품</a>
                <ul>
                    <li><a href="#" style="text-decoration: none; color:black;" onclick="logincheck();">물품 보기</a></li>
                </ul>
            </li>
            <li>
                <a>메세지</a>
                <ul>
                    <li><a href="#" style="text-decoration: none; color:black;" onclick="logincheck();">메세지 함</a></li>
                </ul>
            </li>
        </ul>
        <div class="search">
            <form action="#">
            <input name="search_stuff" type="text" placeholder="물품을 검색해주세요!" style="height: 35px;border-radius:10px;">

            <input name="searchbutton" type="submit" value="검색" onclick="logincheck();">
            </form>
        </div>
        </div>
    </div>
    <div class="Login">
     <form method=post action="login.do">
        <a>
            <input name="email" type="text" placeholder="아이디">
            <input type="submit" name="loginbutton" value="로그인">
            <input name="pw" type="text" placeholder="비밀번호">
       </a>
     </form>
     <form method=post action="join.jsp">
        <input style="float:right; margin-top:-22.5px;margin-right:3.5px" type="submit" name="loginmake" value="회원가입">
    </form>
        
    </div>
    <!-- section-->
    <div class="section" style="padding-top:30px">
        <a style="font-size:150px; -webkit-text-stroke: 2px white; color:black; font-family: 'Single Day',cursive">Welcome</a><br>
        <span style="font-size:100px; -webkit-text-stroke: 2px white; color:black; font-family: 'Single Day',cursive">S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></span>
    </div>
    <div class="explanation">
        <br>
        <br>
        <h1>S.S.S</h1>
        <h3>물건을 나누어 보세요!</h3>
        <a href="#" style="text-decoration: none; color:black">
        <input id="registration" type="submit" value="물건 등록하러 가기" onclick="logincheck();"></a>

    </div>
    <%
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
	ResultSet resultSet1 =null;
	ResultSet resultSet2 =null;
	try {
		String query = "SELECT * FROM stuff1 order by stuffID  desc LIMIT 4";
		pstmt1 = conn.prepareStatement(query);
		resultSet1 = pstmt1.executeQuery();
		
		String sql = "select * from search_stuff order by stuffID desc LIMIT 7";
		pstmt2 = conn.prepareStatement(sql);
		resultSet2 = pstmt2.executeQuery();
		%><div class="popular_items" >
		  <h3>최근 물품</h3><%
		while(resultSet1.next()) {%>
			<div class="stuff_main" style="width:20% ;margin-right:8px; margin-bottom: 8px;" >
			<div class="card" >
			<div class="img">
			<img src="upload/<%= resultSet1.getString("file")%>" alt="..." style="width:100%;height: 220px">
			</div>  
			<div class="text">
				<h2>물품: <%= resultSet1.getString("title")%></h2>
				<p>위치: <%= resultSet1.getString("position")%></p>
				<p>내용: <%= resultSet1.getString("context")%></p>
				<a href="#" style="text-decoration: none;" onclick="logincheck();">사러가기</a>
			</div>
			</div>	
  		</div>
	</div><%}%>
	<div class="popular_search">
        <h3>최근 검색어</h3>
        <%int i=1;
		while(resultSet2.next()) {%>
    		<h2><%=i %>.<%= resultSet2.getString("search_stuff")%></h2>
    		<%i++;}%>
    		</div><%
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally{
		if(pstmt1 != null){
			pstmt1.close();
		}
		if(pstmt2 != null){
			pstmt2.close();
		}
		if(conn!= null){
			conn.close();
		}
		if(resultSet1!= null){
			resultSet1.close();
		}
		if(resultSet2!= null){
			resultSet2.close();
		}
	}
    %>
    <!--footer-->
    <footer class="footer">
        <p >&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
    </div>
</body>
</html>