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
        input[name="login"]{
            border-radius: 10px;
            margin-left:8px;
            margin-top:8px;
        }
        input[name="pw"]{
            border-radius: 10px;
            margin-left:8px;
            margin-top:5px;
        }
        input[name="loginbutton"]{
            border-radius: 10px;
            margin-left:8px;
            width:100px;
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
        .footer{
            clear:both;
            text-align: center;
            margin-left: -8px;
            width:100%;
            border-top:1px solid black;
            padding-right:8px;
        }
        .popular_search{
            float:right;
            width:17%;
            height:54px;
            margin-top:-55px;

        }
        .logout{
        	text-decoration: none;
        	color:black}
        .logout:hover{
        	color:blue;
        	}
        	 .Membercontainer{
        	width:70%;
        	margin: auto;
        }.Member_title{
        	width:100%;
        	border: 1px solid black;
        	border-radius: 10px;
        	background-color:navajowhite;
        	height:100px;
        	text-align: center;
        }
        .Member_list{
        width:100%;
        border: 1px solid black;
        border-radius: 10px;
        height:100px;
        }
        .Member_hero{
        float: left; 
        width:22.5%; 
        text-align: center;
        height: 100%;
        line-height: 60px;
        }
        .Member_delete{
        float:left;
        width:9%; 
        text-align: center;
        height: 100%;
        line-height: 60px;
        }
    </style>
</head>
<body>
        <% 
        String name = (String)session.getAttribute("nicname");  %>
    <!-- nav-->
    <div class="main_Logo_menu">
    <a class="Logo" href="home_manager.do">S.S.S</a>
    
        <ul class="category">
            <li>
                <a>물품</a>
                <ul>
                    <li><a href="reg_show_manager.do" style="text-decoration: none; color:black;">물품 보기</a></li>
                </ul>
            </li>
            <li>
                <a>메세지</a>
                <ul>
                    <li><a href="message_show_manager.do?dbnicname=<%=name  %>" style="text-decoration: none; color:black;">메세지 함</a></li>
                </ul>
            </li>
            <li>
                <a>회원</a>
                <ul>
                    <li><a href="member_management_manager.do" style="text-decoration: none; color:black;">회원 관리</a></li>
                </ul>
            </li>
        </ul>
        <div class="search">
        <form action="search_manager.do">
            <input name="search_stuff" type="text" placeholder="물품을 검색해주세요!" style="height: 35px;border-radius:10px;">

            <input name="searchbutton" type="submit" value="검색" >
            </form>
        </div>
    </div>
    <div class="Login">   
       <h3><%=name  %>님 안녕하세요! &nbsp;<a class="logout" type="button" href="main.jsp">로그아웃</a> </h3>
    </div>
    <!-- section-->
    <br><br><br><br>
    <div class="Membercontainer">
    	<div class="Member_title">
    		<h2 style="line-height: 60px;">회원 정보</h2>
    	</div>
    		<c:forEach items="${memberList}" var="dto1">
    		<div class="Member_list" style="margin-top: 10px;">
    			<div class="Member_hero"><h2>${dto1.nicname}</h2></div>
    			<div class="line" style="border-left:1px solid black; width:1px;height: 100%;float:left"></div>
    			<div class="Member_hero"><h2>${dto1.pw}</h2></div>
    			<div class="line" style="border-left:1px solid black; width:1px;height: 100%;float:left"></div>
    			<div class="Member_hero"><h2>${dto1.email}</h2></div>
    			<div class="line" style="border-left:1px solid black; width:1px;height: 100%;float:left"></div>
    			<div class="Member_hero"><h2>${dto1.number}</h2></div>
    			<div class="line" style="border-left:1px solid black; width:1px;height: 100%;float:left"></div>
    			<div class="Member_delete"><h2><a href="Member_delete.do?toemil=${dto1.email}" style="text-decoration: none;color:black">퇴출하기</a></h2></div>
    			
    		</div>
    		</c:forEach>
    </div>
</body>
</html>