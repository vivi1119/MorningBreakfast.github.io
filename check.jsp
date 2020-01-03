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


    <font id="contact3">
      訂單紀錄
    </font>

   <img src="img/bg5.png" style="width: 1600px;height: 800px;position: absolute;left:0px;top:90px;z-index: -5;">
    <img src="img/bg5.png" style="width: 1600px;height: 800px;position: absolute;left:0px;top:890px;z-index: -5;">
	<%
		String sql_order="select distinct id from allyoubought WHERE email='"+session.getAttribute("email")+"'"; 
		ResultSet rs_order=con.createStatement().executeQuery(sql_order);
			
		while(rs_order.next())
		{
			//找尋是否有這個編號
			String sql_o="SELECT * FROM allyoubought WHERE id='"+rs_order.getString(1)+"'";	
			ResultSet rs_o=con.createStatement().executeQuery(sql_o);
			rs_o.next();
		
	%>
	
    <SCRIPT LANGUAGE="JavaScript"> 
	var now = new Date(); 
	myDate.value=now.getFullYear() + "-"+ (now.getMonth()+1)+"-"+now.getDate(); 
	</SCRIPT> 
	
    <div id="newbl">
      <div id="newbl1">
      <p> &ensp; 訂購人EMAIL: <input type="text" id="input4" value=<%=rs_o.getString(2)%> readonly="readonly"></p>
      </div>
    </div>
	<%}%>
	

	

    <div id="checklist">
	<form method="get" action="check.jsp">
      <table border="1" style="text-align: center;" align="center" id="table2">
            <thead style="height: 50">
                
                <td style="width: 530px">
                    商品名稱
                </td>
       
                <td style="width: 400px">
                    數量
                </td>
                <td style="width: 400px">
                    單價
                </td>
                <td style="width: 480px">
                    小計
                </td>
				<td style="width: 480px">
                    訂單狀態
                </td>

            </thead>
            <tbody>
		<%
		String sql_ox="select * from allyoubought where email='" + session.getAttribute("email")+"'"; 
		ResultSet rs_ox=con.createStatement().executeQuery(sql_ox);
		int howmany = 0 ;
		int price = 0 ;
		int subtotal = 0 ;
		int total = 0 ;
		while(rs_ox.next())
		{
			
		    howmany = Integer.valueOf(rs_ox.getString(4));
			price = Integer.valueOf(rs_ox.getString(5));
			subtotal = howmany * price ;
			total += subtotal ;
	%>
                <tr>
                    <td class="name" ><%=rs_ox.getString(3)%></td>
                   <td class="price"><%=rs_ox.getString(4)%> </td>
                    <td class="price"> <%=rs_ox.getString(5)%>  </td>
                    <td class="total"><span id="smallTotal1" name="subtotal"> <%=subtotal%> 元</td>
					<td><%=rs_ox.getString(8)%></td>
                </tr>
<%}%>
                <tr>
                  <td colspan="4"></td>
                  <td name="total">總計:<%=total%> </td>
                </tr>
          	
            </tbody>
        </table>
	</form>
    </div>
	