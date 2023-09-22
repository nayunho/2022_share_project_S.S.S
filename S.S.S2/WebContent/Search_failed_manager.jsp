<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .no_search{
        width:60%;
        margin:auto;}
    </style>
</head>
<body>
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
    <br><br><br><br><br>
    <div class="no_search">
    	<table border="1" style="width: 100%; height: 500px; margin:auto;">
    		<tr>
    		<th>
    			<h1>검색한 데이터가 없습니다.</h1></th>
    		</tr>
    	</table>
    	<button class="stuff_button" style=" padding:10px 1px; float:right; ;margin-top: 8px"><a href="reg_show_manager.do" style="text-decoration: none; color:black;">물품 보기</a></button>
    </div>
    <!--footer-->
    <footer class="footer" style="position: fixed;left:0;bottom: 0;right: 0">
        <p>&copy; S<small>suff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
</body>
</html>