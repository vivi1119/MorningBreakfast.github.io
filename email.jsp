<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>E-mail</title>
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
 

  <link rel="stylesheet" type="text/css" href="assets/css/hambuger.css">
  <link rel="stylesheet" type="text/css" href="assets/css/email.css">


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
              <li style="font-size:25px;"><a href="check.jsp" style="font-size:23px; color:#FFFFFF;">Order</a></li>
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

    <img src="img/bg4.png" id="Card2">
      <img src="img/bg4.png" id="Card3">
   
   
   <div id="e1">
	<% String sql_2="select * from comsumer where email='"+session.getAttribute("email")+"'"; 
	   ResultSet rs_0=con.createStatement().executeQuery(sql_2);
	   rs_0.next();  %>
   		<div id="contact">
   			聯絡我們
   		</div>
		<form method="get" action="coment.jsp">
   		<div id="e2">
   			Step1. &ensp;您的E-mail<p>
   			(Please write down your E-mail)<p>
   			<input type="text" id="input1" value=<%=rs_0.getString(3)%> readonly="readonly" name="email" >
   		</div>
   		<div id="e2">
   			Step2. &ensp;您的姓名<p>
   			(Please write down your E-mail)<p>
   			<input type="text" id="input1" value=<%=rs_0.getString(2)%> readonly="readonly" name="name">
   		</div>
   		<div id="e2">
   			Step3. &ensp;留言日期<p>
   			(Please write down your E-mail)<p>
   			<input type="text" id="myDate" readonly="readonly" name="date" >
			
	<SCRIPT LANGUAGE="JavaScript"> 
	var now = new Date(); 
	myDate.value=now.getFullYear() + "-"+ (now.getMonth()+1)+"-"+now.getDate(); 
	</SCRIPT> 
	
   		</div>
   		<div id="e3">
   			Step4. &ensp;請輸入您需要與我們聯繫的事項<p>
   			(Please write down your Question)<p>
   			<textarea  id="input2" style="resize: none;" name="coment" >
            GOOD !
   			</textarea>
   		</div>
   </div>
<button type="submit" class="enter">送出</button>
</form>



   <div id="a1">
 <p class="f">COPYRIGHT@Morning Breakfast</p>
  </div>
 