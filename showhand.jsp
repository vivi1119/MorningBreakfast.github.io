<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>Morning Breakfast</title>

  <!--字體/首頁-->
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
	


  <script src="assets/js/botton.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/all.css">

  
   
</head>
<body style="background-color:#F6E6C5 ;  overflow-x: hidden;">
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
    <div id="signin">
	<%
		if(session.getAttribute("email")==null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rsq=con.createStatement().executeQuery(sql);  
			if(!rsq.next()) //未登入
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
			ResultSet rse=con.createStatement().executeQuery(sql);  
			if(rse.next()) //登入
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
          <li><a href="menu.jsp" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">MEMBER</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="qa.jsp" style="font-size:23px; color:#FFFFFF;">Q&A</a></li>
        <% 	
		if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rsz=con.createStatement().executeQuery(sql);  
			if(rsz.next()) //已登入
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
  
<%
	String idd = request.getParameter("page");
	con.createStatement().execute("USE test");
    String sqll = "SELECT * FROM product WHERE  id  =   '"+idd+ "'" ;
    ResultSet rec =  con.createStatement().executeQuery(sqll);
	rec.next() ; 
						String photostring = rec.getString(6);
						String stockstring = rec.getString(5);
						String pricestring = rec.getString(4);
						String kindsstring = rec.getString(2);
						String pid = rec.getString(1);
						
%>
<div class="top div_shadow1">
</div>

	<div id="h1" >
		<img src="img/<%= photostring %>" id="size" >
		<font id="h1font">
			<%= kindsstring %>
		</font>
	</div>
	
<font id="content1">
     
 
</font>



<div id="h2font">
    庫存:
	<%= stockstring %>
	</div>
	<form action = "adddata.jsp" ><input type="submit" class="plus" value = "加入購物車" >
			<div class="q">


				<input type="number" name="quantity" value="1"min="1" class="qty" />
				<input hidden value ="<%= pid %>" name = "id" />
		
		</form>
</div>


<!--comment-->
<div class="commentfont">
  COMMENT
</div>

	<%    
	   String sqlx="select email , comment , date  from board ORDER by id DESC "; 
	   ResultSet rsx=con.createStatement().executeQuery(sqlx);
	   int count = 2 ;
	   while ( rsx.next()  ) {
		   String emaill = rsx.getString(1);
		   String commentt = rsx.getString(2);
		   String datee = rsx.getString(3);

%>
<div class="comment<%=count%>">
  <div class="comment div_shadow1">
  </div>
  <div class="photo">
    <img src="img/photo.jpg" class="photo1">
  </div>
  <font class="email"><!--電子郵件位置-->
  <%=emaill%>
  </font>
   <font class="finalltcomment"><!--評論位置-->
  <%=commentt%>
  </font>
  <font class="day"><!--日期-->
  <%=datee%>
  </font>
</div>

<%
			count = 3 ;
		}
%>

