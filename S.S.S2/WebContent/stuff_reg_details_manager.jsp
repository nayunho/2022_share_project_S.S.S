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
        .footer{
            clear:both;
            text-align: center;
            margin-left: -8px;
            width:100%;
            border-top:1px solid black;
            padding-right:8px;
        }
        .logout{
        	text-decoration: none;
        	color:black}
        .logout:hover{
        	color:blue;
        	}
        	table{
        	width:900px;
        	height:700px;
        	margin:0 auto;
        	margin-top:10px;}
        
        .table_setting{
        text-align: center;}
        
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
<%request.setCharacterEncoding("UTF-8"); %>
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
                    <li><a href="message_show.do" style="text-decoration: none; color:black;">메세지 함</a></li>
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
    </div>
    <div class="Login">   
        <% 
        String name = (String)session.getAttribute("nicname");  %>
       <h3><%=name  %>님 안녕하세요! &nbsp;<a class="logout" type="button" href="main.jsp">로그아웃</a> </h3>
    </div>
    <!-- section-->
    <br><br><br>
    	<table >
    		<tr>
    			<td colspan="2" ><img src="upload/${content_view.file}" alt="..." style="width:900px;height:700px;"></td>
    		</tr>
    		<tr>
    			<th style="width:30%"><h2>닉 네 임</h2></th>
    			<td style="width:70%"> <h3>${content_view.nicname }</h3></td>
    		</tr>
    		<tr>
    			<th style="width:30%"><h2>위 치</h2></th>
    			<td style="width:70%"> <h3>${content_view.position }</h3></td>
    		</tr>
    		<tr>
    			<td colspan="2"><h3 style="margin-top:-10px;padding-left:30px;"> ${content_view.title }</h2><br> <h3 style="margin-top:-10px;padding-left:30px;">${content_view.context }</h3></td>
    		</tr>
    	</table>
    	<button class="stuff_button" style="width:127px;margin-left: 1260px; margin-bottom: 8px; padding: 0 20px;"><a href='stuff_details_delete_manager.do?dbfile=${content_view.file}' style="color:black; text-decoration: none;">삭제하기</a></button>
    	<button class="stuff_button" style="margin-left: 1260px; margin-bottom: 8px; padding: 0 20px;"><a href='chatting_manager.jsp?toID=${content_view.toID }' style="color:black; text-decoration: none;">채팅 하러가기</a></button>
    	
    	<div style="width:60%;margin:auto;">
    	<h1>비슷한 물품</h1>
    	<c:forEach items="${Similar_view}" var="Similar_dto">
    		<div class="stuff_main" style="width: 30%;margin-right:8px;margin-bottom: 8px;">
  				<div class="card">
					<div class="img">
						<img src="upload/${Similar_dto.file}" alt="" style="width:338px;height: 220px">
					</div>  
					<div class="text">
						<h2>물품: ${Similar_dto.title}</h2>
						<p>위치: ${Similar_dto.position}</p>
						<p>내용: ${Similar_dto.context}</p>
						<a href="stuff_reg_details_manager.do?bcontext=${Similar_dto.context}" style="text-decoration: none;">자세히 보기</a>
					</div>	
  				</div>
			</div>
		</c:forEach>
		</div>
    <!--footer-->
    <footer class="footer">
        <p>&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
</body>
</html>