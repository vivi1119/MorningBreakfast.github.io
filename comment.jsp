<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

  <meta charset="UTF-8">
  <title>CHECK</title>
  <link href="assets/css/index.css" rel="stylesheet" media="all">
  <link rel="stylesheet" type="text/css" href="assets/css/shopping.css">
  <!--字體/首頁-->
  <link href="https://fonts.googleapis.com/css?family=Amatic+SC|Boogaloo|Permanent+Marker&display=swap" rel="stylesheet">

  <!--search-->   
  <link rel="stylesheet" type="text/css" href="assets/css/default.css">
  <link rel="stylesheet" type="text/css" href="assets/css/component.css">
  <!--header-->
  <link rel="stylesheet" href="assets/css/style.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  

  <link rel="stylesheet" href="assets/css/shopping.css">


  <script src="assets/js/shopping.js"></script>
  


</head>
<img src="img/bg6.png" id="bg6" >
<body style="background-color:#F6E6C5 ; overflow-x: hidden; ">
    <div  id="header2">
      <div id="title" >
      <a href="index.jsp"> <font id="title-font">
      Morning<br>
      Breakfast
      </font>
      </a>
     
      </div>
    <img src="img/sun.png" id="sun">
    
   <a href="car.jsp">
    <div id="shoppingcart1">
      <img src="img/shopping-cart.png" >
    </div>
    </a>

    <div id="signin">
	<%
		if(session.getAttribute("email")==null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(!rs.next()) //未登入
			{ 	  
    %>
                   <a href = "signin.jsp" id="signin-font">
                     Sign in 
                    </a> 
		<% }
		}	
		else if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //登入
			{ %>
				  <a href = "Logout.jsp" id="signin-font">
					 Logout
				  </a>
	<%		}
	    }
		
		%>
    </div>
    

  <nav id="header3" >
     <ul  id="main">
          <li><a  href="menu.jsp" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">MEMBER</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="qa.jsp" style="font-size:23px; color:#FFFFFF;">Q&A</a></li>

               <li style="font-size:25px;"><a href="information.jsp" style="font-size:23px; color:#FFFFFF;">INFORMATION</a></li>
              
            </div>
            </ul> 
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">CONTACT US</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="about.jsp" style="font-size:23px; color:#FFFFFF;">ABOUT US</a></li>
              <li style="font-size:25px;"><a href="email.jsp" style="font-size:23px; color:#FFFFFF;">E-mail</a></li>
            </div>
            </ul> 
          </li>
          <div id="marker"></div>
        </ul>
    </nav>



    <div id="checklist2">

      <div id="name2">
        訂購人姓名:<br>
        電話:<p>
      </div>
      <div >
      	<font id=goodsfont>
      		您訂購的商品為:卡啦厚漢堡
		</font>
      	
      </div>
      <div id="comment">
      	<textarea  type="text" style="resize:none;width:300px;height:80px;">
   	 	</textarea>
      </div>

      <div >
      	<font id=goodsfont>
      		您訂購的商品為:營養小肉豆
		</font>
      	
      </div>
      <div id="comment">
      	<textarea  type="text" style="resize:none;width:300px;height:80px;">
   	 	</textarea>
      </div>
      



 
    </div>
 <button type="button" class="enter3">確定送出</button>