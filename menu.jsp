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
 
  <script src="website/assets/js/botton.js"></script>
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
    
    <div class="column" style="position:absolute;left:1000px;top:20px;">
          <div id="sb-search" class="sb-search">
            <form action = "searching.jsp" >
              <input class="sb-search-input" placeholder="Enter your search.." type="text" name="search_word" id="search">
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
 


<!-- 這裡改-->

<!-- 方塊1-->
<%
					sql = "Select id , kinds , price , stock , photo  FROM product ";
                    //SQL語法，選擇要顯示的欄位。
                    ResultSet rec = con.createStatement().executeQuery(sql);

					int count = 0 ; 
					int toshadow = 1 ;
					
                    while ( rec.next()) 
					{
						if( count == 0 ){
							
							out.println("<div id='height0'>");
							out.println("<img src='img/ha.png' id='ha'>");
  
							out.println("<div>");
							out.println("<p class='pro pro1'>FOOD_</p>");
							out.println("</div>");
							
						}
						else if ( count % 3 == 0 ) {
						out.println( "<div  id=heigh" +count/3+ ">" ) ;
						}
						
						
						
						String photostring = rec.getString(5);
						String stockstring = rec.getString(4);
						String pricestring = rec.getString(3);
						String kindsstring = rec.getString(2);
						String pid = rec.getString(1);
						if ( toshadow % 3 == 1 )
							out.println("<div class='div_shadow div_shadow1'>") ;
						else 
							out.println("<div class='div_shadow"+toshadow+" div_shadow1'>") ;
						
						out.println("<div id='bgh1'>") ;
						out.println("</div>") ;
						%>
						
						<%
						out.println("<a href='showhand.jsp?page=" + pid + "'class='hvr-buzz'><img src='img/"+photostring+"' id='h1' ></a>") ;
						out.println("<font id='h1font'>") ;
						out.println( kindsstring + "$" + pricestring ) ;
						out.println("</font>") ;
						out.println("</div>") ;
						count = count + 1  ;

						
						if ( count % 3 == 0 ) 
						{
							out.println("</div>");
							
							
						}
						
						toshadow = toshadow % 3 + 1 ;
						
					} 
					


%>


    <!--footer-->



 
      
	</body>

	</html>