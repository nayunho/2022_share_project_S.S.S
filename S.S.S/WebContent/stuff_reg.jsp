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
        table{
        margin:auto;
        margin-top:10px;}
        .table_setting{
        text-align: center;}
    </style>
</head>
<body>
        <% 
        String nicname = (String)session.getAttribute("nicname");  %>
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
                    <li><a href="message_show.do?dbnicname=<%=nicname  %>" style="text-decoration: none; color:black;">메세지 함</a></li>
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
       <h3><%= nicname  %>님 안녕하세요! &nbsp;<a class="logout" type="button" href="main.jsp">로그아웃</a> </h3>
       
    </div>
    <!-- section-->
    <br><br><br>
    <div class="table_setting">
    <h2>물건을 등록해주세요!</h2>
    
	<form action="reg.do" method="POST" enctype="multipart/form-data" accept-charset="utf-8">
    <table >
    	<tr>
    		<th colspan="2">
    			<img id="preview" name="img" style="width:600px;height: 500px"/>
    			<br>
    			<input type="file" name="file" onchange="readURL(this);" accept="image/*">
    			
    			<script> function readURL(input) {
					if (input.files && input.files[0]) {
					    var reader = new FileReader();
					    reader.onload = function(e) {
					      document.getElementById('preview').src = e.target.result;
					    };
					    reader.readAsDataURL(input.files[0]);
					    
					  } else {
					    document.getElementById('preview').src = "";
					  }
				}</script>
    		</th>
    	</tr>
    	<tr>
    		<td>닉네임: </td>
    		<td style="border:1px"><input style="font-size:larger;  width:423px; text-align: center" type="text"  name="nicname" value= <%= nicname  %>> </td>
    	</tr>
    	<tr>
    		<td>위치:</td>
    		<td><select name="position" style="font-size:larger; width:430px; text-align: center">
    		<optgroup label="선택해주세요" >
    			<option>공학관</option>
    			<option>대학본부</option>
    			<option>의학관</option>
    			<option>인문2관</option>
    			<option>대학본부별관</option>
    			<option>자연과학관</option>
    			<option>생명과학관</option>
    			<option>일송아트홀</option>
    			<option>사회·경영관</option>
    			<option>기초교육관</option>
    			<option>학군단</option>
    			<option>학생생활관 </option>
    			<option>한림레크리에이션센터</option>
    			<option>춘천성심병원</option>
    			<option>산학협력관</option>
    			<option>Campus </option>
    			</optgroup>
    		</select></td>
    	</tr>
    	<tr>
    		<td>상품 이름: </td>
    		<td><input style="font-size:larger;  width:423px; text-align: center" name="title" type="text"></td>
    	</tr>
    	<tr>
    		<td>상세 내용: </td>
    		<td><textarea cols=50 rows="50" name="context" style="resize: none; font-size:30px;width:428px; height: 200px"></textarea></td>
    	</tr>
	</table>
	<input type="submit" class="stuff_button" style="margin-left: 1370px; margin-bottom: 8px" value="등록하기"></button>
	</form>
	<button class="stuff_button" style="margin-left: 1370px; margin-bottom: 8px; padding: 0 20px;"><a href="reg_show.do" style="text-decoration: none;color:black">취소</a></button>

	</div>
    <!--footer-->
    <footer class="footer">
        <p>&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
</body>
</html>