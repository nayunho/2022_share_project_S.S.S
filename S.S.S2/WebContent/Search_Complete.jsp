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
        .search_container a{
        	background: black;
        	color:white;
        	border:2px solid white;
        	border-radius: 5px;
        	padding:5px 10px;
        	font-size:10px;
        	transition:.5s ease;
        }
        .search_container a:hover{
        	transition:.5s ease;
        	border:2px solid black;
        	background: transparent;
        	color:black;
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
        	.card{
        	display: flex;
        	flex-direction:column;
        	}
    </style>
</head>
<body>
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
                    <li><a href="message_show.do" style="text-decoration: none; color:black;">메세지 함</a></li>
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
        <% 
        String name = (String)session.getAttribute("nicname");  %>
       <h3><%=name  %>님 안녕하세요! &nbsp;<a class="logout" type="button" href="main.jsp">로그아웃</a> </h3>
       
    </div>
    <!-- section-->
   <br><br><br>
   
   	<div class="card" style="width:60%;margin:auto;">
   		<h2>다음 물품들이 검색되었습니다!</h2>
   		<c:forEach items="${search_stuff}" var="dto">
    	<div class="search_container"style="margin-bottom: 8px;">
    		<table border="1" style="height: 200px;">
    			<tr>
    			<th rowspan="2" style="width: 30%"><img src="upload/${dto.file}" width=300 height=220 ></th>
    			<td style="width: 70%"><h2>물품: ${dto.title}</h2></td>
    			</tr>
    			<tr><td><h3>내용: ${dto.context}</h3>
    			<a href="stuff_reg_details.do?bcontext=${dto.context}" style="text-decoration: none;">자세히보기</a>
    			</td></tr>
    		</table>
    	</div>
    	</c:forEach>
	</div>
    <!--footer-->
    <footer class="footer">
        <p>&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
</body>
</html>