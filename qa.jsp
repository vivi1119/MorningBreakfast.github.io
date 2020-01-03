<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>Q&A</title>
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
 	
 	<link rel="stylesheet" href="assets/css/qa.css">
 	


</head>
<body style="background-color:#F6E6C5 ; overflow-x: hidden;">
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


    <img src="img/bg5.png" id="bg5">
    <img src="img/bg5.png" id="bg6">
    <img src="img/answer.png" id="answer">
    <img src="img/hospitality.png" id="hospitality">

    <div id="block" class="div_shadow1">
      <p class="q1">Q:食材新鮮安全嗎?</p>
      <p class="a1">食材肉品運送過程都有低度監控，雞蛋選自來自有機牧場的新鮮雞蛋、無噴灑農藥的生菜，食材也會定期檢驗抽查，讓消費者吃得安心又健康!</p>

    </div>


    <div id="block2" class="div_shadow1">
      <p class="q1">Q:我想要客製化我的早餐，可以嗎?</p>
      <p class="a1">當然沒問題!只要在備註欄打上您需要的客製服務，就會為您客製化喔!</p>
    </div>

    <img src="img/food.png" id="deliver" class="hvr-wobble-horizontal">

      <div id="block3" class="div_shadow1">
      <p class="q1">Q:商品可以退貨嗎?</p>
      <p class="a1">基於食品安全問題，不接受退貨退款唷!感謝您的體諒!</p>
    </div>

    <img src="img/no-turn.png" id="turn" class="hvr-pulse-grow">

  <div id="a">
 <p class="f">COPYRIGHT@Morning Breakfast</p>
  </div>
			
	</body>

	</html>