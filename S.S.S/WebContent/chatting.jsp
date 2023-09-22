<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>   
        <% 
        String nicname = (String)session.getAttribute("nicname"); 
        String userID = (String)session.getAttribute("userID"); 
        String toID = null;
        toID=(String)request.getParameter("toID");
        if(userID.equals(toID)){
			out.println("<script> alert('자기자신입니다.')</script>");
			out.println("<script>location.href='reg_show.do'</script>");
		}
        %>
        
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S.S.S</title>
    

    <script type="text/javascript" >

    	function autoClosingAlert(selector,delay){
    		var alert =$(selector).alert();
    		alert.show();
    		window.seTiimeout(function(){alert.hide()},delay);
    		}
    	function submitFunction(){
    		var fromID='<%= userID%>';
    		var toID='<%= toID%>';
    		var chatContent= $("#chatContent").val();
    		$.ajax({
    			type:"post",
    			url:"chatting_resend.do",
    			data:{
    				fromID:encodeURIComponent(fromID),
    				toID:encodeURIComponent(toID),
    				chatContent:encodeURIComponent(chatContent),
    			},
    			sucess:function(result){
    				if(result==1){
    					autoClosingAlert("#succesMessage",2000);
    				}else if(result==0){
    					autoClosingAlert("#dangerMessage",2000);
    				}else{
    					autoClosingAlert("#warningMessage",2000);
    				}
    			}
    		});
			$("#chatContent").val(" ");
    	}
    	var lastID=0;
    	function chatListFunction(type) {
    		var fromID='<%= userID%>';
    		var toID='<%= toID%>';
    		
    		$.ajax({
    			type:"post",
    			url:"chatting_List.do",
    			data:{
    				fromID:encodeURIComponent(fromID),
    				toID:encodeURIComponent(toID),
    				listType:encodeURIComponent(type),
    			},
    			success:function(data){

    				console.log(data);
    				if(data== ""){return;}
    				var parsed=JSON.parse(data);
    				var result=parsed.result;
    				for(var i=0;i<result.length;i++){
    					addChat(result[i][0].value,result[i][2].value,result[i][3].value);
    				}
    				lastID=Number(parsed.last);
    			}
    		});
		}
    	function addChat(chatName,chatContent,chatTime) {
			$("#chatList").append('<div class="row">'+
					'<div class="col-lg-12">'+
					'<div class="media">'+
					'<div class="media-body">'+
					'<h4 class="media-heading">'+
					chatName+"&nbsp"+
					'<span class="small pull-right">'+
					chatTime+
					'</span>'+
					'</h4>'+
					'<p>'+
					chatContent+
					'</p>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'<hr>');
	    	$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
		}
    	function getInfiniteChat() {
			setInterval(function() {
			chatListFunction(lastID);
			}, 3000);
		}

    </script>
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
        	.chatting{
        	width:60%;
        	margin:auto;}
        	.portlet {
    margin-bottom: 15px;
}
.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}
.portlet {
    border: 1px solid;
}
.portlet .portlet-heading {
    padding: 0 15px;
    
}
.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}
.portlet .portlet-heading a {
    color: #fff;
}
.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}
.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}
.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}
.portlet .portlet-heading .portlet-title {
    float: left;
}
.portlet .portlet-heading .portlet-title h1 {
    margin: 10px 0;
}
.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}
.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}
.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}
.portlet .portlet-body {
    padding: 15px;
    background:red #fff;
}
.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}
.portlet .portlet-footer ul {
    margin: 0;
}
.portlet-green,
.portlet-green>.portlet-heading {
    border-color: #16a085;
}
.portlet-green>.portlet-heading {
    color: #fff;
    background-color: #16a085;
}
.portlet-orange,
.portlet-orange>.portlet-heading {
    border-color: #f39c12;
}
.portlet-orange>.portlet-heading {
    color: #fff;
    background-color: #f39c12;
}
.portlet-blue,
.portlet-blue>.portlet-heading {
    border-color: #2980b9;
}
.portlet-blue>.portlet-heading {
    color: #fff;
    background-color: #2980b9;
}
.portlet-red,
.portlet-red>.portlet-heading {
    border-color: #e74c3c;
}
.portlet-red>.portlet-heading {
    color: #fff;
    background-color: #e74c3c;
}
.portlet-purple,
.portlet-purple>.portlet-heading {
    border-color: #8e44ad;
}
.portlet-purple>.portlet-heading {
    color: #fff;
    background-color: #8e44ad;
}
.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}
.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}
.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}
@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}
.img-chat{
width:40px;
height:40px;
}
.text-green {
    color: #16a085;
}
.text-orange {
    color: #f39c12;
}
.text-red {
    color: #e74c3c;
}                
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body>

    	<% 
    	String userID1 = (String)session.getAttribute("userID"); 
        String toID1 = null;
        toID1=(String)request.getParameter("toID");
    		
    	%>
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
            <form action="search_manager.do">
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
   
   <div class="container bootstrap snippet" style="width:70%;margin:auto; margin-top:10px;">
   		<h1><i class="fa fa-circle text-green" style="color:black">실시간 채팅</i></h1>
   		<div class="row">
   			<div class="col-xs-12">
   				<div class="portlet portlet-default">
   					<div class="portlet-heading">
   						
   						<div class="clearfix"></div>
   					</div>
   					<div id="chat" class="panel-collapse collapse in">
   						<div id="chatList" class="porlet-body chat-widget" style="overflow-y:auto; width:auto;height: 600px; ">
   						</div>
   						<div class="portlet-footer"style="height: 100px ">
   							<div class="row" style="height: 90px;">
   								<div class="form-group col-xs-10">
   									<textarea style="height: 80px;width:70%" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>
   								</div>
   								<div class="form-group col-xs-2" >
   									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();" style="float:right;margin-top:-8px;">전송</button>
   									<div class="clearfix"></div>
   								</div>
   							</div>
   						</div>
   					</div>
   				</div>
   			</div>
   		</div>
   </div>
    <!--footer-->
    <footer class="footer" >
        <p>&copy; S<small>tuff</small>.S<small>hare</small>.S<small>ite</small></p>
    </footer>
    <script type="text/javascript">
    	$(document).ready(function() {
    		chatListFunction("ten");
			getInfiniteChat();
		})
		
    </script>
</body>
</html>