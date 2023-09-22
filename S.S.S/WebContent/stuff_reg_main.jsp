<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .Logo{
        	text-decoration:none;
        	color:black;
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
            background-color:lemonchiffon;
            font-size:5em;
            height: 400px;
            margin-left:-8px;
            padding-right:16px;
            line-height: 180px;
        }
        #stuff_main{
        width:80%;
        margin:auto;}
        .stuff_main{
        border:1px solid black;
        border-radius: 5px;
        height: 365px;
        
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
        .footer{
            clear:both;
            text-align: center;
            margin-left: -8px;
            width:100%;
            border-top:1px solid black;
            padding-right:8px;
        }
     	i{
     	color:white;
      	}
        .logout{
        	text-decoration: none;
        	color:black}
        .logout:hover{
        	color:blue;
        	}
        .stuff_main{
        width:85%;
        margin:0 auto;
      	float:left;
        }
        .stuff_button{
        border-radius: 10px;
        
        }
        
    </style>
</head>
<body>
        <% 
        String name = (String)session.getAttribute("nicname");  %>
<% request.setCharacterEncoding("utf-8"); %>
    <!-- nav-->
    <div class="main_Logo_menu">
        <a class="Logo" href="home.do">S.S.S</a>
    
        <ul class="category">
            <li>
                <a>물품</a>
                <ul>
                    <li><a href="reg_show.do" style="text-decoration: none; color:black;">물품 보기</a></li>
                </ul>
            </li>
            <li>
                <a>메세지</a>
                <ul>
                    <li><a href="message_show.do?dbnicname=<%=name  %>" style="text-decoration: none; color:black;">메세지 함</a></li>
                </ul>
            </li>
        </ul>
        <div class="search">
            <form action="search.do">
            <input name="search_stuff" type="text" placeholder="물품을 검색해주세요!" style="height: 35px;border-radius:10px;">

            <input name="searchbutton" type="submit" value="검색" >
            </form>
        </div>
        </div>
    </div>
    <div class="Login">   
       <h3><%=name  %>님 안녕하세요! &nbsp;<a class="logout" type="button" href="main.jsp">로그아웃</a> </h3>
       
    </div>
    <!-- section-->
    <div class="section" style="padding-top:10px;">
        <a style="-webkit-text-stroke: 1px grey; color:black; font-family: 'Single Day',cursive">나눔은 더 큰 행복이 됩니다!</a><br>
        <span style="font-size:50px; font-weight:bolder;">사랑과 행복을 나누는 캠페인</span>
    </div>
    
    <div id="stuff_main">
    <h1>나눔 물품</h1>
    <c:forEach items="${stufboard}" var="dto">
    <div class="stuff_main" style="width:24.2% ;margin-right:8px;margin-top:8px;">
  		<div class="card">
			<div class="img">
			<img src="upload/${dto.file}" alt="..." style=" width:364px;height: 220px">
			
			</div>  
			<div class="text">
				<h2>물품: ${dto.title}</h2>
				<p>위치: ${dto.position}</p>
				<p style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">내용: ${dto.context}</p>
				<a href="stuff_reg_details.do?bcontext=${dto.context}" style="text-decoration: none;">사러가기</a>
			</div>	
  		</div>
	</div>
	</c:forEach>
	<button class="stuff_button" style="margin-left: 1370px; margin-bottom: 8px; margin-top:8px"><a href="stuff_reg.jsp" style="color:black; text-decoration: none;">물품 등록하러가기</a></button>
	</div>
	
    <!--footer-->
    <footer class="footer">
        <p>&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
</body>
</html>