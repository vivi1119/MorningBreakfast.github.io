<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>MENU</title>
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
 
  <script src="assets/js/botton.js"></script>
  <link rel="stylesheet" type="text/css" href="assets/css/hambuger.css">
  <link rel="stylesheet" type="text/css" href="assets/css/sandwitch.css">
  <link rel="stylesheet" type="text/css" href="assets/css/quiche.css">
  <link rel="stylesheet" type="text/css" href="assets/css/snack.css">
  <link rel="stylesheet" type="text/css" href="assets/css/drink.css">



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
    
    <div class="column" style="position:absolute;left:1000px;top:20px;">
          <div id="sb-search" class="sb-search">
            <form>
              <input class="sb-search-input" placeholder="Enter your search.." type="text" value="" name="search" id="search">
              <input class="sb-search-submit" type="submit" value="">
              <span class="sb-icon-search"></span>
            </form>
          </div>
  </div>
        <script src="assets/js/classie.js"></script>
        <script src="assets/js/uisearch.js"></script>
        <script>
          new UISearch( document.getElementById( 'sb-search' ) );
        </script>
	<nav id="header3" >
  		<ul  id="main">
          <li><a  href="hamburger.jsp" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
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
			sql="select email from manager where email='" + session.getAttribute("email")+"'"; 
			ResultSet rss=con.createStatement().executeQuery(sql);  
			if(rs.next()|| rss.next()) //已登入
			{ %>
              <li style="font-size:25px;"><a href="information.jsp" style="font-size:23px; color:#FFFFFF;">INFORMATION</a></li>
		 <% } 
		}%>
              
            </div>
            </ul> 
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">CONTACT US</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="about.jsp" style="font-size:23px; color:#FFFFFF;">ABOUT US</a></li>
         <% 	
		if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //已登入
		{ %>
              <li style="font-size:25px;"><a href="email.jsp" style="font-size:23px; color:#FFFFFF;">E-mail</a></li>
            </div>
		 <% } 
		}%>
            </div>
            </ul> 
          </li>
          <div id="marker"></div>
        </ul>
    </nav>
 
<%

                    sql = "Select id , kinds , price , stock , photo , link FROM product ";
					ResultSet rec = con.createStatement().executeQuery(sql);
					sql = "Select id , kinds , price , stock , photo , link FROM product ";
                    ResultSet recc = con.createStatement().executeQuery(sql);
					int  count = 0;
                    while ( rec.next()) 
						{
						
						String linkstring = rec.getString(6);
						String photostring = rec.getString(5);
						String stockstring = rec.getString(4);
						String pricestring = rec.getString(3);
						String kindsstring = rec.getString(2);

						
						    if ( count  == 0 ) {
								out.println("<table width='100%' height='100%'>") ;
								
							} 
							if ( count % 3 == 0 && count != 0 ) {
								out.println("<tr>") ;
							} 
							
							out.println("<td align='center' valign='center' width = '33%'>") ;
							out.println("<a href='"+ linkstring + "'><img src='img/" + photostring + "' width='200' height='150' ></a><br>" ) ;
							out.println(kindsstring + "$" + pricestring ) ;
							out.println("</td>") ;
							count++ ;
							
							if ( count % 3 == 0 && count != 0 ) {
								out.println("</tr>") ;
							} 
							
						} 
						out.println("</table>") ;
					

%>




    <!--footer-->
  
    <p class="f">COPYRIGHT@Morning Breakfast</p>
  
 
      
	</body>

	</html>
