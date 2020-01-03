<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>Sign up</title>
	<link href="assets/css/index.css" rel="stylesheet" media="all">
	<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Boogaloo|Permanent+Marker&display=swap" rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="assets/css/default.css">
	<link rel="stylesheet" type="text/css" href="assets/css/component.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/font/*">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <link rel="stylesheet" type="text/css" href="assets/css/signin.css">
   <link rel="stylesheet" type="text/css" href="assets/css/signup.css">

</head>
<body style="background-color:#FFE082 ;overflow-x: hidden; ">

    

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
		   <% 	
		if(session.getAttribute("email")!=null)
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



  

  <div class="form-bg">
    <div class="container1" >
        <div class="row sign size1">
            <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
                <form class="form-horizontal" method="GET" action="register.jsp">
                    <div class="heading">Sign Up Form</div>
                    <div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="username" type="text" class="form-control" placeholder="Username" id="exampleInputEmail1" >
                    </div>
					<div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="tel" type="text" class="form-control" placeholder="Phone Number" id="exampleInputEmail1" >
                    </div>

                    <div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="birthday" type="date" class="form-control" placeholder="Birthday" id="exampleInputEmail1" >
                    </div>

                    <div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="email" type="email" class="form-control" placeholder="E-mail" id="exampleInputEmail1" >
                    </div>

                    <div class="form-group">
                        <i class="fa fa-lock"></i><input required="" name="password" type="password" class="form-control" placeholder="Password" >
                    </div>



                    <div class="form-group">
                        <button type="submit" class="btn btn-default" ><i class="fa fa-arrow-right"></i></button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div> 


<div class="size">
  
</div>

<img src="img/bg4.png" class="bgs">
 


  </body>

  </html>