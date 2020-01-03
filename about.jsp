<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>About Us</title>
	<link href="assets/css/index.css" rel="stylesheet" media="all">
  <link href="https://fonts.googleapis.com/css?family=Amatic+SC|Boogaloo|Permanent+Marker&display=swap" rel="stylesheet">
  <script src="assets/js/jquery.min.js"></script>
  
  <!-- <script src="assets/js/jquery.min.js"></script> 
  <script src="assets/js/main.js"></script>-->   
  <!--search-->
  <link rel="stylesheet" type="text/css" href="assets/css/default.css">
  <link rel="stylesheet" type="text/css" href="assets/css/component.css">
  <!--header-->
  <link rel="stylesheet" href="assets/css/style.css">
  
  
  <!--輪播-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!--輪播 動-->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <!--hover特效-->
  <link href="assets/css/hover-min.css" rel="stylesheet" media="all">

  <link rel="stylesheet" type="text/css" href="assets/css/hambuger.css">
  <link rel="stylesheet" type="text/css" href="assets/css/aboutus.css">


</head>
<body style="background-color:#F6E6C5;overflow-x: hidden; ">
   <div  id="header2">
       <div id="title" >
      <a href="index.jsp"> <font id="title-font">
      Morning<br>
      Breakfast
      </font>
      </a>
  </div>
    <img src="img/sun.png" id="sun">
	<% 	
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rrs=con.createStatement().executeQuery(sql);  
			if(rrs.next()) { //已登入
	 %>
   <a href="car.jsp">
      <div id="shoppingcart1">
      <img src="img/shopping-cart.png" >
      </div>
   </a>
		<%}%>

	<%
		if(session.getAttribute("email")==null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql); 
			sql="select email from manager where email='" + session.getAttribute("email")+"'"; 	
			ResultSet rss=con.createStatement().executeQuery(sql); 			
			if(!rs.next() || !rss.next()) //未登入
			{ 	  
    %>			<div id="signin">
                   <a href = "signin.jsp" id="signin-font">
                     Sign in 
                    </a> 
				</div>
		<% }
		}
		else if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			sql="select email from manager where email='" + session.getAttribute("email")+"'"; 	
			ResultSet rss=con.createStatement().executeQuery(sql); 	
			if(rs.next() ) //登入
			{ %> 
				<div id="signin">
				  <a href = "Logout.jsp" id="signin-font">
					 Logout
				  </a>
				</div>
	<%		}
	        else if ( rss.next()) 
			{ %>
				<div id="signin">
				  <a href = "Logout.jsp" id="signin-font">
					 Logout
				  </a>
				</div>
				<div id="back">
					<a href = "back.jsp" id="back-font">
						後台 
					</a>
				</div>
		<%	}
	    }%>
   
	<nav id="header3" >
  		<ul  id="main">
          <li><a  href="menu.jsp" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">MEMBER</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="qa.jsp" style="font-size:23px; color:#FFFFFF;">Q&A</a></li>
            
            <% 	
		if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //已登入
			{ %>
              <li style="font-size:25px;"><a href="information.jsp" style="font-size:23px; color:#FFFFFF;">INFORMATION</a></li>
		 <% } 
		}%>
		<%if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //已登入
		{ %>
              <li style="font-size:25px;"><a href="check.jsp" style="font-size:23px; color:#FFFFFF;">ORDER</a></li>
		 <% } 
		}%>

              
            </div>
            </ul> 
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">CONTACT US</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="about.jsp" style="font-size:23px; color:#FFFFFF;">ABOUT US</a></li>
            </div>

            </ul> 
          </li>
          <div id="marker"></div>
        </ul>

    </nav>


    <img src="img/ha.png" id="ha">
  
  	<div>
          <p class="pro pro1">About Us_</p> 
  	</div>


<img src="img/bg2.png"  class="bg">


  	<div class="div_shadow div_shadow1">
  		<div id="bgh1">
 		</div>
  			<img src="img/yifan.jpg" id="a1" >
  			<font id="a1font">
    			楊依凡
  			</font>
  			
  			<font id="a1font1">
  				<a class="hvr-grow">
  				資管二甲<p>
   				前台設計<p>
  				</a>
  			</font> 
	</div>
	<div class="div_shadow2 div_shadow1">
  		<div id="bgh1">
 		</div>
  			<img src="img/vivi.jpg" id="a1" >
  			<font id="a1font">
    			張詠晴
  			</font>
  			<font id="a1font1">
  				<a class="hvr-grow">
  				資管二甲<p>
   				前台設計<p>
   				</a>
  			</font>
	</div>
	<div class="div_shadow3 div_shadow1">
  		<div id="bgh1">
 		</div>
  			<img src="img/ping.jpg" id="a1" >
  			<font id="a1font">
    			周心平
  			</font>
  			<font id="a1font1">
  				<a class="hvr-grow">
  				資管二甲<p>
   				後台設計<p>
   				</a>
  			</font>
	</div>
	<div class="div_shadow4 div_shadow1">
  		<div id="bgh1">
 		</div>
  			<img src="img/cheng.jpg" id="a1" >
  			<font id="a1font">
    			陳昭綸
  			</font>
  			<font id="a1font1">
  				<a class="hvr-grow">
  				資管二甲<p>
   				後台設計<p>
   				</a>
  			</font>
	</div>



  <div id="a2">
 <p class="f">COPYRIGHT@Morning Breakfast</p>
  </div>